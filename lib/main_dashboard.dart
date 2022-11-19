import 'package:flutter/material.dart';
import 'package:mr_fixit/signup.dart';

import 'dashboard.dart';
import 'main.dart';

class MyMainDashboard extends StatefulWidget {
  @override
  State<MyMainDashboard> createState() => _MyMainDashboardState();
}

class _MyMainDashboardState extends State<MyMainDashboard> {
  int currentIndex = 0;
  final List<Widget> _children = [
    MyDashboard(),
    MyLogin(),
    MySignup(),
  ];
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 205, 205, 2),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: Colors.black,
            ),
            label: 'Email',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'Search',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              label: 'Account',
              backgroundColor: Colors.black),
        ],
      ),
    ));
  }
}
