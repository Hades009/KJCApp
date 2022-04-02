import 'package:flutter/material.dart';
import 'package:kjcapp/src/HomePage.dart';
import 'package:kjcapp/src/LoginPage.dart';
import 'package:kjcapp/src/app.dart';
import 'src/app.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const LoginPage());
  // var user = FirebaseAuth.instance.currentUser;

  // if (user != null) {
  // runApp(const LoginPage());
  // } else {
  //   runApp(const LoginPage());
  // }
}
