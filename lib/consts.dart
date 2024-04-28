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
  static const String char1Voice1 = 'CHAR1_VOICE1';
  static const String char2Voice1 = 'CHAR2_VOICE1';
  static const String char1Voice2 = 'CHAR1_VOICE2';
  static const String char2Voice2 = 'CHAR2_VOICE2';
  static const String char1Voice3 = 'CHAR1_VOICE3';
  static const String char2Voice3 = 'CHAR2_VOICE3';
  static const String placeName = 'place_name';
}
