import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/invitefriends.dart';
import 'package:wincoin/userside/settings.dart';
import 'package:wincoin/userside/withdraw.dart';

import 'homepage.dart';

class createcrewcoin extends StatelessWidget {
  const createcrewcoin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const settings()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)),
                          child: SizedBox(
                            width: screenwidth * 0.09,
                            height: screenheight * 0.08,
                            // Your content goes here
                            child: Center(
                              child: Icon(
                                Icons.perm_identity_outlined,
                                color: Colors.white,
                                size: screenwidth * 0.08,
                              ),
                            ),
                          )),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const invite()));
                      },
                      child: const Icon(
                        Icons.redo,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenheight * 0.4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => crewcoinsendlink()));
                  },
                  child: Container(
                    height: screenheight * 0.065,
                    width: screenwidth * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(146, 208, 80, 1),
                        )),
                    child: Center(
                      child: Text(
                        'CREATE',
                        style: GoogleFonts.inter(
                            color: const Color.fromRGBO(68, 68, 68, 1)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenheight * 0.02,
                ),
                Container(
                  height: screenheight * 0.065,
                  width: screenwidth * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(68, 68, 68, 1),
                      )),
                  child: Center(
                    child: Text(
                      'COIN NAME',
                      style: GoogleFonts.inter(
                        color: const Color.fromRGBO(68, 68, 68, 1),
                      ),
                    ),
                  ),
                ),
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
            Positioned(
              left: 0,
              top: screenheight * 0.07,
              child: Container(
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
                        color: Colors.white, fontSize: screenwidth * 0.03),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class crewcoinsendlink extends StatelessWidget {
  const crewcoinsendlink({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const settings()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)),
                          child: SizedBox(
                            width: screenwidth * 0.09,
                            height: screenheight * 0.08,
                            // Your content goes here
                            child: Center(
                              child: Icon(
                                Icons.perm_identity_outlined,
                                color: Colors.white,
                                size: screenwidth * 0.08,
                              ),
                            ),
                          )),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const invite()));
                      },
                      child: const Icon(
                        Icons.redo,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenheight * 0.25,
                ),
                Container(
                  height: screenheight * 0.065,
                  width: screenwidth * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(68, 68, 68, 1))),
                  child: Center(
                    child: Text(
                      'COIN NAME',
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(68, 68, 68, 1)),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenheight * 0.02,
                ),
                Container(
                  height: screenheight * 0.065,
                  width: screenwidth * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(68, 68, 68, 1),
                      )),
                  child: Center(
                    child: Text(
                      'NUMBER OF CLICKS',
                      style: GoogleFonts.inter(
                        color: const Color.fromRGBO(68, 68, 68, 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenheight*0.01,),
                Center(
                  child: Text(
                    'Min. 1 000 000',
                    style: GoogleFonts.inter(
                      color: const Color.fromRGBO(68, 68, 68, 1),
                      fontSize: screenwidth*0.03
                    ),
                  ),
                ),
                SizedBox(height: screenheight*0.2,),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => crewcoin()));
                  },
                  child: Container(
                    height: screenheight * 0.07,
                    width: screenwidth * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(146, 208, 80, 1),
                        )),
                    child: Center(
                      child: Text(
                        'SEND',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: screenwidth*0.05,fontWeight: FontWeight.w600


                        ),
                      ),
                    ),
                  ),
                ),

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
            Positioned(
              left: 0,
              top: screenheight * 0.07,
              child: Container(
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
                        color: Colors.white, fontSize: screenwidth * 0.03),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class crewcoin extends StatelessWidget {
  const crewcoin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const homepage()));
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '1 000 000',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: screenwidth * 0.04),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const invite()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.redo,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: SizedBox(
                          height: screenheight * 0.7,
                          width: screenwidth * 0.8,
                          child: Image.asset('Assets/images/crewcoin.png')),
                    ),


                  ],
                ),
                Positioned(
                  right: 5,
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
          )),
    );
  }
}
