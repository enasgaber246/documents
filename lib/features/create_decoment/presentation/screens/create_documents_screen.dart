import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/DropDownModel.dart';
import '../../data/models/New_res_model.dart';
import '../widgets/DropDown.dart';
import '../widgets/input_field.dart';
import '../widgets/photo_widget.dart';
import '../widgets/subtitle.dart';

class CreateDocumentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CreateDocumentScreenState();
  }
}

class _CreateDocumentScreenState extends State<CreateDocumentScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController ctrl_rec_value = TextEditingController();
  TextEditingController ctrl_recnotes = TextEditingController();
  TextEditingController ctrl_recuser = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(children: [
                IconButton(
                  onPressed: () {
                    sendResAPIClick(context);
                  },
                  icon: Icon(
                    Icons.save,
                    color: AppColors.white,

                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    subTitle(
                      'إنشاء سند القبض',
                      Theme.of(context).textTheme.titleLarge,
                    ),
                    Align(
                      child: IconButton(
                        onPressed: () {
                          Navigator.canPop(context);
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: AppColors.white,
                        ),
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ],
                ),
              ])),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: new BoxDecoration(
                  //   border: Border.all(color: AppColors.secondary),
                  color: AppColors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: subTitle(
                      'رقم السند',
                      Theme.of(context).textTheme.titleSmall,
                      align: TextAlign.right,
                    ),
                  ),
                  InputField(
                    TextInputType.text,
                    enabled: false,
                    ctrl: TextEditingController(text: 'تلقائى'),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: subTitle(
                        'تاريخ السند',
                        Theme.of(context).textTheme.titleSmall,
                        align: TextAlign.right,
                      )),
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                            height: 48.0,
                            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            padding: EdgeInsets.only(
                                left: 4.0, right: 4.0, top: 0.0, bottom: 2.0),
                            decoration: BoxDecoration(
                                color: AppColors.light_gray,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12))),
                            alignment: Alignment.center,
                            child: subTitle('9/8/2020',
                                Theme.of(context).textTheme.titleSmall),
                          )),
                      VerticalDivider(width: 1.0),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 48.0,
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          padding: EdgeInsets.only(
                              left: 4.0, right: 4.0, top: 0.0, bottom: 2.0),
                          decoration: BoxDecoration(
                              color: AppColors.light_gray,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          alignment: Alignment.center,
                          child: subTitle('9/8/2020',
                              Theme.of(context).textTheme.titleSmall),
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: subTitle(
                        "نوع القبض",
                        Theme.of(context).textTheme.titleSmall,
                        align: TextAlign.right,
                      )),
                  DropDown([
                    DropDownModel('قبض عميل', 0),
                    DropDownModel('قبض اخرى', 1),
                    DropDownModel('اشعار خصم', 2),
                  ])
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: new BoxDecoration(
                  //   border: Border.all(color: AppColors.secondary),
                  color: AppColors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: subTitle(
                      'حساب المسدد',
                      Theme.of(context).textTheme.titleSmall,
                      align: TextAlign.right,
                    ),
                  ),
                  InputField(
                    TextInputType.text,
                    icon: Icons.search,
                    ctrl: ctrl_recuser,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: subTitle(
                        'قيمه السند',
                        Theme.of(context).textTheme.titleSmall,
                        align: TextAlign.right,
                      )),
                  InputField(
                    TextInputType.text,
                    icon: Icons.attach_money,
                    ctrl: ctrl_rec_value,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: subTitle(
                        'طرق الدفع',
                        Theme.of(context).textTheme.titleSmall,
                        align: TextAlign.right,
                      )),
                  DropDown([
                    DropDownModel('نقدي', 0),
                    DropDownModel('شبكه', 1),
                    DropDownModel('فيزا', 2),
                    DropDownModel('تحويل بنكي', 3),
                    DropDownModel('شيك', 4),
                    DropDownModel('دفعات مقدمه', 5),
                  ])
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: new BoxDecoration(
                  //   border: Border.all(color: AppColors.secondary),
                  color: AppColors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(10))),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                PhotoField(TextInputType.text),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: subTitle(
                    'ملاحظات',
                    Theme.of(context).textTheme.titleSmall,
                    align: TextAlign.right,
                  ),
                ),
                InputField(
                  TextInputType.text,
                  height: 120.0,
                  ctrl: ctrl_recnotes,
                )
              ]))
        ],
      ),
    )));
  }

  Future<NewResModel?> sendResAPIClick(BuildContext mContext,) async {
    showDialogProgress(mContext);

    Map<String, String> requestHeaders = {
      'user_id': '5fa9a1f9-629a-4c40-9826-fc27d7c1b131',
      'fyear': '2021',
      'Content-Type': 'application/json'
    };

    // final jsonString = json.encode(body);
    String baseUrl = 'http://78.47.37.158:1201/VanSalesService/rec/';
    String endPoint = 'addnewrecdoc';

    final uri = Uri.parse('$baseUrl$endPoint');

    var res = await http.post(
      uri,
      headers: requestHeaders,
      body: jsonEncode(<String, String>{
        'recdocno': '1',
        'recdate': '01/01/2022',
        'recvalue': '500',
        'recuser': 'admin',
        'paytypeid': '1',
        'paytypename': 'نقدي',
        'paychartid': '1',
        'recbranchid': '1',
        'branchname': 'الفرع الرئيسي',
        'recman': 'ahmed atef',
        'recnotes': 'test',
        'payref': 'test',
        'fromchartid': "1",
        'paynotes': 'a',
        'rectype': '1',
        'rectypename': 'مصاريف',
      }),
    );

    Navigator.pop(mContext);
    try {
      final data = jsonDecode(res.body) as Map<String, dynamic>;

      print('LoadDocsEvent Response :  ${data.toString()}');
      NewResModel response = NewResModel.fromJson(data);

      // showMsg(mContext, response?.emsg ?? '');
      if (res.statusCode == 200) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      print('LoadDocsEvent Error :  ' + e.toString());
      //showMsg(mContext, 'حدث خطأ داخلي، يرجي المحاولة مرة أخري لاحقا.');
      return null;
    }
  }

  Container showDialogProgress(BuildContext mContext) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 48.0),
        child: CircularProgressIndicator(
          color: AppColors.white,
        ));
  }
}
