import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/login.dart';
import 'package:wincoin/userside/signup.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            SizedBox(
              height: screenheight * 0.1,
            ),
            Center(
                child: SizedBox(
                    height: screenheight * 0.3,
                    child: Image.asset(
                        'Assets/images/W without a background.png'))),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const singup()));
              },
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
                    'Sign up',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: screenwidth * 0.08,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const login()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Color.fromRGBO(0, 176, 239, 1),
                ))),
                child: Text('Sign in',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: screenwidth * 0.055,
                        color: const Color.fromRGBO(0, 176, 239, 1))),
              ),
            ),
            SizedBox(
              height: screenheight * 0.07,
            ),
          ],
        ),
      )),
    );
  }
}
