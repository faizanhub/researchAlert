import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addData(String title, String detail) async {
    _firebaseFirestore
        .collection('notes')
        .add({"title": title, "detail": detail})
        .whenComplete(() => print("Add Success"))
        .catchError((e) {
          print(e.toString());
        });
  }
}
