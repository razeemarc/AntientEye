import 'package:flutter/material.dart';

import 'interactive_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chatbot.dart';
final Uri _url = Uri.parse('https://my.atlist.com/map/06f809f2-7835-4768-b818-607f1261a494/?share=true');
class ContentPage extends StatelessWidget {
  const ContentPage({super.key});
  void _navigateToChatScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
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
                    width: 280,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: const Color.fromRGBO(225, 163, 8, 0.75),
                    ),
                    child: const Center(
                      child: Text(
                        'Historical Contents Of Chittaral',
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
                        image: AssetImage('assets/img1.jpg'),
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
                    child: const SingleChildScrollView(
                      child: Text(
                        '               Chittaral, also known as Chittaral Rock Cut Temple, is a historically significant site located in Chittaral village near the town of Kanyakumari in Tamil Nadu, India. The primary attraction of this site is its rock-cut sculptures dating back to the 8th century AD. Chittaral is renowned for its Jain rock-cut sculptures, which are believed to have been created during the Pandyan dynasty rule. These sculptures depict various Jain Tirthankaras and deities, including Mahavira, Parshvanatha, and Bahubali. The exact dating of the sculptures is uncertain, but they are generally believed to date back to around the 8th century AD.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                // Back Button
                Positioned(
                  top: 12,
                  left:14,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
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
                        backgroundColor: Color.fromRGBO(137, 164, 184, 1),
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
}
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}