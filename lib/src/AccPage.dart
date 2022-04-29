// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kjcapp/src/utils/fire_auth.dart';
import 'package:kjcapp/src/LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const TextStyle contentStyle =
    TextStyle(fontSize: 26, fontFamily: 'Roboto', fontWeight: FontWeight.bold);
const barCol = Color(0xff120e43);
//import 'package:kjcapp/src/utils/validator.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  //User? user = FirebaseAuth.instance.currentUser;
  var user = FirebaseAuth.instance.currentUser;
  ProfilePage({Key? key}) : super(key: key);

  // ignore: use_key_in_widget_constructors
  //const ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final double coverh = 160;
  final double profileH = 144;
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '${_currentUser.displayName}',
            style: contentStyle,
          ),
          const SizedBox(height: 16.0),
          Text(
            '${_currentUser.email}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 16.0),
          _currentUser.emailVerified
              ? Text(
                  'Email verified',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.green),
                )
              : Text(
                  'Email not verified',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.red),
                ),
          const SizedBox(height: 16.0),
          _isSendingVerification
              ? const CircularProgressIndicator()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isSendingVerification = true;
                        });
                        await _currentUser.sendEmailVerification();
                        setState(() {
                          _isSendingVerification = false;
                        });
                      },
                      child: const Text('Verify email'),
                    ),
                    const SizedBox(width: 2.0),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () async {
                        User? user = await FireAuth.refreshUser(_currentUser);
                        if (user != null) {
                          setState(() {
                            _currentUser = user;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    _isSigningOut
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _isSigningOut = true;
                              });
                              await FirebaseAuth.instance.signOut();
                              setState(() {
                                _isSigningOut = false;
                              });
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text('Log out'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                  ],
                )
        ],
      ),
    );
  }

  Widget buildTop() {
    final top = 170 - profileH / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 100),
          child: buildCoverImage(),
        ),
        Positioned(top: top, child: buildProfImage()),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: barCol,
        // child: Image.network('https://i.ibb.co/gFbp2JG/slide1.jpg'),
        width: double.infinity,
        height: 170,
      );
  Widget buildProfImage() => CircleAvatar(
        radius: profileH / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const NetworkImage(
            'https://i.ibb.co/K0qK7pR/156-12-male-student-i-icon-iconbunny-removebg-preview.png'),
      );
}
