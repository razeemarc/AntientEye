import 'package:flutter/material.dart';
import 'submit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  String? _selectedPlace;
  int _selectedEmojiIndex = -1;
  TextEditingController _commentController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 500,
          height: 844,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 16,
                top: 8,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to previous screen
                  },
                ),
              ),

              Positioned(
                left: 113,
                top: 20,
                child: Text(
                  'Rate Your Experience',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 70,
                child: Container(
                  width: 337,
                  padding: EdgeInsets.all(8),
                  color: Color(0xFF000000A6),
                  child: Text(
                    'We hope you enjoyed your recent visit to the place suggested by our app! Your feedback is valuable to us and helps us improve our recommendations. Please take a moment to rate your experience.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 9,
                top:200,
                child: Container(
                  width: 130,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 240,
                child: Container(
                  width: 305,
                  height: 45, // Adjust the height as needed
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 15,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 86),
                    child: TextField(
                      controller: _nameController,
                      maxLines: 1, // Allow multiple lines for comments
                      decoration: InputDecoration(
                        hintText: 'Enter Your Name',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 315,
                child: Text(
                  'Place Visited',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                left: 54,
                top: 355,
                child: Container(
                  width: 305,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Color(0xFFE1A308),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: Icon(Icons.arrow_drop_down),
                      value: _selectedPlace,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPlace = newValue;
                        });
                      },
                      dropdownColor: Color.fromRGBO(225, 163, 8, 0.75), // Background color of the dropdown menu
                      items: <String>[
                        'Chitharal Rock Cut Temple',
                        'Marunthu Kootai',
                        'Vattakottai',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: Colors.white, // Text color of the dropdown menu items
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 420,
                child: Container(
                  width: 200,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Rate your experience',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // Emojis with GestureDetector for selection
              for (int i = 0; i < 4; i++)
                Positioned(
                  left: 40 + i * 84,
                  top: 459,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedEmojiIndex = i;
                          });
                        },
                        child: Container(
                          width: 57,
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: _selectedEmojiIndex == i
                                ? Color(0xFFE1A308)
                                : Color(0xFF6286A0),
                          ),
                          child: Center(
                            child: Text(
                              _getEmoji(i),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        _getEmojiLabel(i),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              Positioned(
                left: 9,
                top:560,
                child: Container(
                  width: 256,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Write your comment ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 600,
                child: Container(
                  width: 315,
                  height: 150, // Adjust the height as needed
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 25,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _commentController,
                      maxLines: 5, // Allow multiple lines for comments
                      decoration: InputDecoration(
                        hintText: 'Write your comment here',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 48,
                top: 778,
                child: GestureDetector(
                  onTap: _submitFeedback,
                  child: Container(
                    width: 315,
                    height: 50,
                    decoration: BoxDecoration(
                      color : Color(0xFFE1A308),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitFeedback() async {
    if (_selectedPlace == null || _selectedEmojiIndex == -1) {
      // Handle case where either place or emoji is not selected
      print('Please select a place and rate your experience.');
      return;
    }

    // Get the selected place, emoji, and comment
    String selectedPlace = _selectedPlace!;
    String selectedEmojiLabel = _getEmojiLabel(_selectedEmojiIndex);
    String comment = _commentController.text;
    String name = _nameController.text;

    // Prepare the feedback data
    Map<String, dynamic> feedbackData = {
      'place': selectedPlace,
      'rate': selectedEmojiLabel,
      'comment': comment,
      'username': name,
    };

    try {
      // Determine collection name based on selected place
      String collectionName;
      switch (selectedPlace) {
        case 'Chitharal Rock Cut Temple':
          collectionName = 'ChitharalFeedback';
          break;
        case 'Marunthu Kootai':
          collectionName = 'MKFeedback';
          break;
        case 'Vattakottai':
          collectionName = 'VattaKottaiFeedback';
          break;
        default:
          collectionName = 'ChitharalFeedback'; // Default collection name
      }

      // Add feedback data to Firestore
      await FirebaseFirestore.instance.collection(collectionName).add(feedbackData);
      // Feedback submitted successfully
      print('Feedback submitted successfully!');
      // Clear the form
      setState(() {
        _selectedPlace = null;
        _selectedEmojiIndex = -1;
        _commentController.clear();
      });
      //Navigate to ThankYouPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThankYouPage()),
      );
    } catch (e) {
      // Handle error
      print('Error submitting feedback: $e');
    }
  }


  // Helper method to get the emoji based on index
  String _getEmoji(int index) {
    switch (index) {
      case 0:
        return '😍';
      case 1:
        return '🙂';
      case 2:
        return '😐';
      case 3:
        return '😡';
      default:
        return '';
    }
  }

  // Helper method to get the label for each emoji
  String _getEmojiLabel(int index) {
    switch (index) {
      case 0:
        return 'Excellent';
      case 1:
        return 'Good';
      case 2:
        return 'Fair';
      case 3:
        return 'Poor';
      default:
        return '';
    }
  }
}
