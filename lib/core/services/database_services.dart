import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DataBaseServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Future<void> addData(String title, String detail, DateTime dateTime) async {
  //   await _firebaseFirestore.collection('notes').add({
  //     "title": title,
  //     "detail": detail,
  //     'createdAt': DateTime.now(),
  //     'reminder': dateTime,
  //   });
  // }

  Future<void> addData(
      String title, String detail, DateTime dateTime, User currentUser) async {
    await _firebaseFirestore
        .collection('notes')
        .doc(currentUser.uid)
        .collection('personal_notes')
        .add({
      "title": title,
      "detail": detail,
      'createdAt': DateTime.now(),
      'reminder': dateTime,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllNotes(User user) {
    return _firebaseFirestore
        .collection('notes')
        .doc(user.uid)
        .collection('personal_notes')
        .orderBy('createdAt', descending: true)
        .snapshots();
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

  Future<void> deleteNote(DocumentReference ref) async {
    await ref.delete();
  }

  ///Bookmarks Methods

  Future<void> addBookmarksData(
      String title, String detail, DateTime dateTime, User currentUser) async {
    await _firebaseFirestore
        .collection('bookmarks')
        .doc(currentUser.uid)
        .collection('personal_bookmarks')
        .add({
      "title": title,
      "detail": detail,
      'createdAt': DateTime.now(),
      'reminder': dateTime,
    });

    // await _firebaseFirestore.collection('bookmarks').add({
    //   "title": title,
    //   "detail": detail,
    //   'createdAt': DateTime.now(),
    //   'reminder': dateTime,
    // });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllBookMarksNotes(User user) {
    return _firebaseFirestore
        .collection('bookmarks')
        .doc(user.uid)
        .collection('personal_bookmarks')
        .orderBy('createdAt', descending: true)
        .snapshots();

    // return _firebaseFirestore
    //     .collection('bookmarks')
    //     .orderBy('createdAt', descending: true)
    //     .snapshots();
  }

  Future<void> updateBookMarksData(DocumentReference ref, String title,
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
