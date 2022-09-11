import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/New_res_model.dart';
import '../../data/models/Rec_list_model.dart';

class AddDocsBloc extends Bloc<AddDocsEvent, AddDocsState> {
  AddDocsBloc() : super(LoadingAddDocsState());

  @override
  Stream<AddDocsState> mapEventToState(AddDocsEvent event) async* {
    if (event is LoadAddDocsEvent) {
      yield LoadingAddDocsState();
      Map<String, String> requestHeaders = {
        'user_id': '5fa9a1f9-629a-4c40-9826-fc27d7c1b131',
        'fyear': '2021',
      };

      // final jsonString = json.encode(body);
      String baseUrl = 'http://78.47.37.158:1201/VanSalesService/rec/';
      String endPoint = 'addnewrecdoc';

      final uri = Uri.parse('$baseUrl+$endPoint');

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

      try {
        final data = jsonDecode(res.body) as Map<String, dynamic>;

        print('LoadDocsEvent Response :  ${data.toString()}');
        NewResModel response = NewResModel.fromJson(data);

        if (res.statusCode == 200) {
          yield LoadedAddDocsState(response: response);
        } else {
          yield FailedAddDocsState();
        }
      } catch (e) {
        print('LoadAddDocsEvent Error :  ' + e.toString());
        yield FailedAddDocsState();
      }
    }
  }
}

// Event
abstract class AddDocsEvent {}

class LoadAddDocsEvent extends AddDocsEvent {
  LoadAddDocsEvent();
}

// Docs States
abstract class AddDocsState {}

class LoadingAddDocsState extends AddDocsState {}

class LoadedAddDocsState extends AddDocsState {
  NewResModel? response;

  LoadedAddDocsState({this.response});
}

class FailedAddDocsState extends AddDocsState {}
