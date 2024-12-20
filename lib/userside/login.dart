import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/adminside/gfdrawer.dart';
import 'package:wincoin/userside/homepage.dart';
import 'package:wincoin/userside/onboarding.dart';

import '../user_functions/Firebase_functions.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final FirebaseService _firebaseService = FirebaseService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginAndNavigateToHomepage() async {
    try {
      EasyLoading.show(status: 'Loading...');

      // Check if the entered email and password match predefined admin credentials
      if (_isAdmin()) {
        EasyLoading.showSuccess('Admin logged in...');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const gfdrawer()),
        );

        // Navigate to the admin section or perform other actions for admins
      } else {
        // If not admin, proceed with regular user login
        User? user = await _firebaseService.loginWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );

        if (user != null) {
          EasyLoading.showSuccess('User logged in...');
          // Navigate to the regular user homepage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const homepage()),
          );
        }
      }
    } catch (error) {
      print("Error during Login: $error");
      EasyLoading.showError('$error');
    }
  }

  // Function to check if the entered email and password match predefined admin credentials
  bool _isAdmin() {
    // Replace these values with your predefined admin email and password
    const String adminEmail = 'admin@example.com';
    const String adminPassword = 'adminpassword';

    return emailController.text == adminEmail && passwordController.text == adminPassword;
  }

    @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const onboarding()));
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.1,
            ),
            Center(
                child: SizedBox(
                    height: screenheight * 0.3,
                    child: Image.asset(
                        'Assets/images/W without a background.png'))),
            SizedBox(
              height: screenheight * 0.07,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.1, right: screenwidth * 0.1),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(68, 68, 68, 1)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromRGBO(68, 68, 68, 1)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromRGBO(68, 68, 68, 1)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenheight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.1, right: screenwidth * 0.1),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(68, 68, 68, 1)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromRGBO(68, 68, 68, 1)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromRGBO(68, 68, 68, 1)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenheight * 0.1,
            ),
            Center(
              child: GestureDetector(
                onTap: loginAndNavigateToHomepage,
                child: Container(
                  height: screenheight * 0.075,
                  width: screenwidth * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromRGBO(146, 208, 80, 1),
                          width: 2)),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: screenwidth * 0.08,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.04,
            ),
          ],
        ),
      )),
    );
  }
}
