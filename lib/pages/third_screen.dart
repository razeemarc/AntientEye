import 'package:flutter/material.dart';
import 'second_screen.dart'; // Import the next page file
import 'login.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            // Navigate to the next page when tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
          child: Stack(
            children: [
              Container(
                width: 530,
                height: 844,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Positioned(
                width: 490,
                height: 1015.71,
                left: -30,
                top: -40,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/thiruvalluvar.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Positioned(
                width: 146,
                height: 12,
                left: (390 - 146) / 2, // center horizontally
                top: 817,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.35),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              //top linear gradient
              Positioned(
                width: 499.81,
                height: 523.73,
                left: -2.65,
                top: -107,
                child: Transform.rotate(
                  angle: 0.48 * (3.141592653589793 / 180), // Convert degrees to radians
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFE1A308),
                          Color.fromRGBO(225, 163, 8, 0),
                        ],
                        stops: [0.1728, 0.9109],
                      ),
                    ),
                  ),
                ),
              ),
              //bottom linear gradient
              Positioned(
                width: 499.81,
                height: 523.73,

                top: 530.71,
                child: Transform.rotate(
                  angle: -178.69 * (3.141592653589793 / 180), // Convert degrees to radians
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter, // Start from the bottom
                        end: Alignment.center, // End at the center
                        colors: [
                          Color.fromRGBO(225, 163, 8, 0),
                          Color(0xFFE1A308),

                        ],
                        stops: [0.1728, 0.9909],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                width: 178,
                height: 55,
                left: (242 - 20) / 2, // center horizontally
                top: 681,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27.0), // Adjust border radius as needed
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6286A0)),                  ),
                  child: Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,

                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                width: 10,
                height: 10,
                left: 173,
                top: 770,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color:Color.fromRGBO(255, 255, 255, 0.55),
                  ),
                ),
              ),
              Positioned(
                width: 10,
                height: 10,
                left: 187,
                top: 770,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 255, 255, 0.55),
                  ),
                ),
              ),
              Positioned(
                width: 10,
                height: 10,
                left: 201,
                top: 770,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
