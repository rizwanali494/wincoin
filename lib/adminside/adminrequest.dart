import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminRequest extends StatefulWidget {
  const AdminRequest({Key? key}) : super(key: key);

  @override
  _AdminRequestState createState() => _AdminRequestState();
}

class _AdminRequestState extends State<AdminRequest> {
  final List<Item> _data = generateItems(5);

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenheight * 0.03,
              ),
              Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: screenheight * 0.02,
                        left: screenwidth * 0.1,
                        right: screenwidth * 0.1,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: const Color.fromRGBO(68, 68, 68, 1)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: screenheight * 0.07,
                                      width: screenwidth * 0.15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                68, 68, 68, 1)),
                                      ),
                                      child: Icon(
                                        Icons.person_outlined,
                                        color:
                                            const Color.fromRGBO(68, 68, 68, 1),
                                        size: screenwidth * 0.1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _data[index].isExpanded =
                                              !_data[index].isExpanded;
                                        });
                                      },
                                      child: Icon(
                                        _data[index].isExpanded
                                            ? Icons.keyboard_arrow_up_outlined
                                            : Icons
                                                .keyboard_arrow_down_outlined,
                                        color: Colors.white,
                                        size: screenheight * 0.03,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: screenwidth * 0.1,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: screenwidth * 0.35,
                                      height: screenheight * 0.04,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                68, 68, 68, 1)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'username',
                                          style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                68, 68, 68, 1),
                                            fontSize: screenwidth * 0.035,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Withdraw:',
                                          style: GoogleFonts.inter(
                                            color: Colors.grey.shade600,
                                            fontSize: screenwidth * 0.035,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenwidth * 0.06,
                                        ),
                                        Text(
                                          '1 €',
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: screenwidth * 0.05,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.01,
                                    ),
                                    Text(
                                      'request expires in: 1',
                                      style: GoogleFonts.inter(
                                        color: Colors.grey.shade600,
                                        fontSize: screenwidth * 0.035,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if (_data[index].isExpanded)
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: screenheight * 0.08,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenwidth * 0.1),
                                      child: Text(
                                        'Name:',
                                        style: GoogleFonts.inter(
                                          color: Colors.grey.shade600,
                                          fontSize: screenwidth * 0.035,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.005,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenwidth * 0.1),
                                      child: Text(
                                        'Middle Name:',
                                        style: GoogleFonts.inter(
                                          color: Colors.grey.shade600,
                                          fontSize: screenwidth * 0.035,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.005,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenwidth * 0.1),
                                      child: Text(
                                        'Surname:',
                                        style: GoogleFonts.inter(
                                          color: Colors.grey.shade600,
                                          fontSize: screenwidth * 0.035,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.005,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenwidth * 0.1),
                                      child: Text(
                                        'Account:',
                                        style: GoogleFonts.inter(
                                          color: Colors.grey.shade600,
                                          fontSize: screenwidth * 0.035,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.02,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: screenheight * 0.04,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                68, 68, 68, 1)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'IBAN',
                                          style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                68, 68, 68, 1),
                                            fontSize: screenwidth * 0.035,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
