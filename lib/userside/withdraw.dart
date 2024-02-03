import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/user_functions/Firebase_functions.dart';
import 'package:wincoin/userside/homepage.dart';
import 'package:wincoin/userside/settings.dart';

class withdraw extends StatefulWidget {
  const withdraw({super.key});

  @override
  State<withdraw> createState() => _withdrawState();
}

class _withdrawState extends State<withdraw> {
  Future<void> saveWithdrawRequest(
      BuildContext context,
      String firstName,
      String middleName,
      String surname,
      String country,
      String amount,
      String iban) async {
    try {
      EasyLoading.show(status: 'Loading');
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        FirebaseService firebaseService = FirebaseService();

        // Call the function to save withdrawal request
        await firebaseService.withdrawRequest(
          firstName: firstName,
          middleName: middleName,
          surname: surname,
          country: country,
          amount: amount,
          iban: iban,
        );
        EasyLoading.dismiss();

        // Navigate to the withdrawal process screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const withdrawprocess()),
        );
      }
    } catch (error) {
      print('Error saving withdraw request: $error');
      // Handle the error as needed
    }
  }

  bool isCheckboxChecked = false;

  // Controller for each TextField
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController ibanController = TextEditingController();
  FirebaseService firebaseService =
      FirebaseService(); // Create an instance of FirebaseService
  Future<void> getWithdraw() async {
    try {
      String? withdrawValue = await firebaseService.getWithdrawValue();

      if (withdrawValue != null) {
        // Update the state with the withdrawValue
        setState(() {
          // Assign withdrawValue to a variable, e.g., withdrawAmount
          withdrawAmount = withdrawValue;
        });
      } else {
        print('Withdraw Value is null.');
      }
    } catch (error) {
      print('Error getting withdraw value: $error');
      // Handle the error as needed
    }
  }

  bool isAmountValid = true;
  // Declare a variable to hold the withdraw amount
  String? withdrawAmount;
  void validateWithdrawalAmount(String value) {
    double userInput = double.tryParse(value) ?? 0.0;

    String? withdrawAmount = this.withdrawAmount;

    if (withdrawAmount != null) {
      try {
        double withdrawalValue = double.parse(withdrawAmount);

        if (userInput > withdrawalValue) {
          setState(() {
            isAmountValid = false;
          });
        } else {
          setState(() {
            isAmountValid = true;
          });
        }
      } catch (e) {
        print('Error parsing withdrawal amount: $e');
      }
    } else {
      print('Error: Withdrawal amount is null.');
    }
  }

  bool _validateFields() {
    if (firstNameController.text.isEmpty ||
        middleNameController.text.isEmpty ||
        surnameController.text.isEmpty ||
        countryController.text.isEmpty ||
        ibanController.text.isEmpty) {
      return false;
    }
    return true;
  }

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
                      InkWell(
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
                                  FutureBuilder(
                                    future: firebaseService.getWithdrawValue(),
                                    builder: (context, snapshot) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none:
                                        case ConnectionState.waiting:
                                          // Display a loading indicator while waiting for the future
                                          return const CircularProgressIndicator(
                                            color: Colors.transparent,
                                          );
                                        case ConnectionState.done:
                                          // Check if the snapshot has data
                                          if (snapshot.hasData) {
                                            // Update the withdrawAmount variable
                                            withdrawAmount = snapshot.data;

                                            // Display the withdraw value in the Text widget
                                            return Text(
                                              '$withdrawAmount €',
                                              style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenwidth * 0.045,
                                              ),
                                            );
                                          } else {
                                            // Handle the case where the snapshot has no data
                                            return const Text(
                                                'No data available');
                                          }
                                        default:
                                          // Handle other ConnectionState values
                                          return const Text('Error');
                                      }
                                    },
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
                            padding: EdgeInsets.only(right: screenwidth * 0.1),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: FutureBuilder(
                                future: firebaseService.getWithdrawValue(),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                    case ConnectionState.waiting:
                                      // Display a loading indicator while waiting for the future
                                      return const CircularProgressIndicator(
                                        color: Colors.transparent,
                                      );
                                    case ConnectionState.done:
                                      // Check if the snapshot has data
                                      if (snapshot.hasData) {
                                        // Update the withdrawAmount variable
                                        withdrawAmount = snapshot.data;

                                        // Display the withdraw value in the Text widget
                                        return Text(
                                          '$withdrawAmount €',
                                          style: GoogleFonts.inter(
                                            color: const Color(0xff525252),
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenwidth * 0.035,
                                          ),
                                        );
                                      } else {
                                        // Handle the case where the snapshot has no data
                                        return const Text('No data available');
                                      }
                                    default:
                                      // Handle other ConnectionState values
                                      return const Text('Error');
                                  }
                                },
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
                              style: const TextStyle(color: Colors.white),
                              controller: firstNameController,
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
                                  style: const TextStyle(color: Colors.white),
                                  controller: middleNameController,
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
                                  style: const TextStyle(color: Colors.white),
                                  controller: surnameController,
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
                                  style: const TextStyle(color: Colors.white),
                                  controller: countryController,
                                  decoration: InputDecoration(
                                    hintText: ' COUNTRY',
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
                                  style: const TextStyle(color: Colors.white),
                                  controller: amountController,
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
                                  onChanged: (value) {
                                    validateWithdrawalAmount(value);
                                  },
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
                              style: const TextStyle(color: Colors.white),
                              controller: ibanController,
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
                                    color: const Color.fromRGBO(68, 68, 68, 1),
                                  ),
                                ),
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                  value: isCheckboxChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckboxChecked = value ?? false;
                                    });
                                  },
                                ),
                              ),
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
                              onTap: () async {
                                EasyLoading.show(status: 'Loading...');

                                try {
                                  // Check if the user can make a withdrawal request
                                  bool canMakeWithdrawal = await firebaseService
                                      .canMakeWithdrawalRequest();

                                  if (canMakeWithdrawal) {
                                    // Check if the checkbox is checked and amount is valid
                                    if (isCheckboxChecked && isAmountValid) {
                                      // Validate all fields
                                      if (_validateFields()) {
                                        // Save withdraw request
                                        await saveWithdrawRequest(
                                          context,
                                          firstNameController.text,
                                          middleNameController.text,
                                          surnameController.text,
                                          countryController.text,
                                          amountController.text,
                                          ibanController.text,
                                        );

                                        EasyLoading.dismiss();
                                      } else {
                                        EasyLoading.showInfo(
                                            'Please fill in all fields');
                                        EasyLoading.dismiss();
                                      }
                                    } else {
                                      EasyLoading.showInfo(
                                        'Please Tick Checkbox If you agreed or Check Amount should be less than available balance',
                                      );
                                      EasyLoading.dismiss();
                                    }
                                  } else {
                                    // User needs to wait for 14 days, show a message or take appropriate action
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Theme(
                                          data: ThemeData.dark().copyWith(
                                            // Set custom colors for dark mode
                                            scaffoldBackgroundColor:
                                                Colors.black,
                                            dialogBackgroundColor:
                                                Colors.grey[900],
                                            cardColor: Colors.grey[900],
                                            primaryColor: Colors.green,
                                     
                                            textTheme: TextTheme(
                                              headline6: TextStyle(
                                                color: Colors
                                                    .white, // Set text color for dark mode
                                              ),
                                              bodyText2: TextStyle(
                                                color: Colors
                                                    .white, // Set text color for dark mode
                                              ),
                                            ),
                                            buttonTheme: ButtonThemeData(
                                              textTheme:
                                                  ButtonTextTheme.primary,
                                              buttonColor: Colors.green,
                                            ),
                                          ),
                                          child: AlertDialog(
                                            
                                            content: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                  'You need to wait  since the last withdrawal is processing.',style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w500
                                                  ),),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );

                                    EasyLoading.dismiss();
                                  }
                                } catch (error) {
                                  // Handle any errors that may occur during the withdrawal check
                                  print(
                                      'Error checking withdrawal eligibility: $error');
                                  EasyLoading.showError(
                                      'An error occurred. Please try again.');
                                  EasyLoading.dismiss();
                                }
                              },
                              child: Container(
                                height: screenheight * 0.075,
                                width: screenwidth * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(146, 208, 80, 1),
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'SEND',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: screenwidth * 0.07,
                                      fontWeight: FontWeight.w600,
                                    ),
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
