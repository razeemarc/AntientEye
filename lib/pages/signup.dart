import 'package:flutter/material.dart';
import 'login.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 490,
          height: 844,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            children: [
              Positioned(
                width: 499.81,
                height: 523.73,
                left: -2.65,
                top: -107,
                child: Transform.rotate(
                  angle: 0.48 * (3.141592653589793 / 180),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFE1A308),
                          Color.fromRGBO(225, 163, 8, 0),
                        ],
                        stops: [0.2928, 0.9109],
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                width: 182,
                height: 48,
                left: (390 - 182) / 2, // center horizontally
                top: 80,
                child: Text(
                  'Sign up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                width: 323,
                height: 524,
                left: 33,
                top: 197,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          blurRadius: 25,
                          offset: Offset(0, 8),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60), // Add space here
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 26.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(24.0, 14.0, 0, 14.0), // Adjust left padding here
                            ),
                          ),
                        ),
                        SizedBox(height: 20), // Add space here
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 26.0),
                          child: TextField(
                            keyboardType: TextInputType.number, // Set input type to number
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 0, 10.0), // Adjust left padding here
                            ),
                          ),
                        ),
                        SizedBox(height: 40), // Add space here
                        Center(
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignupScreen()),
                                  );
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27.0), // Adjust border radius as needed
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE1A308)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                  child: Text(
                                    'Signup',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Or',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.65),
                                ),
                              ),
                              SizedBox(height: 17),
                              ElevatedButton(
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
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6286A0)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                  child: Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 60), // Add space here
                            ],
                          ),
                        ),
                      ],
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
}
