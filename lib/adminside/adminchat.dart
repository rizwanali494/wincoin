import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wincoin/adminside/adminchattest.dart';
import 'package:wincoin/adminside/gfdrawer.dart';

class adminchat extends StatefulWidget {
  const adminchat({super.key});

  @override
  State<adminchat> createState() => _adminchatState();
}

class _adminchatState extends State<adminchat> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> userIDs = [];
  Map<String, String> usernames = {};
  Map<String, String> lastMessageTimestamps = {};

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
        if (senderUid.isNotEmpty && senderUid != 'admin') {
          uniqueUserIDs.add(senderUid);
          Timestamp timestamp = doc['timestamp'];
          lastMessageTimestamps[senderUid] = timestamp.toDate().toString();
        }
      }

      // Fetch usernames for each user ID
      await _fetchUsernames(uniqueUserIDs);

      setState(() {
        userIDs = uniqueUserIDs.toList();
      });
    } catch (error) {
      print("Error fetching user IDs: $error");
    }
  }

  // Fetch usernames from Firestore
  Future<void> _fetchUsernames(Set<String> userIDs) async {
    try {
      Map<String, String> usernamesMap = {};

      for (String userID in userIDs) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(userID).get();
        String username = userDoc['username'];
        if (username.isNotEmpty) {
          usernamesMap[userID] = username;
        }
      }

      setState(() {
        usernames = usernamesMap;
      });
    } catch (error) {
      print("Error fetching usernames: $error");
    }
  }

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
                itemCount: userIDs.length,
                itemBuilder: (BuildContext context, int index) {
                  String userID = userIDs[index];
                  String username = usernames[userID] ?? 'Unknown';
                  String lastMessageTimestamp =
                      lastMessageTimestamps[userID] ?? '';

                  return Padding(
                    padding: EdgeInsets.only(
                      top: screenheight * 0.02,
                      left: screenwidth * 0.1,
                      right: screenwidth * 0.1,
                    ),
                    child: Container(
                      height: screenheight * 0.09,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: const Color.fromRGBO(68, 68, 68, 1),
                        ),
                      ),
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border: Border.all(
                                  color: const Color.fromRGBO(68, 68, 68, 1),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  username,
                                  style: GoogleFonts.inter(
                                    color: const Color.fromRGBO(68, 68, 68, 1),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Date',
                                  style: GoogleFonts.inter(
                                    color: const Color.fromRGBO(68, 68, 68, 1),
                                  ),
                                ),
                                Text(
                                  _formatTimestamp(lastMessageTimestamp),
                                  style: GoogleFonts.inter(
                                    color: const Color.fromRGBO(68, 68, 68, 1),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminChatPage(
                                        selectedUserID: userIDs[index]),
                                  ),
                                );
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedDate = DateFormat('dd.MM HH:mm').format(dateTime);
    return formattedDate;
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
