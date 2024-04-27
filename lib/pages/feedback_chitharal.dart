import 'package:flutter/material.dart';
import 'feedback.dart';
import 'map_page.dart';

class FeedbackChitharal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white, // Set background color to white
          child: Stack(
            children: [
              // Manual back button
              Positioned(
                top: 35,
                left: 14,
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(225, 163, 8, 0.25),
                  radius: 20,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Heading at the top
              Positioned(
                top: 40,
                left: 150,
                child: Text(
                  'Feedback', // Your heading text
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 100, 20, 20), // Adjust padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Feedback boxes
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF89A4B8),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : Hrithic',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Place : Chithral Rock Jain Temple',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Rate : Good',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Comment : Very nice place for tourists',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Second feedback box...
                    // Third feedback box...
                    SizedBox(height: 20), // Space between feedback boxes and button
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Positioned(
          bottom: 20.0,
          right: 20.0,
          child: FloatingActionButton(
            onPressed: () {
              // Navigate to the next page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RatingScreen()),
              );
            },
            backgroundColor: Color(0xFFE1A308),
            child: Icon(Icons.edit, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
