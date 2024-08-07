import 'package:assignment/screens/LeftColumn.dart';
import 'package:assignment/screens/MiddleColumn.dart';
import 'package:assignment/screens/RightColumn.dart';
import 'package:flutter/material.dart';

class ThreeColumns extends StatefulWidget {
  @override
  _ThreeColumnsState createState() => _ThreeColumnsState();
}

class _ThreeColumnsState extends State<ThreeColumns> {
  ScrollController _scrollControllerA = ScrollController();
  ScrollController _scrollControllerC = ScrollController();
  bool _isScrollingA = false;
  bool _isScrollingC = false;

  @override
  void initState() {
    super.initState();

    _scrollControllerA.addListener(() {
      if (_isScrollingC) return;
      _isScrollingA = true;
      _scrollControllerC.jumpTo(
        _scrollControllerC.position.maxScrollExtent - _scrollControllerA.offset,
      );
      _isScrollingA = false;
    });

    _scrollControllerC.addListener(() {
      if (_isScrollingA) return;
      _isScrollingC = true;
      _scrollControllerA.jumpTo(
        _scrollControllerA.position.maxScrollExtent - _scrollControllerC.offset,
      );
      _isScrollingC = false;
    });
  }

  @override
  void dispose() {
    _scrollControllerA.dispose();
    _scrollControllerC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text('Scrolling Table layout')),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Scrolling Table Layout",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: h * 0.06,
              width: w,
              decoration: const BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(), top: BorderSide())),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Calls",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.orange),
                  ),
                  Text(
                    "Puts",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                // Column A: Leftmost scrollable column
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollControllerA,
                    scrollDirection: Axis.horizontal,
                    child: LeftColumn(),
                  ),
                ),
                // Column B: Center fixed column
                MiddleColumn(),
                // Column C: Rightmost scrollable column
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollControllerC,
                    scrollDirection: Axis.horizontal,
                    child: RightColumn(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// pppPP