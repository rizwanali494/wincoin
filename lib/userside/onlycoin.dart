import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/homepage.dart';
import 'package:wincoin/userside/invitefriends.dart';

class onlycoin extends StatelessWidget {
  const onlycoin({super.key});

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
                      '1 00 000',
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
                      child: Image.asset('Assets/images/onlycoin.png')),
                ),
                const Expanded(child: SizedBox()),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: screenheight * 0.03,
                      width: screenwidth * 0.1,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(146, 208, 80, 1),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          '100',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: screenwidth * 0.03),
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
