import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:mr_fixit/image_slider.dart';
import 'package:mr_fixit/signup.dart';
import 'dart:math' as math;
import 'package:mysql1/mysql1.dart';

import 'camera.dart';
import 'dashboard.dart';
import 'main_dashboard.dart';

void main() {
  runApp(MaterialApp(home: MyLogin()));
}

class MyLogin extends StatefulWidget {
  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 5.0,
      duration: const Duration(seconds: 15),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  String UID = 'Salar', PWD = '12345';

  // void MyRead() async {
  //   final conn = await MySqlConnection.connect(ConnectionSettings(
  //       host: 'localhost',
  //       port: 3306,
  //       user: 'root',
  //       db: 'db_demo',
  //       password: '12345678'));

  //String str = '%Ali%';
  //var results = await conn.query("select * from tbl_emp where  emp_name like '%$str%' ");
  //var results = await conn.query("select * from tbl_emp where  emp_name not like ? ",[str]);
  //print(results);
  //for (var myrow in results )
  //{
  //  print(myrow);
  //}

  //   var results = await conn.query(
  //       'select * from tbl_user where id = ? and password = ?', [UID, PWD]);
  //   if (!results.isEmpty) {
  //     MyGlobalVariable.UID = UID;
  //     MyGlobalVariable.PWD = PWD;

  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => MyDashboard()));

  //     /// isLogin = true;
  //     //print(results);
  //   }
  //e}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return (MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 222, 213, 32),
          resizeToAvoidBottomInset: false,
          body: FooterView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (BuildContext context, Widget? child) {
                            return ClipPath(
                              clipper: DrawClip(_controller.value),
                              child: Container(
                                height: size.height * 0.5,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Color.fromARGB(255, 11, 0, 3),
                                        Color.fromARGB(255, 60, 61, 57),
                                      ]),
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 100),
                          child: const Text(
                            'MR.Fixit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  'Gher baithey kaam kerwain.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Text('Sign in to continue'),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                          onChanged: (value) => setState(() {
                                UID = value;
                              }),
                          decoration: InputDecoration(
                            hintText: 'Username',
                            prefixIcon: Icon(Icons.account_box),
                            prefixIconColor: Colors.green,
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(100.0),
                              ),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                          onChanged: (value) => setState(() {
                                PWD = value;
                              }),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.password_outlined),
                            prefixIconColor: Colors.green,
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(100.0),
                              ),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Row(
                        children: [
                          Spacer(),
                          TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 65, 50, 53)),
                              onPressed: () => print('object'),
                              child: Text('Forgot Password?')),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // MyRead();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyMainDashboard()));
                          });
                        },
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 65, 50, 53),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                side: const BorderSide(color: Colors.white))),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MySignup(),
                                ));
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text('SignUp')
                            ],
                          ),
                        )),
                  ],
                ),
              ],
              footer: new Footer(
                backgroundColor: const Color.fromARGB(255, 65, 50, 53),
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Center(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Container(
                                height: 45.0,
                                width: 45.0,
                                child: Center(
                                  child: Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          25.0), // half of height and width of Image
                                    ),
                                    child: IconButton(
                                      icon: new Icon(
                                        Icons.email,
                                        size: 20.0,
                                      ),
                                      color: Color(0xFF162A49),
                                      onPressed: () {},
                                    ),
                                  ),
                                )),
                            new Container(
                                height: 45.0,
                                width: 45.0,
                                child: Center(
                                  child: Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          25.0), // half of height and width of Image
                                    ),
                                    child: IconButton(
                                      icon: new Icon(
                                        Icons.fingerprint,
                                        size: 20.0,
                                      ),
                                      color: Color(0xFF162A49),
                                      onPressed: () {},
                                    ),
                                  ),
                                )),
                            new Container(
                                height: 45.0,
                                width: 45.0,
                                child: Center(
                                  child: Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          25.0), // half of height and width of Image
                                    ),
                                    child: IconButton(
                                      icon: new Icon(
                                        Icons.call,
                                        size: 20.0,
                                      ),
                                      color: Color(0xFF162A49),
                                      onPressed: () {},
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Text(
                        'Copyright ©2020, All Rights Reserved.',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Color.fromARGB(255, 226, 232, 241)),
                      ),
                      Text(
                        'Powered by Salar Jafri',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Color.fromARGB(255, 226, 232, 241)),
                      ),
                    ]),
              )),
          floatingActionButton: new FloatingActionButton(
              elevation: 10.0,
              child: new Icon(Icons.camera_alt),
              backgroundColor: const Color.fromARGB(255, 65, 50, 53),
              onPressed: () async {
                await availableCameras().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CameraPage(cameras: value))));
              }),
        )));
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyGlobalVariable {
  static String UID = '';
  static String PWD = '';
}
