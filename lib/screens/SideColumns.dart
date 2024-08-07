import 'package:flutter/material.dart';

class SideColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
        children: List.generate(
            10,
            (index) => (index == 0)
                ? Container(
                    height: h * 0.06,
                    width: w,
                    child: Text("Helo"),
                    decoration: BoxDecoration(border: Border.all()),
                  )
                : Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.001),
                        child: Container(
                          height: h * 0.06,
                          width: w,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                      )
                    ],
                  )));
  }
}
