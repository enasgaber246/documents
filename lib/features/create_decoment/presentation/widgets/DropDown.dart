
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/DropDownModel.dart';


class DropDown extends StatefulWidget {
  List<DropDownModel> dropdownItem = [];
  late DropDownModel dropdownvalue =dropdownItem[0];

  DropDown( this.dropdownItem);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return DropDownState();
  }
}

class DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
        // margin: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 15.0.sp),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        // height: 124.67.sp,
        // width: 1021.07.sp,
        // decoration: BoxDecoration(
        //     border: Border.all(
        //       color: Theme.of(context).primaryColor,
        //     ),
    //        borderRadius: BorderRadius.all(Radius.circular(80.sp))),
        child: Directionality(textDirection: TextDirection.rtl,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            // Initial Value
            // Down Arrow Icon

            isExpanded: true,
            icon:Icon(Icons.arrow_drop_down,color: AppColors.gray,),

            value: widget.dropdownvalue,
            // Array list of items
            items: widget.dropdownItem.map((DropDownModel item) {
              return DropdownMenuItem(
                value: item,
                child: Container(
                 // width: 800.07.sp,
                  child:new Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    item.title ,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500)
                )),
                ));
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (DropDownModel? newValue) {
              setState(() {
                widget.dropdownvalue = newValue!;
              });
            },
          ),
        ),));
  }
}
