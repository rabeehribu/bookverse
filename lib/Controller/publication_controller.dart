

import 'dart:developer';
import 'dart:io';

import 'package:bookverse/Model/add_book_publications.dart';
import 'package:bookverse/Views/publications/publiction_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/library_book_model.dart';
import '../Model/library_model.dart';
//___________________________________Authentication CONTROL______________________________________//

class PublicationAuthenticationProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  LibraryModel? _publicationModel;

  LibraryModel get publicationModel => _publicationModel!;

  Future<void> saveUser(String libraryId,
      String email,
      String libraryName,
      String location,) async {
    final userDoc = firebaseFirestore.collection("publications").doc(libraryId);
    _publicationModel = LibraryModel(
        libraryId: libraryId,
        email: email,
        libraryName: libraryName,
        location: location);
    await userDoc.set(_publicationModel!.toMap());
  }

  Future signUp(String email,
      String libraryName,
      String location,
      String password,
      context,) async {
    try {
      print('/////////////////////USER SIGNUP//////////////////////');
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = firebaseAuth.currentUser;
      user!.sendEmailVerification();
      await saveUser(user.uid, email, libraryName, location);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Its Successfull")));
    } catch (e) {
      print('////////////////////////SIGNUP ERROR///////////////////////////');
      print(e);
    }
    notifyListeners();
  }

  Future<void> signIn(String email,
      String password,
      context,) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = firebaseAuth.currentUser;
      final emailveri = user!.emailVerified;
      if (emailveri == false) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please verify your email")));
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Publications_Home(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please verify your email!!!')));
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    notifyListeners();
  }
  //_______________________________AddBooks CONTROL______________________________________//

  TextEditingController bookNameController = TextEditingController();
  TextEditingController authorNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController bookRateController = TextEditingController();
  TextEditingController aboutBooksController = TextEditingController();

  final addBooksKey = GlobalKey<FormState>();

  AddBooksPubModel? _addBooksModel;
  AddBooksPubModel get addBooksModel => _addBooksModel!;

  Future<void> saveBook(
      String bookName,
      String imageURL,
      String authorName,
      String category,
      String bookRate,
      String aboutBooks,
      ) async {
    try {
      _addBooksModel = AddBooksPubModel(
        bookId: bookName,
        bookName: bookName,
        imageURL: imageURL,
        authorName: authorName,
        category: category,
        bookRate: bookRate,
        aboutBooks: aboutBooks,
      );

      await firebaseFirestore
          .collection('library')
          .doc(firebaseAuth.currentUser!.uid)
          .collection("books")
          .doc(bookName)
          .set(_addBooksModel!.toMap());
      print('**********Book Stored*******');
    } catch (e) {
      print("Book storing failed : $e");
    }

    notifyListeners();
  }

  List<AddBooksPubModel> booksList = [];
  AddBooksPubModel? book;

  Future<void> fetchBooks() async {
    try {
      booksList.clear();

      CollectionReference booksRef = firebaseFirestore
          .collection('library')
          .doc(firebaseAuth.currentUser!.uid)
          .collection("books");
      QuerySnapshot bookSnapshot = await booksRef.get();

      for (var doc in bookSnapshot.docs) {
        String bookId = doc['bookId'];
        String bookName = doc['bookName'];
        String imageURL = doc['imageURL'] ?? '';
        String authorName = doc['authorName'];
        String category = doc['category'];
        String bookRate = doc['bookRate'] ?? '';
        String aboutBook = doc['aboutBook'] ?? '';

        book = AddBooksPubModel(
          bookId: bookId,
          bookName: bookName,
          imageURL: imageURL,
          authorName: authorName,
          category: category,
          bookRate: bookRate,
          aboutBooks: aboutBook,
        );
        booksList.add(book!);
      }
      print('*********BOOKS FETCH COMPLETE***********');
    } catch (e) {
      print(e);
    }
  }

  Future<String> storeImageToStorage(String ref, File file) async {
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask =
    firebaseStorage.ref().child(ref).putFile(file, metadata);
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    log(downloadURL);
    notifyListeners();
    return downloadURL;
  }

  File? bookImage;

  Future<File> pickBookImage(context) async {
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        bookImage = File(pickedImage.path);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return bookImage!;
  }

  Future<void> selectBookImage(context) async {
    bookImage = await pickBookImage(context);
    notifyListeners();
  }

  uploadBookImage(File bookPhoto, String bookName) async {
    await storeImageToStorage('publications Images/$bookName', bookPhoto).then(
          (value) async {
        addBooksModel.imageURL = value;

        DocumentReference docRef = firebaseFirestore
            .collection('publications')
            .doc(firebaseAuth.currentUser!.uid)
            .collection("books")
            .doc(bookName);
        docRef.update({'bookImage': value});
      },
    );
    _addBooksModel = addBooksModel;
    print('Pic uploaded successfully');
    notifyListeners();
  }

  clearFields() {
    bookNameController.clear();
    authorNameController.clear();
    categoryController.clear();
    bookRateController.clear();
    aboutBooksController.clear();

    notifyListeners();
  }
}