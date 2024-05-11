import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech_tutorial/consts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'contentment.dart';
import 'map_page.dart';





class ImageSliderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterTts _flutterTts = FlutterTts();

  List<Map> _voices = [];
  Map? _currentVoice;

  int? _currentWordStart, _currentWordEnd;

  @override
  void initState() {
    super.initState();
    initTTS();
    _flutterTts.speak(FirestoreFields.char1Voice1); // Start speaking when the page is opened

    _speakMaleVoiceAfterDelay();
  }

  void initTTS() {
    _flutterTts.setProgressHandler((text, start, end, word) {
      setState(() {
        _currentWordStart = start;
        _currentWordEnd = end;
      });
    });
    _flutterTts.getVoices.then((data) {
      try {
        List<Map> voices = List<Map>.from(data);
        setState(() {
          _voices =
              voices.where((voice) => voice["name"].contains("en")).toList();
          _currentVoice = _voices.first;
          // setVoice(_currentVoice!);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  void _speakMaleVoiceAfterDelay() {
    Future.delayed(Duration(seconds: 8), () {
      _flutterTts.setLanguage("en-IN"); // Set language to English
      _flutterTts.setVoice({
        "name": "en-us-x-sfg#male_5-local",
      });
      _flutterTts.speak(FirestoreFields.char2Voice1); // Speak the male voice message
    });
    Future.delayed(Duration(seconds: 16), () {
      _flutterTts.setLanguage("en-US"); // Set language to English
      _flutterTts.setVoice({
        "name": "en-us-x-sfg#male_1-local",
      });
      _flutterTts.speak(FirestoreFields.char1Voice2); // Speak the male voice message
    });
    Future.delayed(Duration(seconds: 24), () {
      _flutterTts.setLanguage("en-IN"); // Set language to English
      _flutterTts.setVoice({
        "name": "en-us-x-sfg#male_5-local",
      });
      _flutterTts.speak(FirestoreFields.char2Voice2); // Speak the male voice message
    });
    Future.delayed(Duration(seconds: 30), () {
      _flutterTts.setLanguage("en-US"); // Set language to English
      _flutterTts.setVoice({
        "name": "en-us-x-sfg#male_1-local",
      });
      _flutterTts.speak(FirestoreFields.char1Voice3); // Speak the male voice message
    });
    Future.delayed(Duration(seconds: 38), () {
      _flutterTts.setLanguage("en-IN"); // Set language to English
      _flutterTts.setVoice({
        "name": "en-us-x-sfg#male_5-local",
      });
      _flutterTts.speak(FirestoreFields.char2Voice3); // Speak the male voice message
    });
  }

  @override
  void dispose() {
    _flutterTts.stop(); // Stop the text-to-speech engine
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ImageSliderScreen(), // Include the ImageSliderScreen widget
          ),
        ],
      ),
    );
  }
}

class ImageSliderScreen extends StatefulWidget {
  @override
  _ImageSliderScreenState createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> _images = [
    'assets/chittaral1.jpg',
    'assets/chittaral2.jpg',
    'assets/chittaral3.jpg',
    'assets/chittaral4.jpg',
    // Add more image paths as necessary
  ];

  bool showFirstCharacter = true;
  bool showSecondCharacter = false;

  String firstCharacterText = FirestoreFields.char1Voice1;
  String secondCharacterText = FirestoreFields.char2Voice1;

  @override
  void initState() {
    super.initState();

    // First part of initState()

    Future.delayed(Duration(seconds: 8), () {
      setState(() {
        showFirstCharacter = false;
        showSecondCharacter = true;
        if (showSecondCharacter) {
          firstCharacterText = FirestoreFields.char1Voice2;
        }
      });
    });
    Future.delayed(Duration(seconds: 16), () {
      setState(() {
        showFirstCharacter = true;
        showSecondCharacter = false;
        if (showFirstCharacter) {
          secondCharacterText = FirestoreFields.char2Voice2;
        }
      });
    });
    Future.delayed(Duration(seconds: 24), () {
      setState(() {
        showFirstCharacter = false;
        showSecondCharacter = true;
        if (showSecondCharacter) {
          firstCharacterText = FirestoreFields.char1Voice3;
        }
      });
    });
    Future.delayed(Duration(seconds: 32), () {
      setState(() {
        showFirstCharacter = true;
        showSecondCharacter = false;
        if (showFirstCharacter) {
          secondCharacterText = FirestoreFields.char2Voice3;
        }
      });
    });
    Future.delayed(Duration(seconds: 40), () {
      setState(() {
        showFirstCharacter = false;
        showSecondCharacter = true;
        if (showSecondCharacter) {
          firstCharacterText = FirestoreFields.char2Voice3;
        }
      });
    });

    // Second part of initState()
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 545,
              left: 75,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE7B948), // Change color as needed
                ),
              ),
            ),
            Positioned(
              top: 650,
              child: Container(
                width: 430,
                height: 280,
                child: Image.asset(
                  'assets/mountain.png', // Replace 'your_image.png' with the appropriate image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 58,
              left: 80,
              child: Container(
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Color.fromRGBO(225, 163, 8, 0.75),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8), // Adjust padding as needed
                      child: Icon(
                        Icons.location_on, // Your location icon
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: Text(
                        FirestoreFields.placeName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 350, left: 30, right: 30),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 210,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return Positioned(
                          top: -8,
                          left: 36 + (index * 70),
                          child: ClipRRect(
                            child: Image.asset(
                              _images[index],
                              width: 219,
                              height: 119,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 95,
              left: 30,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 212,
                  height: 235,
                  child: Image.asset(
                    'assets/character.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 455,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(_currentPage),
              ),
            ),
            Positioned(
              top: 790,
              left: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContentPage()),
                  ).then((_) {
                    // When returning from the content page, stop the TTS engine
                    _stopTTS();
                  });
                },
                child: Text(
                  'To Know More',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  backgroundColor: Color(0xFFE7B948),
                ),
              ),
            ),
            Positioned(
              top: 760,
              left: 78,
              child: Container(
                width: 290,
                height: 50,
                child: Text(
                  'We are here to make your experience unforgettable. Could you please answer a few questions?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
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
            if (showFirstCharacter)
              Positioned(
                top: 340,
                left: -40,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/box.png',
                      width: 350,
                      height: 170.22,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 105, // Adjust this value to position the text vertically
                      left: 60, // Adjust this value to position the text horizontally
                      child: Text(
                        firstCharacterText,
                        style: TextStyle(
                          color: Colors.white, // Adjust the color as needed
                          fontSize: 10, // Adjust the font size as needed
                          fontWeight: FontWeight.bold, // Adjust the font weight as needed
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (showSecondCharacter)
              Positioned(
                top: 340,
                left: 70,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/box2.png',
                      width: 350,
                      height: 170.22,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 105, // Adjust this value to position the text vertically
                      left: 65, // Adjust this value to position the text horizontally
                      child: Text(
                        secondCharacterText,
                        style: TextStyle(
                          color: Colors.white, // Adjust the color as needed
                          fontSize: 10, // Adjust the font size as needed
                          fontWeight: FontWeight.bold, // Adjust the font weight as needed
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator(int currentPage) {
    List<Widget> indicators = [];
    for (int i = 0; i < _images.length; i++) {
      indicators.add(
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == i ? Color(0xFFE7B948) : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }

  void _stopTTS() {
    // Stop the text-to-speech engine
    FlutterTts().stop();
  }
}