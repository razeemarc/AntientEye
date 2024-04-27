import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chatbot.dart';


final Uri _url = Uri.parse('https://my.atlist.com/map/fee95552-dbaa-405a-b962-9499b0bbbc82/?share=true');

class ContentPageMK extends StatelessWidget {
  const ContentPageMK({Key? key});

  void _navigateToChatScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    // Text Box at the top of the second page
                    Container(
                      margin: const EdgeInsets.only(top: 45, left: 10),
                      width: 210,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: const Color.fromRGBO(225, 163, 8, 0.75),
                      ),
                      child: const Center(
                        child: Text(
                          ' MarunthuKottai',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // Image
                    Container(
                      margin: const EdgeInsets.only(top: 40, left: 10),
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
                    // Text Below Image
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(249, 246, 246, 0.9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Marunthu Kottai, also known as Marunthu Kottai Malai, is a Tamil term that translates to "Medicine Fort" or "Medicinal Fort" in English. It refers to a traditional medicinal preparation from Tamil Nadu, a state in southern India.Marunthu Kottai is essentially a concoction or formulation made by grinding together various herbs, roots, spices, and other natural ingredients known for their medicinal properties. These ingredients are carefully selected based on their therapeutic benefits and are believed to promote health and well-being.The preparation of Marunthu Kottai typically involves grinding the ingredients into a fine powder or paste, which is then often mixed with honey, ghee (clarified butter), or other mediums for consumption. It can be administered orally or applied externally, depending on the intended purpose and the specific ingredients used.Marunthu Kottai is often used in traditional Tamil medicine, known as Siddha or Siddha Vaidyam, which has a long history dating back thousands of years. Siddha medicine is based on the concept of balancing the body\'s vital energies and restoring harmony to achieve optimal health.Different formulations of Marunthu Kottai may target specific health concerns such as digestive issues, respiratory ailments, joint pain, skin disorders, and more. However, it\'s important to note that while Siddha medicine has been practiced for centuries and is still widely used in certain communities, its efficacy and safety may vary, and it\'s always advisable to consult with a qualified healthcare practitioner before using any traditional remedies.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                          height: 1.5,
                        ),
                      ),
                    ),
                    // View Direction Button
                    Container(
                      margin: const EdgeInsets.only(left: 50, right: 100, bottom: 5, top: 10),
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
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
                  ],
                ),
              ),
              // Back Button
              Positioned(
                top: 12,
                left: 14,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(225, 163, 8, 0.25),
                    radius: 20,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _navigateToChatScreen(context);
            },
            child: const Icon(Icons.chat, color: Colors.white),
            backgroundColor: const Color(0xFFE1A308),
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


