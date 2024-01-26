import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wincoin/user_functions/Firebase_functions.dart';
import 'package:wincoin/userside/homepage.dart';
import 'package:wincoin/userside/onboarding.dart';

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  TextEditingController FirstName = TextEditingController();
  TextEditingController SecondName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Birth = TextEditingController();
  TextEditingController Country = TextEditingController();
  TextEditingController username = TextEditingController();

  birthdaypicker({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    Birth.text = DateFormat('yyyy-MM-dd').format(pickedDate);
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
              height: screenheight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.1, right: screenwidth * 0.1),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: FirstName,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.white),
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
                style: const TextStyle(color: Colors.white),
                controller: SecondName,
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
                style: const TextStyle(color: Colors.white),
                controller: Email,
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
                style: const TextStyle(color: Colors.white),
                controller: username,
                decoration: InputDecoration(
                  hintText: 'username',
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
                style: const TextStyle(color: Colors.white),
                readOnly: true,
                controller: Birth,
                decoration: InputDecoration(
                  hintText: 'Birth',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(68, 68, 68, 1),
                  ),
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
                onTap: () => birthdaypicker(context: context),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.1, right: screenwidth * 0.1),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: Country,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => createaccount(
                                FirstName: FirstName.text,
                                SecondName: SecondName.text,
                                Email: Email.text,
                                Birth: Birth.text,
                                Country: Country.text,
                                username: username.text,
                              )));
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
  final String FirstName;
  final String SecondName;
  final String Email;
  final String Birth;
  final String username;
  final String Country;
  const createaccount(
      {Key? key,
      required this.FirstName,
      required this.SecondName,
      required this.Email,
      required this.Birth,
      required this.username,
      required this.Country})
      : super(key: key);

  @override
  State<createaccount> createState() => _createaccountState();
}

class _createaccountState extends State<createaccount> {
  final FirebaseService _firebaseService = FirebaseService();
  TextEditingController ConfirmEmail = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  void initState() {
    super.initState();
    ConfirmEmail.text = widget.Email;
  }

  Future<void> signUpAndUploadData() async {
    try {
      if (!validateFields()) {
        return;
      }

      EasyLoading.show(status: 'Loading...');

      User? user = await _firebaseService.signUpWithEmailAndPassword(
        widget.Email,
        Password.text,
      );

      if (user != null) {
        await _firebaseService.uploadUserData(
          uid: user.uid,
          firstName: widget.FirstName,
          lastName: widget.SecondName,
          email: widget.Email,
          birth: widget.Birth,
          country: widget.Country,
          username: widget.username,
        );

        EasyLoading.showSuccess('Account created successfully');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const homepage()));
      }
    } catch (error) {
      print("Error during signup: $error");
    }
  }

  bool validateFields() {
    if (widget.FirstName.isEmpty ||
        widget.SecondName.isEmpty ||
        widget.Email.isEmpty ||
        widget.Birth.isEmpty ||
        widget.Country.isEmpty) {
      EasyLoading.showError('Please fill in all fields');
      return false;
    }

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(ConfirmEmail.text)) {
      EasyLoading.showError('Invalid email format');
      return false;
    }

    try {
      DateTime birthDate = DateFormat('yyyy-MM-dd').parse(widget.Birth);
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;

      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        age--;
      }

      if (age < 18) {
        EasyLoading.showError('You must be at least 18 years old');
        return false;
      }
    } catch (e) {
      EasyLoading.showError('Invalid birth date format');
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    print(widget.FirstName);
    print(widget.Birth);
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
                  Navigator.pop(context);
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
                controller: ConfirmEmail,
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
                controller: Password,
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
                onTap: signUpAndUploadData,
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
