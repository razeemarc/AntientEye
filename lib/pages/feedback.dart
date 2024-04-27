import 'package:flutter/material.dart';
import 'submit.dart';


class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  String? _selectedPlace;
  int _selectedEmojiIndex = -1; // Track the index of the selected emoji

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child:Scaffold(
      body: Container(
        width: 500,
        height: 844,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 138,
              top: 28,
              child: Container(
                width: 84,
                height: 38,
                alignment: Alignment.center,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Feedback',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              left:14,
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
                        Navigator.pop(context); // Navigate back to the previous page
                      },

                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 34,
              top: 80,
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
              top: 120,
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
              left: 34,
              top: 245,
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
              left: 34,
              top: 285,
              child: Container(
                width: 305,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Color.fromRGBO(225, 163, 8, 0.75),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: DropdownButton<String>(
                    dropdownColor: Color.fromRGBO(225, 163, 8, 0.75), // Set the background color of dropdown menu
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: Icon(Icons.arrow_drop_down),
                    value: _selectedPlace,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPlace = newValue;
                      });
                    },
                    items: <String>[
                      'Chitharal Rock Cut Temple',
                      'Marunthu Kootai',
                      'Suchindram Temple',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.white, // Set the text color to white
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
              top: 350,
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
                    fontSize: 19,
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
                top: 399,
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
            // Your existing Positioned widgets...
            Positioned(
              left: 49,
              top: 499,
              child: Container(
                width: 256,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Write your comment (optional) ',
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
              top: 548,
              child: GestureDetector(
                onTap: () {
                  // Handle the tap event here
                  // You can open a modal bottom sheet, navigate to a new screen, etc.
                },
                child: Container(
                  width: 315,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
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
                      decoration: InputDecoration(
                        hintText: '''Describe here your  experience ''',
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
            ),
            Positioned(
              left: 111,
              top: 728,
              child: GestureDetector(
                onTap: () {
                  // Navigate to the next page when submit button is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThankYouPage()),
                  );
                },
                child: Container(
                  width: 168,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Color(0xFFE1A308),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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
      )
    );
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

