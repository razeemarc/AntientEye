import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'chatbot.dart';
import 'history.dart';

final Uri _url = Uri.parse('https://my.atlist.com/map/06f809f2-7835-4768-b818-607f1261a494/?share=true');

class ContentPageMK extends StatefulWidget {
  const ContentPageMK({Key? key}) : super(key: key);

  @override
  _ContentPageMKState createState() => _ContentPageMKState();
}

class _ContentPageMKState extends State<ContentPageMK> {
  void _navigateToChatScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  }

  List<History> historyItems = [];

  @override
  void initState() {
    fetchHistory();
    super.initState();
  }

  Future<void> fetchHistory() async {
    var records = await FirebaseFirestore.instance.collection('MarunthuKottaiHistory').get();
    mapRecords(records);
  }

  void mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs.map(
          (conversation) => History(
        id: conversation.id,
        history: conversation['history'],
      ),
    ).toList();
    setState(() {
      historyItems = _list.cast<History>(); // Added casting to History object
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // This line removes the debug banner
      home: SafeArea(
        child: GestureDetector(
          child: Scaffold(
            body: Stack(
              children: [
                // Text Box at the top of the second page
                Positioned(
                  top: 58,
                  left: 55,
                  child: Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: const Color.fromRGBO(225, 163, 8, 0.75),
                    ),
                    child: const Center(
                      child: Text(
                        'Historical Contents Of Marunthukottai',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                // Image
                Positioned(
                  top: 140,
                  left: 45,
                  child: Container(
                    width: 319,
                    height: 219,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/mk_img3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Text Below Image
                Positioned(
                  top: 390,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: 400,
                    height: 680,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(249, 246, 246, 0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: historyItems.map((item) => Text(item.history)).toList(),
                      ),
                    ),
                  ),
                ),
                // Back Button
                Positioned(
                  top: 12,
                  left: 14,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(225, 163, 8, 0.25),
                    radius: 20,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  right: 100,
                  bottom: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0), // Adjust vertical padding to increase height
                    child: ElevatedButton(
                      onPressed: _launchUrl,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(137, 164, 184, 1),
                      ),
                      child: Text(
                        'View Direction',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.0, // Adjust this value to change the button's vertical position
                  right: 20.0, // Adjust this value to change the button's horizontal position
                  child: FloatingActionButton(
                    onPressed: () {
                      _navigateToChatScreen(context);
                    },
                    child: const Icon(Icons.chat, color: Colors.white), // Change the icon color here
                    backgroundColor: const Color(0xFFE1A308), // Change the background color here
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
