import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad_creation/core/utils/media_query_values.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/Rec_list_model.dart';
import '../bloc/docs_bloc.dart';
import '../widgets/subtitle.dart';

class DocumentsScreen extends StatefulWidget {
  final DocsBloc bloc = new DocsBloc();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DocumentsScreenState();
  }
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  int SelectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              subTitle('سندات الصرف', Theme.of(context).textTheme.titleLarge),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        Center(
            child: Form(
          child: Container(
            //width: 300,
            height: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                // border: Border.all(width: 1, color: Colors.purple),
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12)),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.right,
              cursorColor: AppColors.primary,
              style: TextStyle(color: AppColors.black),
              decoration: InputDecoration(
                  label: subTitle(
                    "البحث باستخدام الرقم التعريفي",
                    Theme.of(context).textTheme.labelSmall,
                    align: TextAlign.end,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.gray,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  labelStyle: Theme.of(context).textTheme.labelSmall,
                  alignLabelWithHint: false),
            ),
          ),
        )),
            BlocProvider<DocsBloc>(
              create: (context) =>
              widget.bloc..add(LoadDocsEvent()),
              child: BlocBuilder<DocsBloc, DocsState>(
                  builder: (context, state) {
                    if (state is LoadingDocsState) {
                      return Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 48.0),
                          child: CircularProgressIndicator(color: AppColors.white,)),

                      );
                    } else if (state is LoadedDocsState) {
                     return  Expanded(
                         child: Container(
                             margin: EdgeInsets.symmetric(
                               horizontal: 20,
                             ),
                             decoration: new BoxDecoration(
                               //   border: Border.all(color: AppColors.secondary),
                                 color: AppColors.white,
                                 borderRadius: new BorderRadius.all(Radius.circular(10))),
                             child: new ListView.builder(
                               shrinkWrap: true,
                               physics: const ClampingScrollPhysics(),
                               itemCount: state.response?.data?.length,
                               itemBuilder: (BuildContext context, int index) {
                                 return _buildListCategoriesItems(index, context,state.response!);
                               },
                             )));
                    } else if (state is FailedDocsState) {
                      return subTitle(
                          '', Theme.of(context).textTheme.subtitle1);
                    } else {
                      return subTitle(
                          '', Theme.of(context).textTheme.subtitle1);
                    }
                  }),
            ),

      ])),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(
            Icons.add,
            color: AppColors.white,
          ),
          backgroundColor: AppColors.secondary,
          onPressed: () {
            Navigator.pushNamed(context, Routes.createDocumentRoute);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildListCategoriesItems(int index, BuildContext context,RecListModel model) {
    return InkWell(
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          decoration: new BoxDecoration(
              //color:AppColors.white,
              borderRadius: new BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: context.width * 2 / 3,
                    decoration: new BoxDecoration(
                        color: AppColors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            subTitle(
                              model.data![index].recid.toString(),
                              Theme.of(context).textTheme.labelLarge,
                              align: TextAlign.right,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Icon(
                              Icons.local_offer_outlined,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            subTitle(
                              model.data![index].branchname.toString(),
                              Theme.of(context).textTheme.labelLarge,
                              align: TextAlign.right,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Icon(
                              Icons.person,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.attach_file,
                              color: AppColors.gray,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                subTitle(
                                  'الاجمالى',
                                  Theme.of(context).textTheme.titleSmall,
                                  align: TextAlign.right,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    subTitle(
                                      'شامل الضربيه',
                                      Theme.of(context).textTheme.titleSmall,
                                      align: TextAlign.right,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    subTitle(
                                      '0.0',
                                      Theme.of(context).textTheme.titleSmall,
                                      align: TextAlign.right,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      decoration: new BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: new BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      width: context.width * 1 / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          subTitle(
                            'مصاريف',
                            Theme.of(context).textTheme.titleLarge,
                            align: TextAlign.center,
                          ),
                          subTitle('منذ 3 ايام',
                              Theme.of(context).textTheme.labelSmall),
                        ],
                      )),
                ),
              ],
            ),
          )),
      onTap: () {
        setState(() {
          SelectedIndex = index;
        });
      },
    );
  }
}
