// ignore: non_constant_identifier_names
import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String LOGIN_KEY = "5FD6G46SDF4GD64F1VG9SD68";
// ignore: non_constant_identifier_names
String USER_KEY = "GD2G82CG9G82VDFGVD22DVG";

class AppService with ChangeNotifier {
  late final SharedPreferences sharedPreferences;
  final StreamController<bool> _loginStateChange =
      StreamController<bool>.broadcast();

  bool _loginState = false;
  User? userState;
  Map<String, dynamic>? student;

  AppService(this.sharedPreferences);

  bool get loginState => _loginState;

  Stream<bool> get loginStateChange => _loginStateChange.stream;

  CollectionReference studentsCollection =
      FirebaseFirestore.instance.collection('students');

  set loginState(bool state) {
    sharedPreferences.setBool(LOGIN_KEY, state);
    _loginState = state;
    _loginStateChange.add(state);
    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    sharedPreferences.setString(USER_KEY, user.toString());
    var students =
        await studentsCollection.where("userId", isEqualTo: user.uid).get();
    student = students.docs[0].data() as Map<String, dynamic>;
    loginState = true;
    userState = user;
  }

  Future<void> onAppStart() async {
    _loginState = sharedPreferences.getBool(LOGIN_KEY) ?? false;
    if (sharedPreferences.getString(USER_KEY) != null) {
      userState = jsonDecode(sharedPreferences.getString(USER_KEY) ?? '');
    }

    notifyListeners();
  }
}
