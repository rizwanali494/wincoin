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
      required String username,
      required String withdrawvalue}) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'birth': birth,
        'country': country,
        'username': username,
        'withdrawvalue': withdrawvalue
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

  Future<String?> getWithdrawValue() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String uid = user.uid;

        DocumentSnapshot userSnapshot =
            await _firestore.collection('users').doc(uid).get();

        if (userSnapshot.exists) {
          return userSnapshot['withdrawvalue'] as String?;
        } else {
          // User data not found
          return null;
        }
      } else {
        // Current user not found
        return null;
      }
    } catch (error) {
      print("Error fetching withdraw value: $error");
      return null;
    }
  }

  Future<int> getUserPosition() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      // Check if the user is signed in
      if (user != null) {
        // Get the user's UID
        String userUid = user.uid;

        // Query Firestore to get the user's position
        QuerySnapshot userSnapshot = await _firestore
            .collection('users')
            .orderBy('withdrawvalue', descending: true)
            .get();

        int userPosition =
            userSnapshot.docs.indexWhere((doc) => doc.id == userUid) + 1;

        return userPosition;
      } else {
        // User is not signed in
        throw Exception('User not signed in');
      }
    } catch (error) {
      print('Error fetching user position: $error');
      rethrow;
    }
  }
  // Inside your 'FirebaseService' class

Future<void> withdrawRequest({
    required String firstName,
    required String middleName,
    required String surname,
    required String country,
    required String amount,
    required String iban,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String uid = user.uid;

        // Reference to the user's document in the 'users' collection
        DocumentReference userDocRef = _firestore.collection('users').doc(uid);

        // Save withdraw request data to a 'withdrawals' subcollection
        await userDocRef.collection('withdrawals').add({
          'firstName': firstName,
          'middleName': middleName,
          'surname': surname,
          'country': country,
          'amount': amount,
          'iban': iban,
          'timestamp': FieldValue.serverTimestamp(),
          // Add other fields as needed
        });
      } else {
        // User not signed in
        throw Exception('User not signed in');
      }
    } catch (error) {
      print('Error withdrawing request: $error');
      rethrow;
    }
  }

Future<bool> canMakeWithdrawalRequest() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String uid = user.uid;

        // Reference to the user's document in the 'users' collection
        DocumentReference userDocRef = _firestore.collection('users').doc(uid);

        // Reference to the 'withdrawals' subcollection under the user's document
        CollectionReference withdrawalCollection = userDocRef.collection('withdrawals');

        // Query to check if there are any documents in the 'withdrawals' subcollection
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await withdrawalCollection.get() as QuerySnapshot<Map<String, dynamic>>;

        // Check if there are any withdrawal requests
        if (querySnapshot.docs.isNotEmpty) {
          // Check the timestamp of the latest withdrawal request
          DateTime latestWithdrawalTime = querySnapshot.docs.first['timestamp'].toDate();
          DateTime now = DateTime.now();

          // Calculate the difference in days
          int daysDifference = now.difference(latestWithdrawalTime).inDays;

          // Check if it has been 14 days or more since the last withdrawal
          if (daysDifference >= 14) {
            // User can make a new withdrawal request
            return true;
          } else {
            // User needs to wait for 14 days
            return false;
          }
        } else {
          // No withdrawal requests made, user can make a new request
          return true;
        }
      } else {
        // User not signed in
        throw Exception('User not signed in');
      }
    } catch (error) {
      print('Error checking withdrawal request: $error');
      return false;
    }
  }


}
