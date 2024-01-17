import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/onboarding.dart';

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
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
              height: screenheight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.1, right: screenwidth * 0.1),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'First Name',
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
              height: screenheight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.1, right: screenwidth * 0.1),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Last Name',
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
              height: screenheight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.1, right: screenwidth * 0.1),
              child: TextField(
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
              height: screenheight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.1, right: screenwidth * 0.1),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Birth',
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
              height: screenheight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.1, right: screenwidth * 0.1),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Country',
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
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const createaccount()));
                },
                child: Container(
                  height: screenheight * 0.075,
                  width: screenwidth * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromRGBO(68, 68, 68, 1),
                          width: 2)),
                  child: Center(
                    child: Text(
                      'Continue',
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

class createaccount extends StatefulWidget {
  const createaccount({super.key});

  @override
  State<createaccount> createState() => _createaccountState();
}

class _createaccountState extends State<createaccount> {
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
                    'Create',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: screenwidth * 0.08,
                        fontWeight: FontWeight.w600),
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
