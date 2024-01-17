import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/settings.dart';

class supportchat extends StatefulWidget {
  const supportchat({super.key});

  @override
  State<supportchat> createState() => _supportchatState();
}

class _supportchatState extends State<supportchat> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(
            left: screenwidth * 0.05,
            right: screenwidth * 0.05,
            top: screenheight * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const settings()));
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'SUPPORT CHAT',
                  style: GoogleFonts.inter(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Container(),
              ],
            ),
            SizedBox(
              height: screenheight * 0.15,
            ),
            Container(
                height: screenheight * 0.09,
                width: screenwidth * 0.7,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(68, 68, 68, 1),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: screenwidth * 0.02),
                        child: Text(
                          '?',
                          style: GoogleFonts.inter(
                              color: const Color.fromRGBO(68, 68, 68, 1),
                              fontWeight: FontWeight.normal,
                              fontSize: screenwidth * 0.055),
                        ),
                      ),
                    ),
                    Text(
                      'W COIN VALUE',
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(68, 68, 68, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: screenwidth * 0.035),
                    ),
                    Container(),
                  ],
                )),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  height: screenheight * 0.09,
                  width: screenwidth * 0.7,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(68, 68, 68, 1),
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: screenwidth * 0.02),
                          child: Text(
                            '?',
                            style: GoogleFonts.inter(
                                color: const Color.fromRGBO(68, 68, 68, 1),
                                fontWeight: FontWeight.normal,
                                fontSize: screenwidth * 0.055),
                          ),
                        ),
                      ),
                      Text(
                        'CONVERSION TIME',
                        style: GoogleFonts.inter(
                            color: const Color.fromRGBO(68, 68, 68, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: screenwidth * 0.035),
                      ),
                      Container(),
                    ],
                  )),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Container(
                height: screenheight * 0.09,
                width: screenwidth * 0.7,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(68, 68, 68, 1),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: screenwidth * 0.02),
                        child: Text(
                          '?',
                          style: GoogleFonts.inter(
                              color: const Color.fromRGBO(68, 68, 68, 1),
                              fontWeight: FontWeight.normal,
                              fontSize: screenwidth * 0.055),
                        ),
                      ),
                    ),
                    Text(
                      'DELETE ACCOUNT',
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(68, 68, 68, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: screenwidth * 0.035),
                    ),
                    Container(),
                  ],
                )),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  height: screenheight * 0.09,
                  width: screenwidth * 0.7,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(68, 68, 68, 1),
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: screenwidth * 0.02),
                          child: Text(
                            '?',
                            style: GoogleFonts.inter(
                                color: const Color.fromRGBO(68, 68, 68, 1),
                                fontWeight: FontWeight.normal,
                                fontSize: screenwidth * 0.055),
                          ),
                        ),
                      ),
                      Text(
                        'DOCUMENTS',
                        style: GoogleFonts.inter(
                            color: const Color.fromRGBO(68, 68, 68, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: screenwidth * 0.035),
                      ),
                      Container(),
                    ],
                  )),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: screenheight * 0.065,
                  width: screenwidth * 0.65,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                      hintStyle: TextStyle(
                          fontSize: screenwidth * 0.04,
                          color: const Color.fromRGBO(68, 68, 68, 1)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(68, 68, 68, 1)),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(68, 68, 68, 1)),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
