
import 'package:flutter/material.dart';
import 'package:sanad_creation/core/utils/app_colors.dart';

import '../../../../core/utils/app_strings.dart';

class InputField extends StatelessWidget {
  IconData? icon;
  TextInputType keyboardType = TextInputType.text;
  bool? enabled = true;
  double height ;
  FormFieldValidator<String>? validator;
  TextEditingController? ctrl;


  InputField( this.keyboardType,
      {this.enabled, this.validator, this.ctrl,this.height=48.0,this.icon,});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: height,
        // width: double.infinity,
        margin: EdgeInsets.only(
            top: 10.0, bottom: 10.0),
        padding: EdgeInsets.only(
            left: 4.0, right: 4.0, top: 0.0, bottom: 2.0),
        decoration: BoxDecoration(
            color: AppColors.light_gray,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        alignment: Alignment.center,
        child: new Directionality(
    textDirection: TextDirection.rtl,
    child:TextFormField(
          textAlignVertical: TextAlignVertical.center,
          enabled: enabled,
          cursorColor: AppColors.black,
          keyboardType: keyboardType,
          validator: validator,
          controller: ctrl,
          style: TextStyle(color: AppColors.black,),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor:AppColors.light_gray,
            focusColor:AppColors.gray,
            hoverColor: AppColors.primary,
            suffixIcon:
            Icon(icon,color: AppColors.gray,),
            errorStyle: TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontSize: 12.0,
              height: 0.4,
              color: Colors.red,
            ),
            labelStyle: Theme.of(context).textTheme.labelMedium,
            hintStyle: Theme.of(context).textTheme.labelSmall,
          ),
        )));
  }
}
