import 'package:flutter/material.dart';

class subTitle extends StatelessWidget {
  String text;
  var style;
  TextAlign align;
  subTitle(this.text,this.style,{this.align=TextAlign.right});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: style,
      textAlign: align,
    );
  }
}
