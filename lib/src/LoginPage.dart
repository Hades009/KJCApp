import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:kjcapp/src/AccPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Login To The KJC App",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontSize: 42,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 44.0,
          ),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Enter Email",
              prefixIcon: Icon(Icons.mail_rounded, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Password",
              prefixIcon: Icon(Icons.password_rounded, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text("Forgot Password?",
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline)),
          const SizedBox(
            height: 88.0,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: barCol,
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {},
              child: const Text(
                "Login",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Raleway', fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
