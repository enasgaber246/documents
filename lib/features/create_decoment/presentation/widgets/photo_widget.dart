
import 'package:flutter/material.dart';
import 'package:sanad_creation/core/utils/app_colors.dart';

import '../../../../core/utils/app_strings.dart';

class PhotoField extends StatelessWidget {
  TextInputType keyboardType = TextInputType.text;
  bool? enabled = true;
  double height ;
  FormFieldValidator<String>? validator;
  TextEditingController? ctrl;


  PhotoField( this.keyboardType,
      {this.enabled, this.validator, this.ctrl,this.height=48.0});

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
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          enabled: enabled,
          cursorColor: AppColors.black,
          keyboardType: keyboardType,
          validator: validator,
          controller: ctrl,
          style: TextStyle(color: AppColors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              fillColor:AppColors.light_gray,
              focusColor:AppColors.gray,
              hoverColor: AppColors.primary,
              suffixIcon:
              Icon(Icons.remove_red_eye_sharp,color: AppColors.primary,),
              prefixIcon:
              Icon(Icons.camera_alt_rounded,color: AppColors.primary,),
              errorStyle: TextStyle(
                fontFamily: AppStrings.fontFamily,
                fontSize: 12.0,
                height: 0.4,
                color: Colors.red,
              ),
              labelStyle: Theme.of(context).textTheme.labelMedium,
              hintStyle: Theme.of(context).textTheme.titleSmall,
            hintText: "...  لا يوجد صوره مرفقه "
          ),
        ));
  }
}
