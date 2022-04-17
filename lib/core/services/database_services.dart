import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DataBaseServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addData(String title, String detail, DateTime dateTime) async {
    await _firebaseFirestore.collection('notes').add({
      "title": title,
      "detail": detail,
      'createdAt': DateTime.now(),
      'reminder': dateTime,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllNotes() {
    return _firebaseFirestore.collection('notes').snapshots();
  }

  Future<void> updateNotesData(DocumentReference ref, String title,
      String detail, DateTime dateTime) async {
    try {
      await ref.update({
        "title": title,
        "detail": detail,
        'createdAt': DateTime.now(),
        'reminder': dateTime,
      });

      // .set(teacher.toJson(), SetOptions(merge: true));
    } catch (e) {
      print(
          'Exception occurred while saving data to firestore ${e.toString()}');
      rethrow;
    }
  }
}
