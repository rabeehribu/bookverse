import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future signUp(
      String fullName,
      String age,
      String gender,
      String phoneNumber,
      String email,
      String password,
      BuildContext? context,
      ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send email verification
      await userCredential.user!.sendEmailVerification();

      // Save user details
      await _saveUser(
        userCredential.user!.uid,
        fullName,
        age,
        gender,
        phoneNumber,
        email,
      );

      // Show success message
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            "Sign up successful",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } catch (e) {
      // Handle sign-up errors
      print("Sign up error: $e");
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: Colors.white,
          content: Text(
            "Sign up failed. Please try again.",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    notifyListeners();
  }

  Future<void> signIn(
      String email,
      String password,
      BuildContext? context,
      ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = _firebaseAuth.currentUser;
      final verified = user!.emailVerified;
      if (!verified) {
        ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(
            content: Text("Please verify your email or password."),
          ),
        );
      } else {
        // Navigate to the next screen
      }
    } catch (e) {
      // Handle sign-in errors
      print("Sign in error: $e");
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text("Sign in failed. Please try again."),
        ),
      );
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    notifyListeners();
  }

  Future<void> _saveUser(
      String userId,
      String fullName,
      String age,
      String gender,
      String phoneNumber,
      String email,
      ) async {
    final userDoc = _firebaseFirestore.collection("Users").doc(userId);
    final userData = {
      'fullName': fullName,
      'age': age,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'email': email,
    };
    await userDoc.set(userData);
  }
}
