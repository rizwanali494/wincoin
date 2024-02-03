import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoin/adminside/adminchat.dart';

class AdminChatUsersPage extends StatefulWidget {
  const AdminChatUsersPage({Key? key}) : super(key: key);

  @override
  _AdminChatUsersPageState createState() => _AdminChatUsersPageState();
}

class _AdminChatUsersPageState extends State<AdminChatUsersPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> userIDs = [];

  @override
  void initState() {
    super.initState();
    _fetchUserIDs();
  }

  // Fetch user IDs from Firestore
  Future<void> _fetchUserIDs() async {
    try {
      QuerySnapshot usersSnapshot =
          await _firestore.collectionGroup('messages').get();
      Set<String> uniqueUserIDs = <String>{};

      for (QueryDocumentSnapshot doc in usersSnapshot.docs) {
        String senderUid = doc['senderUid'];
        if (senderUid.isNotEmpty) {
          uniqueUserIDs.add(senderUid);
        }
      }

      setState(() {
        userIDs = uniqueUserIDs.toList();
      });
    } catch (error) {
      print("Error fetching user IDs: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Chat Users'),
      ),
      body: ListView.builder(
        itemCount: userIDs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(userIDs[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AdminChatPage(selectedUserID: userIDs[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class AdminChatPage extends StatefulWidget {
  final String selectedUserID;

  const AdminChatPage({Key? key, required this.selectedUserID})
      : super(key: key);

  @override
  _AdminChatPageState createState() => _AdminChatPageState();
}

class _AdminChatPageState extends State<AdminChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
                height: screenheight * 0.05,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: _firestore
                      .collection('user_chats')
                      .doc(widget.selectedUserID)
                      .collection('messages')
                      .orderBy('timestamp')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var messages = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        final messageText = message['text'];
                        final messageSenderUid = message['senderUid'];
                        final isCurrentUser = 'admin' == messageSenderUid;

                        return Padding(
                          padding: const EdgeInsets.all(10.0),
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
                              // color: isCurrentUser ? Colors.blue : Colors.green,
                              decoration: BoxDecoration(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      _firestore
          .collection('user_chats')
          .doc(widget.selectedUserID)
          .collection('messages')
          .add({
        'text': messageText,
        'senderUid': 'admin', // You can set a unique ID for admin
        'timestamp': FieldValue.serverTimestamp(),
      });

      _messageController.clear();
    }
  }
}
