import 'package:flutter/material.dart';
import 'chatbot.dart';
import 'interactive_page.dart';
import 'interactivepage_mk.dart';
import 'interactive_vk.dart';
import 'feedback_chitharal.dart';
import 'feedback_mk.dart';
import 'feedback_vk.dart';

class MapPage extends StatelessWidget {
  void _navigateToChatScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 63,
              left: 20,
              child: Container(
                width: 369,
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/thiruvaluvar.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 214,
              left: 20,
              child: Container(
                width: 369,
                height: 39,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(233, 186, 70, 0.56),
                      Color.fromRGBO(178, 171, 171, 0.69),
                    ],
                    stops: [0, 1],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 7,
              child: GestureDetector(
                onTap: () {
                  // Do something when locationicon.png is tapped
                  print('Location icon tapped');
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(2.5, 0.83, 2.5, 1.67),
                  child: Image.asset(
                    'assets/locationicon.png',
                    width: 40,
                    height: 25,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 23,
              left: 40,
              child: Row(
                children: [
                  SizedBox(width: 8),
                  Container(
                    width: 95,
                    height: 20,
                    child: Text(
                      'Kanyakumari',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 270,
              left: 18,
              child: Container(
                width: 375,
                height: 430,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 400,
                        height: 410,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/mainmap2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 182,
                      left: 139,
                      child: Padding(
                        padding: EdgeInsets.all(2.5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ImageSliderApp()),
                            );
                          },
                          child: Opacity(
                            opacity: 0.95,
                            child: Image.asset(
                              'assets/transparenticon1.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 190,
                      left: 185,
                      child: Padding(
                        padding: EdgeInsets.all(2.5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MarunthukottaiPage()),
                            );
                          },
                          child: Opacity(
                            opacity: 0.95,
                            child: Image.asset(
                              'assets/transparenticon2.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 275,
                      left: 247,
                      child: Padding(
                        padding: EdgeInsets.all(2.5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VattakottaiFortPage(),
                              ),
                            );
                          },
                          child: Opacity(
                            opacity: 0.95,
                            child: Image.asset(
                              'assets/transparenticon3.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(18),
                          ),
                          color: Color.fromRGBO(98, 134, 160, 1),
                        ),
                        child: Center(
                          child: Text(
                            'Select your preferred location',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 715,
              left: 29,
              child: Opacity(
                opacity: 1,
                child: Container(
                  width: 188,
                  height: 24,
                  child: Text(
                    'View Feedback',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 750,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackChitharal()),
                  );
                },
                child: ClipOval(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/circleimage1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 750,
              left: 130,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackMarunthuKottai()),
                  );
                },
                child: ClipOval(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/circleimage2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 750,
              left: 230,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackVattaKottai()),
                  );
                },
                child: ClipOval(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/circleimage3.jpg'),
                        fit: BoxFit.cover,
                      ),
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
    );
  }
}
