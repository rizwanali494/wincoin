import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/user_functions/Firebase_functions.dart';
import 'package:wincoin/userside/crewcoin.dart';
import 'package:wincoin/userside/invitefriends.dart';
import 'package:wincoin/userside/onlycoin.dart';
import 'package:wincoin/userside/settings.dart';
import 'package:wincoin/userside/withdraw.dart';
import 'package:wincoin/userside/worldcoin.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final FirebaseService _firebaseService = FirebaseService();

  String? currentUserUid;
  Map<String, dynamic>? userData;
  int userPosition = 0;
  @override
  void initState() {
    super.initState();
    _initializeData();
    _getCurrentUserUid();
    fetchUserPosition();
  }

  Future<void> fetchUserPosition() async {
    try {
      int position = await FirebaseService().getUserPosition();
      setState(() {
        userPosition = position;
      });
      print('User Position: $userPosition');
    } catch (error) {
      print('Error fetching user position: $error');
    }
  }

  Future<void> _initializeData() async {
    try {
      currentUserUid = await _firebaseService.getCurrentUserUid();
      if (currentUserUid != null) {
        userData = await _firebaseService.getUserData(currentUserUid!);
        setState(() {});
      }
    } catch (error) {
      print("Error initializing data: $error");
    }
  }

  final TextEditingController _newPasswordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String withdrawalValue = '';

  Future<void> _getCurrentUserUid() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        currentUserUid = user.uid;
        await _fetchUserData();
      } else {
        // Handle the case where the user is not authenticated
        print("User not authenticated");
      }
    } catch (error) {
      print("Error getting current user ID: $error");
    }
  }

  Future<void> _fetchUserData() async {
    try {
      // Fetch user data from Firestore
      DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(currentUserUid).get();

      if (userSnapshot.exists) {
        setState(() {
          withdrawalValue = userSnapshot['withdrawvalue'] ?? '';
        });

        // Fetch user position
      }
    } catch (error) {
      print("Error fetching user data: $error");
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
                            withdrawalValue,
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
                    userPosition != null
                        ? formatNumber(userPosition)
                        : 'Loading...', // Display 'Loading...' while fetching
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
