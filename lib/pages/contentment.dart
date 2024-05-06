import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'interactive_page.dart';
import 'chatbot.dart';

final Uri _url = Uri.parse('https://my.atlist.com/map/06f809f2-7835-4768-b818-607f1261a494/?share=true');

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

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
                        'Chitharal Rock Cut Temple, also known as Chitharal Jain Temple or Chitharal Malai Kovil, stands as a testament to the rich cultural heritage and architectural brilliance of ancient India. Situated amidst the serene landscape of Chitharal village near Kanyakumari in Tamil Nadu, this remarkable site holds a plethora of historical and religious significance.\n\nThe temple complex is carved out of a single rocky hill, showcasing the mastery of ancient artisans who sculpted intricate structures into the natural rock formations. Dating back to the 8th century AD, during the reign of the Pandyan dynasty, these rock-cut sculptures serve as a window into the religious and artistic fervor of that era.\n\nOne of the most striking features of Chitharal Rock Cut Temple is its association with Jainism. The site is adorned with magnificent sculptures depicting revered Jain Tirthankaras (spiritual teachers) and deities. Among them, the figures of Lord Mahavira, the 24th Tirthankara, and Lord Bahubali, an iconic symbol of Jainism renowned for his towering statue at Shravanabelagola, hold special reverence.\n\nThe temple complex not only showcases the religious ethos of Jainism but also reflects the cultural amalgamation prevalent in ancient Tamil Nadu. The intricate carvings and inscriptions found here bear testimony to the harmonious coexistence of different faiths and ideologies during that period.\n\nVisitors to Chitharal are not only mesmerized by the architectural splendor but also by the tranquil ambiance that envelops the site. Surrounded by lush greenery and panoramic vistas, the temple offers a serene retreat for spiritual seekers and history enthusiasts alike.\n\nFurthermore, ongoing efforts in preservation and restoration ensure that future generations can continue to marvel at the timeless beauty and historical significance of Chitharal Rock Cut Temple. As a beacon of cultural heritage, it serves as a reminder of the rich tapestry of India\'s past and the enduring legacy of its ancient civilizations.',
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

