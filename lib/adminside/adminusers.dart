import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/adminside/gfdrawer.dart';

class adminusers extends StatelessWidget {
  const adminusers({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const gfdrawer()));
          },
          icon: const Icon(
            Icons.menu_rounded,
            size: 30,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: screenheight * 0.05,
              ),
              Center(
                child: SizedBox(
                  width: screenwidth * 0.6,
                  height: screenheight * 0.06,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontSize: screenwidth * 0.04,
                          color: const Color.fromRGBO(68, 68, 68, 1)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(68, 68, 68, 1)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(68, 68, 68, 1)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: screenheight * 0.03,
              ),
              Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: screenheight * 0.02,
                            left: screenwidth * 0.1,
                            right: screenwidth * 0.1),
                        child: Container(
                          height: screenheight * 0.09,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                  color: const Color.fromRGBO(68, 68, 68, 1))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: const Color.fromRGBO(68, 68, 68, 1),
                                  size: screenwidth * 0.1,
                                ),
                                Container(
                                  height: screenheight * 0.04,
                                  width: screenwidth * 0.35,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              68, 68, 68, 1))),
                                  child: Center(
                                    child: Text(
                                      'username',
                                      style: GoogleFonts.inter(
                                          color: const Color.fromRGBO(
                                              68, 68, 68, 1)),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const adminuserdetail()));
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class adminuserdetail extends StatelessWidget {
  const adminuserdetail({super.key});

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
            Icons.arrow_back_ios,
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
              height: screenheight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromRGBO(68, 68, 68, 1),
                      )),
                  child: Icon(
                    Icons.person_outline,
                    color: const Color.fromRGBO(68, 68, 68, 1),
                    size: screenwidth * 0.15,
                  ),
                ),
                Container(
                  height: screenheight * 0.04,
                  width: screenwidth * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                          color: const Color.fromRGBO(68, 68, 68, 1))),
                  child: Center(
                    child: Text(
                      'username',
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(68, 68, 68, 1)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Founded: 01.01.2024',
                style: GoogleFonts.inter(
                    color: const Color.fromRGBO(68, 68, 68, 1),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Accept invites: 5',
                style: GoogleFonts.inter(
                    color: const Color.fromRGBO(68, 68, 68, 1),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Container(
              height: screenheight * 0.055,
              width: screenwidth * 0.8,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border:
                      Border.all(color: const Color.fromRGBO(68, 68, 68, 1))),
              child: Center(
                child: Text(
                  'Email',
                  style: GoogleFonts.inter(
                      color: const Color.fromRGBO(68, 68, 68, 1)),
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Container(
              height: screenheight * 0.055,
              width: screenwidth * 0.8,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border:
                      Border.all(color: const Color.fromRGBO(68, 68, 68, 1))),
              child: Center(
                child: Text(
                  'Birth',
                  style: GoogleFonts.inter(
                      color: const Color.fromRGBO(68, 68, 68, 1)),
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Container(
              height: screenheight * 0.055,
              width: screenwidth * 0.8,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border:
                      Border.all(color: const Color.fromRGBO(68, 68, 68, 1))),
              child: Center(
                child: Text(
                  'History',
                  style: GoogleFonts.inter(
                      color: const Color.fromRGBO(68, 68, 68, 1)),
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Container(
              height: screenheight * 0.055,
              width: screenwidth * 0.8,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border:
                      Border.all(color: const Color.fromRGBO(68, 68, 68, 1))),
              child: Center(
                child: Text(
                  'Chat',
                  style: GoogleFonts.inter(
                      color: const Color.fromRGBO(68, 68, 68, 1)),
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Container(
              height: screenheight * 0.2,
              width: screenwidth * 0.8,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border:
                      Border.all(color: const Color.fromRGBO(68, 68, 68, 1))),
              child: Center(
                child: Text(
                  'Reason',
                  style: GoogleFonts.inter(
                      color: const Color.fromRGBO(68, 68, 68, 1)),
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Center(
              child: Text(
                'Delete Account',
                style: GoogleFonts.inter(
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
