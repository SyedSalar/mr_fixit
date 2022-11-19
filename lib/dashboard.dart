// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mr_fixit/image_slider.dart';
import 'package:mr_fixit/main.dart';
import 'package:mr_fixit/searchbar.dart';
import 'package:mr_fixit/signup.dart';

import 'package:mysql1/mysql1.dart';

class MyDashboard extends StatefulWidget {
  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  final List<Widget> _children = [
    MyDashboard(),
    MyLogin(),
    MySignup(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 205, 205, 2),
                    Color.fromARGB(255, 238, 230, 16)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter))),
          actions: [
            IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: Icon(Icons.search),
              color: Color.fromARGB(255, 15, 14, 14),
            ),
            SizedBox(
              width: 30,
            )
          ],
          backgroundColor: Color.fromARGB(255, 255, 255, 253),
        ),
        backgroundColor: Color.fromARGB(255, 250, 250, 248),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Ads', style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            MyImageSlider(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Top Services',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            MyImageSlider()
          ],
        ),
      ),
    ));
  }
}
