import 'dart:ffi';
// import 'dart:js_util';
import 'package:firebase_auth/firebase_auth.dart';
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
    print(downloadURL);
    return downloadURL;
  }
}

CollectionReference timetableCollection =
    FirebaseFirestore.instance.collection('timetable');

final Storage storage = Storage();
String? userCourse;
String? userSection;
String? userClass;

var userId = FirebaseAuth.instance.currentUser!.email;
fetchUser() async {
  var collection = FirebaseFirestore.instance.collection('students');
  var docSnapshot = await collection.doc(userId).get();
  if (docSnapshot.exists) {
    Map<String, dynamic> data = docSnapshot.data()!;
    // ignore: avoid_print
    // print(data['course']);
    // // You can then retrieve the value from the Map like this:
    userCourse = data['course'];
    userSection = data['section'];
    userClass = '$userCourse' '-' '$userSection';
    print(userClass);
  }
}

class MyTT extends StatefulWidget {
  const MyTT({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontFamily: 'Raleway');

  @override
  State<MyTT> createState() => _MyTTState();
}

class _MyTTState extends State<MyTT> {
  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(userCourse);
    print(userSection);
    return StreamBuilder<DocumentSnapshot>(
      stream: timetableCollection.doc(userClass).snapshots(),
      builder: (context, streamSnapshot) {
        if (streamSnapshot.hasError) {
          return Text('Something is wrong! ${streamSnapshot.error}');
        } else if (streamSnapshot.connectionState == ConnectionState.done &&
            streamSnapshot.hasData) {
          print(streamSnapshot.data);
          return SizedBox(
            width: 400,
            height: 600,
            child: Image.network(streamSnapshot.data!['image_url'],
                fit: BoxFit.contain),
          );
        } else if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return Container();
      },
    );
  }
}
