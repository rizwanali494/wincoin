import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
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

  Future<void> uploadUserData(
      {required String uid,
      required String firstName,
      required String lastName,
      required String email,
      required String birth,
      required String country,
      required String username}) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'birth': birth,
        'country': country,
        'username': username,
      });
    } catch (error) {
      print("Error uploading user data: $error");
    }
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        return userSnapshot.data() as Map<String, dynamic>;
      } else {
        // User data not found
        return null;
      }
    } catch (error) {
      print("Error fetching user data: $error");
      return null;
    }
  }

  Future<String?> getCurrentUserUid() async {
    try {
      User? user = _auth.currentUser;
      return user?.uid;
    } catch (error) {
      print("Error getting current user UID: $error");
      return null;
    }
  }

  Future<void> changePassword(String newPassword) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await user.updatePassword(newPassword);
      }
    } catch (error) {
      print("Error changing password: $error");
      EasyLoading.showError('$error');
    }
  }
}
