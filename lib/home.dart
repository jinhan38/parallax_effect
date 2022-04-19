import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _controller;

  final BoxDecoration _decoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 66, 240, 210),
        Color.fromARGB(255, 253, 244, 193),
      ],
    ),
  );

  double _scrollOffset = 0;

  //vertical
  double _layout1Speed = 0.5;
  double _layout2Speed = 0.45;
  double _layout3Speed = 0.42;
  double _layout4Speed = 0.375;
  double _sunSpeed = 0.18;

  //horizontal
  double _layout1HSpeed = 0.1;
  double _layout2HSpeed = 0.08;
  double _layout3HSpeed = 0.075;
  double _layout4HSpeed = 0.07;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        _onScroll();
      });
    super.initState();
  }

  _onScroll() {
    setState(() {
      _scrollOffset = _controller.offset;
    });
  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var layoutHeight = screenSize.height * 3;

    return Scaffold(
      body: Container(
        decoration: _decoration,
        child: Stack(
          children: [
            _image(
              "assets/sun.svg",
              bottom: screenSize.height * 0.5 + (_scrollOffset * _sunSpeed),
              right: screenSize.width *0.3,
              left: 0,
            ),
            _image(
              "assets/mountains-layer-4.svg",
              bottom: _layout4Speed * _scrollOffset,
              left: _layout4HSpeed * _scrollOffset * -1,
              right: _layout4HSpeed * _scrollOffset * -1,
            ),
            _image(
              "assets/mountains-layer-2.svg",
              bottom: _layout3Speed * _scrollOffset,
              left: _layout3HSpeed * _scrollOffset * -1,
              right: _layout3HSpeed * _scrollOffset * -1,
            ),
            _image(
              "assets/trees-layer-2.svg",
              bottom: _layout2Speed * _scrollOffset,
              left: _layout2HSpeed * _scrollOffset * -1,
              right: _layout2HSpeed * _scrollOffset * -1,
            ),
            Positioned(
              left: _layout1HSpeed * _scrollOffset * -1,
              right: _layout1HSpeed * _scrollOffset * -1,
              bottom: -55 + _layout1Speed * _scrollOffset,
              child: SvgPicture.asset("assets/layer-1.svg", fit: BoxFit.fitWidth,),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: screenSize.height + (_layout1Speed * _scrollOffset * -1),
              height: screenSize.height,
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                controller: _controller,
                child: SizedBox(
                  height: layoutHeight,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _image(
    String imagePath, {
    double left = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Positioned(
      left: left,
      right: right,
      bottom: bottom,
      child: SvgPicture.asset(imagePath),
    );
  }
}
