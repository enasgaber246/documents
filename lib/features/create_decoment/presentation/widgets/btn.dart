import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class Btn extends StatelessWidget {
  String text;
  double width, height;
  VoidCallback? onPressed;
  Color color = AppColors.primary, textColor = AppColors.white;

  double verticalMargin = 0, horizontal=4;

  Btn(
      this.text, {
        this.width = double.infinity,
        this.height = 48.0,
        this.verticalMargin = 20,
        this.horizontal = 4,
        this.color=AppColors.primary ,
        this.textColor = Colors.white,
        this.onPressed,
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  InkWell(
      onTap: onPressed,
      child:Container(
      margin: EdgeInsets.symmetric(
          horizontal: horizontal, vertical: verticalMargin),
      height: height,
      width: width,
      decoration: new BoxDecoration(
          color: color,
          borderRadius: new BorderRadius.all(Radius.circular(12))),
      // color: color,
        child:Center(
              child: Text(text,
                style:  Theme.of(context).textTheme.labelLarge,
              )),

      ),
    );
  }
}
