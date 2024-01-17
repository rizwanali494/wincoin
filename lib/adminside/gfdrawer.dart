import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/adminside/adminchat.dart';
import 'package:wincoin/adminside/adminrequest.dart';
import 'package:wincoin/adminside/adminstatistics.dart';
import 'package:wincoin/adminside/adminusers.dart';

class gfdrawer extends StatefulWidget {
  const gfdrawer({super.key});

  @override
  State<gfdrawer> createState() => _gfdrawerState();
}

class _gfdrawerState extends State<gfdrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      drawer: GFDrawer(
        color: Colors.black,
        child: SafeArea(
          child: Container(
            color: Colors.black,
            child: ListTileTheme(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.flutter_dash,
                    color: Colors.white,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 120),
                      child: Text(
                        'Capital',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdminRequest()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 105),
                      child: Text(
                        'Request',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const adminstatistics()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 95),
                      child: Text(
                        'Statistics',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const adminchat()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 150),
                      child: Text(
                        'Chat',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const adminusers()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 135),
                      child: Text(
                        'Users',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: const Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          '500 000 €',
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
    );
  }
}
