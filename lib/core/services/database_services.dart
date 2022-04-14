import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addData(String title, String detail) async {
    await _firebaseFirestore
        .collection('notes')
        .add({"title": title, "detail": detail});
  }
}
