import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/Position_table.dart';
import 'package:wincoin/userside/homepage.dart';
import 'package:wincoin/userside/onboarding.dart';
import 'package:wincoin/userside/supportchat.dart';
import 'package:wincoin/userside/withdraw.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: screenwidth * 0.04,
            right: screenwidth * 0.04,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: screenheight * 0.025,
                        width: screenwidth * 0.15,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            '# 2,03M',
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: screenwidth * 0.03),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const withdraw()));
                        },
                        child: Row(
                          children: [
                            Text(
                              '0,024',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenwidth * 0.04),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            SizedBox(
                                width: screenwidth * 0.05,
                                height: screenheight * 0.05,
                                child: Image.asset(
                                  'Assets/images/AppIcon.png',
                                ))
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.redo,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const homepage()));
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ))),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenwidth * 0.15, right: screenwidth * 0.15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(68, 68, 68, 1))),
                            child: SizedBox(
                              width: screenwidth * 0.2,
                              height: screenheight * 0.15,
                              // Your content goes here
                              child: Center(
                                child: Icon(
                                  Icons.perm_identity_outlined,
                                  color: const Color.fromRGBO(68, 68, 68, 1),
                                  size: screenwidth * 0.15,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: screenheight * 0.02,
                        ),
                        SizedBox(
                          height: screenheight * 0.05,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: screenwidth * 0.1,
                                right: screenwidth * 0.1),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                    fontSize: screenwidth * 0.03,
                                    color: const Color.fromRGBO(68, 68, 68, 1)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(68, 68, 68, 1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(68, 68, 68, 1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenheight * 0.02,
                        ),
                        SizedBox(
                          height: screenheight * 0.06,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  fontSize: screenwidth * 0.035,
                                  color: const Color.fromRGBO(68, 68, 68, 1)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(68, 68, 68, 1)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(68, 68, 68, 1)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: screenheight * 0.02,
                        ),
                        SizedBox(
                          height: screenheight * 0.06,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Birth',
                              hintStyle: TextStyle(
                                  fontSize: screenwidth * 0.035,
                                  color: const Color.fromRGBO(68, 68, 68, 1)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(68, 68, 68, 1)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(68, 68, 68, 1)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: screenheight * 0.02,
                        ),
                        SizedBox(
                          height: screenheight * 0.06,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  fontSize: screenwidth * 0.035,
                                  color: const Color.fromRGBO(68, 68, 68, 1)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(68, 68, 68, 1)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(68, 68, 68, 1)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.shade900,
                        ),
                        SizedBox(
                          height: screenheight * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Push Notifications',
                              style: GoogleFonts.inter(
                                  color: const Color.fromRGBO(68, 68, 68, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            Switch(
                              onChanged: null,
                              value: false,
                              activeColor: Colors.blue,
                              activeTrackColor: Colors.yellow,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey.shade800,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenheight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Email Newsletter',
                              style: GoogleFonts.inter(
                                  color: const Color.fromRGBO(68, 68, 68, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            Switch(
                              onChanged: null,
                              value: true,
                              activeColor: Colors.blue,
                              activeTrackColor:
                                  const Color.fromRGBO(146, 208, 80, 1),
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey.shade800,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey.shade900,
                        ),
                        SizedBox(
                          height: screenheight * 0.03,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const positiontable()));
                          },
                          child: Container(
                              height: screenheight * 0.06,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromRGBO(68, 68, 68, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'History',
                                  style: GoogleFonts.inter(
                                      color:
                                          const Color.fromRGBO(68, 68, 68, 1),
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: screenheight * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const supportchat()));
                          },
                          child: Container(
                              height: screenheight * 0.06,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromRGBO(68, 68, 68, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Support',
                                  style: GoogleFonts.inter(
                                      color:
                                          const Color.fromRGBO(68, 68, 68, 1),
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: screenheight * 0.03,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const onboarding()));
                          },
                          child: Text(
                            'LOGOUT',
                            style: GoogleFonts.inter(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                fontSize: screenheight * 0.015),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                right: 0,
                top: screenheight * 0.05,
                child: Text(
                  '0.2%',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: screenwidth * 0.03),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
