import 'dart:async';

import 'package:bookverse/Views/users/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/user_model.dart';

class UserAuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  UserModel? _userModel;

  UserModel get usermodel => _userModel!;

  Future<void> saveUser(
    String userId,
    String fullName,
    String age,
    String gender,
    String phoneNumber,
    String email,
  ) async {
    final userDoc = _firebaseFirestore.collection("Users").doc(userId);
    _userModel = UserModel(
        userId: userId,
        fullName: fullName,
        age: age,
        gender: gender,
        phoneNumber: phoneNumber,
        email: email);
    await userDoc.set(_userModel!.toMap());
  }

  Future signUp(
    String fullName,
    String age,
    String gender,
    String phoneNumber,
    String email,
    String password,
    context,
  ) async {
    try {
      print('/////////////////////USER SIGNUP//////////////////////');
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = _firebaseAuth.currentUser;
      user!.sendEmailVerification();
      await saveUser(user.uid, fullName, age, gender, phoneNumber, email);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Its Successfull")));
    } catch (e) {
      print('////////////////////////SIGNUP ERROR///////////////////////////');
      print(e);
    }
    notifyListeners();
  }

  Future<void> signIn(
    String email,
    String password,
    context,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = _firebaseAuth.currentUser;
      final emailveri = user!.emailVerified;
      if (emailveri == false) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please verifie your email")));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please varifie your email!!!')));
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    notifyListeners();
  }

}
