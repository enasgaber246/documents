import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
class textField extends StatelessWidget {
  TextEditingController controller;
  bool enable;


  textField(this.controller,{this.enable=true});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: controller,
      enabled:enable ,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondary), //<-- SEE HERE
        ),
      ),
    );
  }
}
