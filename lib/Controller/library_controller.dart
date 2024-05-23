import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bookverse/Model/library_book_model.dart';
import 'package:bookverse/Model/library_model.dart';
import 'package:bookverse/Views/library/library_home.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Controller/Providers/provider.dart';
import '../../widget_model/shimmer_effect.dart';

class LibraryAuthenticationProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  LibraryModel? _libraryModel;

  LibraryModel get libraryModel => _libraryModel!;

  Future<void> saveUser(String libraryId, String email, String libraryName,String phoneNum,
      String location) async {
    final userDoc = firebaseFirestore.collection("library").doc(libraryId);
    _libraryModel = LibraryModel(
      libraryId: libraryId,
      email: email,
      libraryName: libraryName,

      phoneNum: phoneNum,
      location: location,
    );
    await userDoc.set(_libraryModel!.toMap());
  }

  Future<void> signUp(String email, String libraryName,String phoneNum, String location,
      String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = firebaseAuth.currentUser;
      user!.sendEmailVerification();
      await saveUser(user.uid, email, libraryName,phoneNum, location);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Sign-up successful. Please verify your email.")));
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> signIn(String email, String password,
      BuildContext context) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = firebaseAuth.currentUser;
      final emailVerified = user!.emailVerified;
      if (!emailVerified) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please verify your email")));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Library_Home()));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: Unable to sign in')));
      print(e);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    notifyListeners();
  }
  Future<void> acceptLibraryRequest(String userId, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('library')
          .doc(userId)
          .update({'status': 'accepted'});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Library request accepted.')),
      );

      // Trigger state update to remove the accepted request from the list
      notifyListeners();
    } catch (e) {
      print('Error accepting library request: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error accepting library request: $e')),
      );
    }
  }

  Future<void> rejectLibraryRequest(String userId, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('library')
          .doc(userId)
          .update({'status': 'rejected'});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Library request rejected.')),
      );

      // Trigger state update to remove the rejected request from the list
      notifyListeners();
    } catch (e) {
      print('Error rejecting library request: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error rejecting library request: $e')),
      );
    }
  }

  Future<String> uploadImage(File image) async {
    String fileName = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    Reference reference = firebaseStorage.ref().child('images/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot storageTaskSnapshot = await uploadTask;
    return await storageTaskSnapshot.ref.getDownloadURL().then((value) => value);
  }

  Future<void> updateLibrary(String url, BuildContext context) async {
    log(url);
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      // String imageUrl = library.libraryImg ?? ''; // Get the image URL from the model
      await firebaseFirestore.collection('library').doc(userId).update(
          {'libraryImg': url});
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Library details updated successfully")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
          "Failed to update library details. Please try again.")));
    }
  }


  //AddBooks CONTROL_//

  TextEditingController bookNameController = TextEditingController();
  TextEditingController authorNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController bookRateController = TextEditingController();
  TextEditingController aboutBooksController = TextEditingController();

  final addBooksKey = GlobalKey<FormState>();

  AddBooksModel? _addBooksModel;

  AddBooksModel get addBooksModel => _addBooksModel!;

  Future<void> saveBook(
      String bookName,
      String imageURL,
      String authorName,
      String category,
      String bookRate,
      String aboutBooks,) async {
    try {
      _addBooksModel = AddBooksModel(
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
      print('*Book Stored');
    } catch (e) {
      print("Book storing failed : $e");
    }

    notifyListeners();
  }

  List<AddBooksModel> booksList = [];
  AddBooksModel? book;

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

        book = AddBooksModel(
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
      print('BOOKS FETCH COMPLETE');
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