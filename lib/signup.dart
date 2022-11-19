import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'dart:math' as math;
import 'camera.dart';

class MySignup extends StatefulWidget {
  @override
  State<MySignup> createState() => _MySignupState();
}

class _MySignupState extends State<MySignup>
    with SingleTickerProviderStateMixin {
  String UID = '', PWD = '';
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return (MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 224, 139, 3),
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
                            'SignUp',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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
                    SizedBox(
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
                            hintText: 'Confirm Password',
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                          onChanged: (value) => setState(() {
                                PWD = value;
                              }),
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            prefixIcon: Icon(Icons.email),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                          onChanged: (value) => setState(() {
                                PWD = value;
                              }),
                          decoration: InputDecoration(
                            hintText: 'Address',
                            prefixIcon: Icon(Icons.markunread_mailbox),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text('SignUp'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 65, 50, 53),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                side: const BorderSide(color: Colors.white))),
                      ),
                    )
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
              child: new Icon(Icons.chat),
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
