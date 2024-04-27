import 'package:flutter/material.dart';
import 'map_page.dart'; // Import the MapPage widget

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delayed redirection to MapPage
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MapPage()),
      );
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 280,
                  child: Image.asset(
                    'assets/tick.jpeg',
                    width: 100,
                    height: 100,
                  ),
                ),
                Positioned(
                  bottom: 380,
                  child: Text(
                    'Thank you for your valuable feedback!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
