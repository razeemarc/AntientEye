import 'package:flutter/material.dart';
import 'third_screen.dart';
import 'dart:async';
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      // Navigate to the SecondScreen after 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ThirdPage(),
        ),
      );
    });
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            // Navigate to the next page when tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdPage()),
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
                width: 10,
                height: 10,
                left: 173,
                top: 770,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
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
                    color: Color.fromRGBO(255, 255, 255, 0.55),
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
                width: 600,
                height: 48,
                left:80,
                top: 681,
                child: Text(
                  'Timeless Tradition of ', // Add '\n' for line break

                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                width: 210,
                height: 48,
                left: (390 - 210) / 2,
                top: 720,
                child: Text(
                  'Kanyakumari!!', // Add '\n' for line break
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
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
                    color: Color.fromRGBO(255, 255, 255, 0.55),
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
                    color: Colors.white,
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
                    color: Color.fromRGBO(255, 255, 255, 0.55),
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
