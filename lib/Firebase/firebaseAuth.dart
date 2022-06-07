import 'dart:io';

import 'package:yurutecrobot/export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }


  Future<User?> createPerson(String email, String name, String password) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore.collection('Person').doc(user.user!.uid).set({
        'userName': name,
        'email': email,
        'password': password,
      });
      return user.user;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> personUpdate(
      String guncelname,
      String guncelemail,
      String guncelpassword,
      String guncelphoneNumber,
      String gunceladress) async {
    try {
      _auth.currentUser!.updatePassword(guncelpassword);
      _auth.currentUser!.updateEmail(guncelemail);
      await _firestore.collection('Person').doc(_auth.currentUser!.uid).update({
        'userName': guncelname,
        'email': guncelemail,
        'password': guncelpassword,
        'phoneNumber': guncelphoneNumber,
        'adress': gunceladress,
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}