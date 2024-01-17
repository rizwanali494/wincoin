import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/homepage.dart';
import 'package:wincoin/userside/login.dart';
import 'package:wincoin/userside/withdraw.dart';

class invite extends StatelessWidget {
  const invite({super.key});

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
                                  builder: (context) => const homepage()));
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
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
                SizedBox(
                  height: screenheight * 0.05,
                ),
                Icon(
                  Icons.groups,
                  color: Colors.white,
                  size: screenheight * 0.2,
                ),
                SizedBox(
                  height: screenheight * 0.03,
                ),
                SizedBox(
                  width: screenwidth * 0.6,
                  child: Text(
                    'Invite a friend and get 0.2% of their profits.',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenwidth * 0.052),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const withdrawprocess()));
                    },
                    child: Container(
                      height: screenheight * 0.065,
                      width: screenwidth * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color.fromRGBO(146, 208, 80, 1),
                              width: 2)),
                      child: Center(
                        child: Text(
                          'SEND',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: screenwidth * 0.06,
                              fontWeight: FontWeight.w600),
                        ),
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
                    child: Text('Copy Link',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: screenwidth * 0.04,
                            color: const Color.fromRGBO(0, 176, 239, 1))),
                  ),
                ),
                SizedBox(
                  height: screenheight * 0.2,
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
      )),
    );
  }
}
