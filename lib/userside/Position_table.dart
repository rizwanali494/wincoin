import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/settings.dart';
import 'package:wincoin/userside/withdraw.dart';

import '../user_functions/Firebase_functions.dart';

class positiontable extends StatefulWidget {
  const positiontable({super.key});

  @override
  State<positiontable> createState() => _positiontableState();
}

class _positiontableState extends State<positiontable> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> withdrawalData = [];
  late String currentUserUid; // Add this line

  @override
  void initState() {
    super.initState();
    _fetchWithdrawalData();
    _getCurrentUserUid();
  }

  // Fetch withdrawal data from Firestore
  Future<void> _fetchWithdrawalData() async {
    try {
      QuerySnapshot userSnapshot = await _firestore.collection('users').get();

      setState(() {
        withdrawalData = userSnapshot.docs
            .map((DocumentSnapshot doc) => {
          'uid': doc.id,
          'withdrawValue': doc['withdrawvalue'] ?? '0',
        })
            .toList();
      });
    } catch (error) {
      print("Error fetching withdrawal data: $error");
    }
  }
  Future<void> _getCurrentUserUid() async {
    try {
      // Fetch the current user's ID
      // You may need to adjust this based on your authentication setup
      // For example, if you are using Firebase Authentication, you can get it like this:
       User? user = FirebaseAuth.instance.currentUser;
       currentUserUid = user?.uid ?? '';

    } catch (error) {
      print("Error getting current user ID: $error");
    }
  }
  String formatNumber(int number) {
    if (number < 1000) {
      return '# $number';
    } else if (number < 1000000) {
      double result = number / 1000.0;
      return '# ${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}K';
    } else if (number < 1000000000) {
      double result = number / 1000000.0;
      return '# ${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}M';
    } else if (number < 1000000000000) {
      double result = number / 1000000000.0;
      return '# ${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}B';
    } else {
      double result = number / 1000000000000.0;
      return '# ${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}T';
    }
  }

Future<void> _getwithdrawvalue()async {

  String? withdrawValue = await FirebaseService().getWithdrawValue();

}

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    withdrawalData.sort((a, b) => int.parse(b['withdrawValue']).compareTo(int.parse(a['withdrawValue'])));
    int currentUserIndex =
    withdrawalData.indexWhere((withdrawal) => withdrawal['uid'] == currentUserUid);



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
            SingleChildScrollView(
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
                        FutureBuilder<String?>(
                        future: FirebaseService().getWithdrawValue(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            // If the Future is still running, display a loading indicator
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // If there is an error in the Future, display an error message
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // If the Future is complete and successful, display the withdrawValue
                            String? withdrawValue = snapshot.data;

                            if (withdrawValue != null) {
                              return Text(
                                '$withdrawValue',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenwidth * 0.04),
                              );
                            } else {
                              // If withdrawValue is null, display a message
                              return Text('Withdraw Value not available');
                            }
                          }
                        },
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
                    height: screenheight * 0.04,
                  ),
                  Center(
                    child: Container(
                      height: screenheight * 0.062,
                      width: screenwidth * 0.32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color.fromRGBO(146, 208, 80, 1),
                              width: 3)),
                      child: Center(
                        child: Text(
                          (currentUserIndex + 1).toString(),
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: screenwidth * 0.04),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight * 0.05,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: screenwidth * 0.06, right: screenwidth * 0.06),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenwidth * 0.04,
                              right: screenwidth * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'USER',
                                style: GoogleFonts.inter(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'POSITION',
                                style: GoogleFonts.inter(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'CAPITAL',
                                style: GoogleFonts.inter(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color.fromRGBO(68, 68, 68, 1),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: withdrawalData.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> withdrawal = withdrawalData[index];
                              String uid = withdrawal['uid'];
                              String withdrawValue = withdrawal['withdrawValue'];
                              return Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenwidth * 0.04,
                                          right: screenwidth * 0.04),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.grey.shade500,
                                                  )),
                                              child: SizedBox(
                                                width: screenwidth * 0.09,
                                                height: screenheight * 0.05,
                                                // Your content goes here
                                                child: Center(
                                                  child: Icon(
                                                    Icons
                                                        .perm_identity_outlined,
                                                    color: Colors.grey.shade500,
                                                    size: screenwidth * 0.08,
                                                  ),
                                                ),
                                              )), // Icon

                                          Text(
                                            (index + 1).toString(),
                                            style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ), // Number

                                          Row(
                                            children: [
                                              Text(
                                                '$withdrawValue',
                                                style: GoogleFonts.inter(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                  width: screenwidth * 0.05,
                                                  height: screenheight * 0.05,
                                                  child: Image.asset(
                                                    'Assets/images/AppIcon.png',
                                                  ))
                                            ],
                                          ), // Any text
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
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
                    formatNumber( (currentUserIndex + 1),),
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
