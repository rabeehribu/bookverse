import 'package:bookverse/Views/admin/adminHomepage.dart';
import 'package:bookverse/Views/admin/admin_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminController with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;

  AdminController(this._firebaseAuth);

  Future<void> adminLogin(String email, String password, context) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user != null && user.uid == '7jVrAHRng0a0RgDybP1DkxSebdh1') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AdminHome(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid credentials")),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: ${e.message}')),
      );
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

}
