import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech_tutorial/pages/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:FirebaseOptions(
          apiKey: "AIzaSyBMRaDxuNKEUzPVTnNhXSkhrCn2iPOw14s",
          appId: "1:268201396807:android:e1a72471a67e30d2ae3f62",
          messagingSenderId:"268201396807",
          projectId: "adminpanel-e1d50"
      )
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}
