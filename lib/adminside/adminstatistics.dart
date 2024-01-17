import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class adminstatistics extends StatelessWidget {
  const adminstatistics({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.menu_rounded,
            size: 30,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding:
            EdgeInsets.only(left: screenwidth * 0.1, right: screenwidth * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenheight * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Users:',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: screenwidth * 0.045,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2 000 000',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: screenwidth * 0.045,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.grey.shade500,
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Online Users:',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: screenwidth * 0.045,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '205 309',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: screenwidth * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.grey.shade500,
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ADS:',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: screenwidth * 0.045,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenwidth * 0.1),
                  child: Text(
                    '55 935',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: screenwidth * 0.05,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ads World coin:',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: screenwidth * 0.045,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: screenwidth * 0.1,
                ),
                Text(
                  '40 570',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: screenwidth * 0.05,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ads Crew coin:',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: screenwidth * 0.05,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: screenwidth * 0.1,
                ),
                Text(
                  '10 056',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: screenwidth * 0.05,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ads Only coin:',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: screenwidth * 0.045,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: screenwidth * 0.1,
                ),
                Text(
                  '40 570',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: screenwidth * 0.05,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Capital:',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: screenwidth * 0.045,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenwidth * 0.1),
                  child: Text(
                    '205 309 €',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: screenwidth * 0.05,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.11, right: screenwidth * 0.11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today:',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: screenwidth * 0.045,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '2 050',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: screenwidth * 0.05,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
