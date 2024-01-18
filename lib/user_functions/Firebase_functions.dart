import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (error) {
      print("Error during signup: $error");
      EasyLoading.showError('$error');
      return null;
    }
  }
  Future<User?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (error) {
      print("Error during login: $error");
      EasyLoading.showError('$error');
      return null;
    }
  }

  Future<void> uploadUserData({
    required String uid,
    required String firstName,
    required String lastName,
    required String email,
    required String birth,
    required String country,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'birth': birth,
        'country': country,
      });
    } catch (error) {
      print("Error uploading user data: $error");
    }
  }
}

