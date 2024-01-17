import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/crewcoin.dart';
import 'package:wincoin/userside/invitefriends.dart';
import 'package:wincoin/userside/onlycoin.dart';
import 'package:wincoin/userside/settings.dart';
import 'package:wincoin/userside/withdraw.dart';
import 'package:wincoin/userside/worldcoin.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

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
                  height: screenheight * 0.07,
                ),
                Image.asset(
                    'Assets/images/homepagevisual-removebg-preview.png'),
                SizedBox(
                  height: screenheight * 0.03,
                ),
                SizedBox(
                    height: screenheight * 0.13,
                    width: screenwidth * 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const worldcoinpaymentverify()));
                        },
                        child: Image.asset('Assets/images/Picture1.png'))),
                SizedBox(
                  height: screenheight * 0.03,
                ),
                SizedBox(
                    height: screenheight * 0.13,
                    width: screenwidth * 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const createcrewcoin()));
                        },
                        child: Image.asset('Assets/images/Picture2.png'))),
                SizedBox(
                  height: screenheight * 0.03,
                ),
                SizedBox(
                    height: screenheight * 0.13,
                    width: screenwidth * 1,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const onlycoin()));
                        },
                        child: Image.asset('Assets/images/Picture3.png'))),
                SizedBox(
                  height: screenheight * 0.02,
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
