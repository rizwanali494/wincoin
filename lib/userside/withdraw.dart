import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/homepage.dart';

class withdraw extends StatelessWidget {
  const withdraw({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
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
                      Container(
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
                      Text(
                        'WITHDRAW',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenwidth * 0.045),
                      ),
                      const Icon(
                        Icons.redo,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenheight * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: screenwidth * 0.1, right: screenwidth * 0.1),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'MY ACCOUNT:',
                                style: GoogleFonts.inter(
                                    color: const Color(0xff525252),
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenwidth * 0.035),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '0,024',
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenwidth * 0.05),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                      width: screenwidth * 0.055,
                                      height: screenheight * 0.04,
                                      child: Image.asset(
                                        'Assets/images/AppIcon.png',
                                      ))
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: screenwidth * 0.1),
                            child: const Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.arrow_downward_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: screenwidth * 0.07),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                '0,024 €',
                                style: GoogleFonts.inter(
                                    color: const Color(0xff525252),
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenwidth * 0.035),
                              ),
                            ),
                          ),
                          const Divider(color: Color.fromRGBO(68, 68, 68, 1)),
                          SizedBox(
                            height: screenheight * 0.03,
                          ),
                          SizedBox(
                            height: screenheight * 0.06,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'FIRST NAME',
                                hintStyle: TextStyle(
                                    fontSize: screenwidth * 0.035,
                                    color: const Color.fromRGBO(68, 68, 68, 1)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(68, 68, 68, 1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(68, 68, 68, 1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: screenheight * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: screenheight * 0.06,
                                width: screenwidth * 0.35,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'MIDDLE NAME',
                                    hintStyle: TextStyle(
                                        fontSize: screenwidth * 0.035,
                                        color: const Color.fromRGBO(
                                            68, 68, 68, 1)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(68, 68, 68, 1)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(68, 68, 68, 1)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: screenheight * 0.06,
                                width: screenwidth * 0.35,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'SURNAME',
                                    hintStyle: TextStyle(
                                        fontSize: screenwidth * 0.035,
                                        color: const Color.fromRGBO(
                                            68, 68, 68, 1)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(68, 68, 68, 1)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(68, 68, 68, 1)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenheight * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'The Country of the Bank,s Headquarter',
                                style: GoogleFonts.inter(
                                    color: const Color.fromRGBO(68, 68, 68, 1),
                                    fontSize: screenwidth * 0.02),
                              ),
                              Text(
                                'Amount',
                                style: GoogleFonts.inter(
                                    color: const Color.fromRGBO(68, 68, 68, 1),
                                    fontSize: screenwidth * 0.025),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenheight * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: screenheight * 0.06,
                                width: screenwidth * 0.4,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'CHOOSE COUNTRY',
                                    hintStyle: TextStyle(
                                        fontSize: screenwidth * 0.035,
                                        color: const Color.fromRGBO(
                                            68, 68, 68, 1)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(68, 68, 68, 1)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(68, 68, 68, 1)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: screenheight * 0.06,
                                width: screenwidth * 0.3,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'min. 1€',
                                    hintStyle: TextStyle(
                                        fontSize: screenwidth * 0.035,
                                        color: const Color.fromRGBO(
                                            68, 68, 68, 1)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(68, 68, 68, 1)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromRGBO(68, 68, 68, 1)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenheight * 0.05,
                          ),
                          SizedBox(
                            height: screenheight * 0.06,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'IBAN',
                                hintStyle: TextStyle(
                                    fontSize: screenwidth * 0.035,
                                    color: const Color.fromRGBO(68, 68, 68, 1)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(68, 68, 68, 1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(68, 68, 68, 1)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: screenheight * 0.03,
                          ),
                          const Divider(color: Color.fromRGBO(68, 68, 68, 1)),
                          SizedBox(
                            height: screenheight * 0.04,
                          ),
                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            68, 68, 68, 1)),
                                  ),
                                  width: 20,
                                  height: 20,
                                  child: const Checkbox(
                                      value: false, onChanged: null)),
                              SizedBox(
                                width: screenwidth * 0.1,
                              ),
                              Flexible(
                                child: Text(
                                  'The Payment is non refundable. I,m sure i entered my details correctly.',
                                  style: GoogleFonts.inter(
                                      color:
                                          const Color.fromRGBO(68, 68, 68, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenwidth * 0.03),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: screenheight * 0.04,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const withdrawprocess()));
                              },
                              child: Container(
                                height: screenheight * 0.075,
                                width: screenwidth * 0.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            146, 208, 80, 1),
                                        width: 2)),
                                child: Center(
                                  child: Text(
                                    'SEND',
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: screenwidth * 0.07,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
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
      ),
    );
  }
}

class withdrawprocess extends StatelessWidget {
  const withdrawprocess({super.key});

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
                    Container(
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
                    Text(
                      'WITHDRAW',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenwidth * 0.045),
                    ),
                    const Icon(
                      Icons.redo,
                      color: Colors.white,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenheight * 0.25,
                    ),
                    Center(
                      child: Text(
                        'IN THE PROCESS',
                        style: GoogleFonts.inter(
                            color: const Color.fromRGBO(68, 68, 68, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: screenwidth * 0.08),
                      ),
                    ),
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                    Center(
                      child: Text(
                        '. . .',
                        style: GoogleFonts.inter(
                            color: const Color.fromRGBO(146, 208, 80, 1),
                            fontSize: screenwidth * 0.1),
                      ),
                    ),
                    SizedBox(
                      height: screenheight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenwidth * 0.1, right: screenwidth * 0.08),
                      child: Text(
                        'The process will be completed within 14 working days',
                        style: GoogleFonts.inter(
                            color: const Color.fromRGBO(68, 68, 68, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: screenwidth * 0.04),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: screenheight * 0.2,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const homepage()));
                        },
                        child: Container(
                          height: screenheight * 0.075,
                          width: screenwidth * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color.fromRGBO(68, 68, 68, 1),
                                  width: 2)),
                          child: Center(
                            child: Text(
                              'BACK',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: screenwidth * 0.07,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                  ],
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
