import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Forest extends StatefulWidget {
  const Forest({Key? key}) : super(key: key);

  @override
  _ForestState createState() => _ForestState();
}

class _ForestState extends State<Forest> {

  late ScrollController _controller;

  double _scrollOffset = 0;


  //tree_1
  double _tree1VSpeed = 0.3;
  double _tree1HSpeed = 0.5;

  //tree_2
  double _tree2VSpeed = 0.5;
  double _tree2HSpeed = 0.5;

  //tree_3
  double _tree3VSpeed = 0.5;
  double _tree3HSpeed = 0.5;

  //tree_4
  double _tree4VSpeed = 0.5;
  double _tree4HSpeed = 0.5;

  //tree_5
  double _tree5VSpeed = 0.5;
  double _tree5HSpeed = 0.5;

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
      print("_scrollOffset : $_scrollOffset, ccc : ${_scrollOffset * _tree1VSpeed}");
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var layoutHeight = screenSize.height * 6;
    return Scaffold(

      body: Container(
        child: Stack(
          children: [


            // /// 거북이
            // _image("assets/forest/turtle.png"),
            //
            // ///코끼리
            // _image("assets/forest/elephant.png"),

            ///나무들
            _image("assets/forest/tree_1.png", top:screenSize.height * 0.75,left: 30,bottom: 50),
            // _image("assets/forest/tree_2.png"),
            // _image("assets/forest/tree_3.png"),
            // _image("assets/forest/tree_4.png"),
            // _image("assets/forest/tree_5.png"),


            Positioned.fill(
              child: SingleChildScrollView(
                controller: _controller,
                child: SizedBox(
                  height: layoutHeight,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


  Widget _image(
      String imagePath, {
        double top = 0,
        double left = 0,
        // double right = 0,
        double bottom = 0,
        BoxFit fit = BoxFit.fitHeight,
      }) {
    return Positioned(
      left: left,
      top: top,
      // right: right,
      bottom: bottom,
      child: Image.asset(imagePath,fit: fit,),
    );
  }
}
