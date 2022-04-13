import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class DataBaseServices {
  static Future<void> addData(String title, String detail) async {
    firebaseFirestore
        .collection('notes')
        .add({"title": title, "detail": detail})
        .whenComplete(() => print("Add Success"))
        .catchError((e) {
          print(e.toString());
        });
  }
}

class Authentication {
  static Future<String?> createAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "email already in use";
      }
      if (e.code == "weak-password") {
        return "password is to weak";
      }
      return (e).message;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<String?> signInAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      return (e).message;
    } catch (e) {
      return e.toString();
    }
  }
}
