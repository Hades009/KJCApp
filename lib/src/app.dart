import 'package:flutter/material.dart';

final barCol = Color(0xFF120E43);
final hovCol = Color(0xfff9ca24);

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const Image(
          image: NetworkImage(
              'https://kristujayanti.edu.in/images/clg_history.jpg'),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: barCol,
              primaryColor: Colors.white,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: TextStyle(color: Colors.grey))),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Attendance',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                label: 'Time-Table',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: 'Circulars',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              )
            ],
            selectedItemColor: hovCol,
          ),
        ),
        backgroundColor: bgCol,
        appBar: AppBar(
          title: Text('KJC APP'),
          backgroundColor: barCol,
        ),
      ),
    );
  }
}
