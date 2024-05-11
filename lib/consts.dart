// consts.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<String> fetchStringValue(String CHAR1_VOICE1) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
    await _firestore.collection('Characters').doc('Chitharal').get();
    if (snapshot.exists) {
      return snapshot.data()?[CHAR1_VOICE1] ?? '';
    } else {
      return '';
    }
  }
}

class FirestoreFields {
  static const String char1Voice1 = 'Hey, have you heard about  \n the  Chitharal  Jain Rock  Cut Temple in \n Kanyakumari?';
  static const String char2Voice1 = 'Yeah, I know about it.\n It\'s a temple carved out of a huge rock, right?';
  static const String char1Voice2 = 'That\'s the one! \n Do you know how old it is?';
  static const String char2Voice2 = 'it is really old, like from the 9th century AD';
  static const String char1Voice3 = 'What makes it special?';
  static const String char2Voice3 = 'It\'s one of the few Jain temples in Tamil Nadu,\n so it\'s pretty unique.';
  static const String placeName = 'Chitharal Rocket Temple';
}