import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/userside/settings.dart';

class supportchat extends StatefulWidget {
  const supportchat({super.key});

  @override
  State<supportchat> createState() => _supportchatState();
}

class _supportchatState extends State<supportchat> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late String currentUserUid;

  @override
  void initState() {
    super.initState();
    _getCurrentUserUid();
  }

  Future<void> _getCurrentUserUid() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        setState(() {
          currentUserUid = user.uid;
        });
      }
    } catch (error) {
      print("Error getting current user ID: $error");
    }
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty && currentUserUid.isNotEmpty) {
      _firestore
          .collection('user_chats')
          .doc(currentUserUid)
          .collection('messages')
          .add({
        'text': messageText,
        'senderUid': currentUserUid,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _messageController.clear();
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
            left: screenwidth * 0.05,
            right: screenwidth * 0.05,
            top: screenheight * 0.03),
        child: SingleChildScrollView(
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
                height: screenheight * 0.01,
              ),
              SizedBox(
                height: screenheight * 0.8, // Set the desired height
                child: StreamBuilder(
                  stream: _firestore
                      .collection('user_chats')
                      .doc(currentUserUid)
                      .collection('messages')
                      .orderBy('timestamp')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var messages = snapshot.data!.docs.reversed;

                    return ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages.elementAt(index);
                        final messageText = message['text'];
                        final messageSenderUid = message['senderUid'];
                        final isCurrentUser =
                            currentUserUid == messageSenderUid;

                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Align(
                            alignment: isCurrentUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: screenheight * 0.02,
                                  left: screenwidth * 0.2,
                                  right: screenwidth * 0.2,
                                  bottom: screenheight * 0.02),
                              decoration: BoxDecoration(
                                // color:isCurrentUser ? Colors.blue : Colors.green,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    color: const Color.fromRGBO(68, 68, 68, 1)),
                              ),
                              child: Text(
                                messageText,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: screenheight * 0.065,
                    width: screenwidth * 0.7,
                    child: TextField(
                      style: GoogleFonts.inter(color: Colors.white),
                      controller: _messageController,
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
                  InkWell(
                    onTap: _sendMessage,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

// class SupportChat extends StatefulWidget {
//   const SupportChat({Key? key}) : super(key: key);

//   @override
//   _SupportChatState createState() => _SupportChatState();
// }

// class _SupportChatState extends State<SupportChat> {
//   final TextEditingController _messageController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   late String currentUserUid;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentUserUid();
//   }

//   Future<void> _getCurrentUserUid() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         setState(() {
//           currentUserUid = user.uid;
//         });
//       }
//     } catch (error) {
//       print("Error getting current user ID: $error");
//     }
//   }

//   void _sendMessage() {
//     String messageText = _messageController.text.trim();
//     if (messageText.isNotEmpty && currentUserUid.isNotEmpty) {
//       _firestore
//           .collection('user_chats')
//           .doc(currentUserUid)
//           .collection('messages')
//           .add({
//         'text': messageText,
//         'senderUid': currentUserUid,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.only(
//             left: MediaQuery.of(context).size.width * 0.05,
//             right: MediaQuery.of(context).size.width * 0.05,
//             top: MediaQuery.of(context).size.height * 0.03,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const settings(),
//                         ),
//                       );
//                     },
//                     child: const Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     'SUPPORT CHAT',
//                     style: GoogleFonts.inter(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Container(),
//                 ],
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.15,
//               ),
//               // ... Your other UI elements
//               Expanded(
//                 child: StreamBuilder(
//                   stream: _firestore
//                       .collection('user_chats')
//                       .doc(currentUserUid)
//                       .collection('messages')
//                       .orderBy('timestamp')
//                       .snapshots(),
//                   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }

//                     var messages = snapshot.data!.docs.reversed;

//                     return ListView.builder(
//                       reverse: true,
//                       itemCount: messages.length,
//                       itemBuilder: (context, index) {
//                         final message = messages.elementAt(index);
//                         final messageText = message['text'];
//                         final messageSenderUid = message['senderUid'];
//                         final isCurrentUser =
//                             currentUserUid == messageSenderUid;

//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Align(
//                             alignment: isCurrentUser
//                                 ? Alignment.centerRight
//                                 : Alignment.centerLeft,
//                             child: Container(
//                               padding: const EdgeInsets.all(8.0),
//                               color: isCurrentUser ? Colors.blue : Colors.green,
//                               child: Text(
//                                 messageText,
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: _messageController,
//                         decoration: const InputDecoration(
//                           hintText: 'Message',
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.send),
//                       onPressed: _sendMessage,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

    // Container(
    //             height: screenheight * 0.09,
    //             width: screenwidth * 0.7,
    //             decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: const Color.fromRGBO(68, 68, 68, 1),
    //                 ),
    //                 borderRadius: BorderRadius.circular(20)),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Align(
    //                   alignment: Alignment.topLeft,
    //                   child: Padding(
    //                     padding: EdgeInsets.only(left: screenwidth * 0.02),
    //                     child: Text(
    //                       '?',
    //                       style: GoogleFonts.inter(
    //                           color: const Color.fromRGBO(68, 68, 68, 1),
    //                           fontWeight: FontWeight.normal,
    //                           fontSize: screenwidth * 0.055),
    //                     ),
    //                   ),
    //                 ),
    //                 Text(
    //                   'W COIN VALUE',
    //                   style: GoogleFonts.inter(
    //                       color: const Color.fromRGBO(68, 68, 68, 1),
    //                       fontWeight: FontWeight.w500,
    //                       fontSize: screenwidth * 0.035),
    //                 ),
    //                 Container(),
    //               ],
    //             )),
    //         SizedBox(
    //           height: screenheight * 0.02,
    //         ),
    //         Align(
    //           alignment: Alignment.centerRight,
    //           child: Container(
    //               height: screenheight * 0.09,
    //               width: screenwidth * 0.7,
    //               decoration: BoxDecoration(
    //                   border: Border.all(
    //                     color: const Color.fromRGBO(68, 68, 68, 1),
    //                   ),
    //                   borderRadius: BorderRadius.circular(20)),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Align(
    //                     alignment: Alignment.topLeft,
    //                     child: Padding(
    //                       padding: EdgeInsets.only(left: screenwidth * 0.02),
    //                       child: Text(
    //                         '?',
    //                         style: GoogleFonts.inter(
    //                             color: const Color.fromRGBO(68, 68, 68, 1),
    //                             fontWeight: FontWeight.normal,
    //                             fontSize: screenwidth * 0.055),
    //                       ),
    //                     ),
    //                   ),
    //                   Text(
    //                     'CONVERSION TIME',
    //                     style: GoogleFonts.inter(
    //                         color: const Color.fromRGBO(68, 68, 68, 1),
    //                         fontWeight: FontWeight.w500,
    //                         fontSize: screenwidth * 0.035),
    //                   ),
    //                   Container(),
    //                 ],
    //               )),
    //         ),
    //         SizedBox(
    //           height: screenheight * 0.02,
    //         ),
    //         Container(
    //             height: screenheight * 0.09,
    //             width: screenwidth * 0.7,
    //             decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: const Color.fromRGBO(68, 68, 68, 1),
    //                 ),
    //                 borderRadius: BorderRadius.circular(20)),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Align(
    //                   alignment: Alignment.topLeft,
    //                   child: Padding(
    //                     padding: EdgeInsets.only(left: screenwidth * 0.02),
    //                     child: Text(
    //                       '?',
    //                       style: GoogleFonts.inter(
    //                           color: const Color.fromRGBO(68, 68, 68, 1),
    //                           fontWeight: FontWeight.normal,
    //                           fontSize: screenwidth * 0.055),
    //                     ),
    //                   ),
    //                 ),
    //                 Text(
    //                   'DELETE ACCOUNT',
    //                   style: GoogleFonts.inter(
    //                       color: const Color.fromRGBO(68, 68, 68, 1),
    //                       fontWeight: FontWeight.w500,
    //                       fontSize: screenwidth * 0.035),
    //                 ),
    //                 Container(),
    //               ],
    //             )),
    //         SizedBox(
    //           height: screenheight * 0.02,
    //         ),
    //         Align(
    //           alignment: Alignment.centerRight,
    //           child: Container(
    //               height: screenheight * 0.09,
    //               width: screenwidth * 0.7,
    //               decoration: BoxDecoration(
    //                   border: Border.all(
    //                     color: const Color.fromRGBO(68, 68, 68, 1),
    //                   ),
    //                   borderRadius: BorderRadius.circular(20)),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Align(
    //                     alignment: Alignment.topLeft,
    //                     child: Padding(
    //                       padding: EdgeInsets.only(left: screenwidth * 0.02),
    //                       child: Text(
    //                         '?',
    //                         style: GoogleFonts.inter(
    //                             color: const Color.fromRGBO(68, 68, 68, 1),
    //                             fontWeight: FontWeight.normal,
    //                             fontSize: screenwidth * 0.055),
    //                       ),
    //                     ),
    //                   ),
    //                   Text(
    //                     'DOCUMENTS',
    //                     style: GoogleFonts.inter(
    //                         color: const Color.fromRGBO(68, 68, 68, 1),
    //                         fontWeight: FontWeight.w500,
    //                         fontSize: screenwidth * 0.035),
    //                   ),
    //                   Container(),
    //                 ],
    //               )),
    //         ),