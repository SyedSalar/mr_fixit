import 'package:flutter/material.dart';

class MyImageSlider extends StatefulWidget {
  const MyImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  late PageController _pageController;

  List<String> images = [
    "images/workerimage2.webp",
    "images/7.png",
    "images/workerimage6-.png"
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
            itemCount: images.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              bool active = pagePosition == activePage;
              return slider(images, pagePosition, active);
            },
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage))
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(images[pagePosition]),
            fit: BoxFit.fill,
            scale: 1)),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: EdgeInsets.all(10),
      child: Image.asset(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
