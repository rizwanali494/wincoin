import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/adminside/gfdrawer.dart';

class adminchat extends StatelessWidget {
  const adminchat({super.key});

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
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: screenheight * 0.03,
            ),
            Center(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
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
                                height: screenheight * 0.035,
                                width: screenwidth * 0.3,
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
                              Column(
                                children: [
                                  Text(
                                    'Date',
                                    style: GoogleFonts.inter(
                                      color:
                                          const Color.fromRGBO(68, 68, 68, 1),
                                    ),
                                  ),
                                  Text(
                                    '30.12 12:45',
                                    style: GoogleFonts.inter(
                                      color:
                                          const Color.fromRGBO(68, 68, 68, 1),
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const adminstartchat()));
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
    );
  }
}

class adminstartchat extends StatelessWidget {
  const adminstartchat({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(
            left: screenwidth * 0.05,
            right: screenwidth * 0.05,
            top: screenheight * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const adminchat()));
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'SUPPORT CHAT',
                  style: GoogleFonts.inter(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Container(),
              ],
            ),
            SizedBox(
              height: screenheight * 0.15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: screenheight * 0.07,
                width: screenwidth * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(68, 68, 68, 1))),
                child: Center(
                  child: Text(
                    '....',
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(68, 68, 68, 1),
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.05,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: screenheight * 0.07,
                width: screenwidth * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(68, 68, 68, 1))),
                child: Center(
                  child: Text(
                    '....',
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(68, 68, 68, 1),
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.05,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: screenheight * 0.07,
                width: screenwidth * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(68, 68, 68, 1))),
                child: Center(
                  child: Text(
                    '....',
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(68, 68, 68, 1),
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.05,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: screenheight * 0.07,
                width: screenwidth * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(68, 68, 68, 1))),
                child: Center(
                  child: Text(
                    '....',
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(68, 68, 68, 1),
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: screenheight * 0.065,
                  width: screenwidth * 0.65,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                      hintStyle: TextStyle(
                          fontSize: screenwidth * 0.04,
                          color: const Color.fromRGBO(68, 68, 68, 1)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(68, 68, 68, 1)),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(68, 68, 68, 1)),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
