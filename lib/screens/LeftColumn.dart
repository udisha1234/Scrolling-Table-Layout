import 'package:flutter/material.dart';

class LeftColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var x = 9 ;
    return Row(
        children: List.generate(
      10,
      (index1) => Container(
        width: 100,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Container(
              height: h*0.07,
              decoration: BoxDecoration(
                border: BorderDirectional(bottom: BorderSide() , top: BorderSide())
              ),
            ),
            SizedBox(height: 2,),
            Column(
                children: List.generate(
              10,
              (index2) => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.002, vertical: h * 0.001),
                child: Container(
                  height: h * 0.07,
                  width: 100,
                  child: Center(child: Text("${x-index1}$index2")),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
              ),
            )),
          ],
        ),
      ),
    ));
  }
}
