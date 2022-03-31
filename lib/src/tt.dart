// import 'dart:ffi';s
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:kjcapp/main.dart';
/*
const barCol = Color(0xFF120E43);
const TextStyle headStyle = TextStyle(
    fontSize: 26,
    decoration: TextDecoration.underline,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold);

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}

Future<Widget> _getImage(BuildContext context, String img) async {
  late Image ttImg;
  await FireStorageService.loadImage(context, img).then((value) {
    ttImg = Image.network(value.toString(), fit: BoxFit.fill);
  });
  return ttImg;
}

class MyTT extends StatelessWidget {
  const MyTT({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontFamily: 'Raleway');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Center(
          child: Text(
            'TIME-TABLE',
            style: headStyle,
          ),
        ),
        FutureBuilder<Widget>(
          future: _getImage(context, "ghost.png"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 2,
                  child: snapshot.data,
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // child: Container(
                //   padding: const EdgeInsets.only(top: 50),
                //   width: MediaQuery.of(context).size.width / 8,
                //   height: MediaQuery.of(context).size.height,
                child: const CircularProgressIndicator(),
              );
              // );
            }
            return Center(
              child: Container(),
            );
          },
        ),
      ],
    );
  }
}
*/