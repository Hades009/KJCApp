import 'dart:ffi';
// import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:kjcapp/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

const barCol = Color(0xFF120E43);
const TextStyle headStyle =
    TextStyle(fontSize: 26, fontFamily: 'Raleway', fontWeight: FontWeight.bold);

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> getdownloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('images/$imageName').getDownloadURL();

    return downloadURL;
  }
}

final Storage storage = Storage();

class MyTT extends StatelessWidget {
  const MyTT({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontFamily: 'Raleway');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        const Text('TIME-TABLE', textAlign: TextAlign.center, style: headStyle),
        FutureBuilder(
          future: storage.getdownloadURL('time_table_BCA_A.jpeg'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasError) {
              return Text('Something is wrong! ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return SizedBox(
                width: 400,
                height: 600,
                child: Image.network(snapshot.data!, fit: BoxFit.contain),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Container();
          },
        ),
      ],
    );
  }
}
