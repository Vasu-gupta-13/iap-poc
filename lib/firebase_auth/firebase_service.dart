import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String?> signUp(String username, String email, String password) async {
    try {
      if (!isValidEmail(email) && !isValidPassword(password)) {
        throw ("Invalid email or password");
      }else if( !isValidPassword(password)){
        throw ("Password must contain atleast 6 characters");
      }else if(!isValidEmail(email)){
        throw ("Invalid email format");
      }
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = _auth.currentUser ;
      String uid = user?.uid ?? '';
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'username': username,
      });
      return uid;
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      rethrow;
    }
  }
  Future<String?> signIn(String email, String password) async {
    try {
      if (!isValidEmail(email) || !isValidPassword(password)) {
        throw ("Invalid email or password");
      }
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = _auth.currentUser;
      String uid = user?.uid ?? '';
      return uid;
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw ('Invalid Email or Password');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
  String checkLogin(BuildContext context)  {
    User? user = _auth.currentUser;
    if (user != null) {
      print('User is logged in');
      log('logged in : ${user.uid}');
      return user.uid;
    } else {
      print('User is not logged in');
      log('logged out');
      return '';
    }
  }
  bool isValidEmail(String email) {
    return email.contains('@');
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }
}
