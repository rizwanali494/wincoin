import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/homepage.dart';
import 'package:wincoin/userside/invitefriends.dart';

class worldcoin extends StatelessWidget {
  const worldcoin({super.key});

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
                      '1 00 000 000 000',
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
                      child: Image.asset('Assets/images/worldcoin.png')),
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

class worldcoinpaymentverify extends StatelessWidget {
  const worldcoinpaymentverify({super.key});

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
                      'GATE',
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
                SizedBox(
                  height: screenheight * 0.15,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenwidth * 0.06, right: screenwidth * 0.06),
                  child: Text(
                    '  To enter the world room, you need to pay an entrance fee',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: screenwidth * 0.06),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '1',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: screenwidth * 0.09),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                        width: screenwidth * 0.07,
                        height: screenheight * 0.06,
                        child: Image.asset(
                          'Assets/images/AppIcon.png',
                        )),
                    SizedBox(
                      width: screenwidth * 0.25,
                    ),
                  ],
                ),
                SizedBox(
                  height: screenheight * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenwidth * 0.06, right: screenwidth * 0.06),
                  child: Text(
                    'After payment, you get unlimited access',
                    style: GoogleFonts.inter(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w800,
                        fontSize: screenwidth * 0.06),
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
                              builder: (context) => const worldcoin()));
                    },
                    child: Container(
                      height: screenheight * 0.065,
                      width: screenwidth * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromRGBO(146, 208, 80, 1),
                              width: 2)),
                      child: Center(
                        child: Text(
                          'PAY',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: screenwidth * 0.06,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
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
