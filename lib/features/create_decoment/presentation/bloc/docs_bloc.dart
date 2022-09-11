import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/Rec_list_model.dart';

class DocsBloc extends Bloc<DocsEvent, DocsState> {
  DocsBloc() : super(LoadingDocsState());

  @override
  Stream<DocsState> mapEventToState(DocsEvent event) async* {
    if (event is LoadDocsEvent) {
      yield LoadingDocsState();
      Map<String, String> requestHeaders = {
        'user_id': '5fa9a1f9-629a-4c40-9826-fc27d7c1b131',
        'fyear': '2021',
      };
      final queryParameters = {
        'user_id': '5fa9a1f9-629a-4c40-9826-fc27d7c1b131',
        'searchval': '',
      };

      // final jsonString = json.encode(body);
      String baseUrl = 'http://78.47.37.158:1201/VanSalesService/rec/GetrecData';

      final uri = Uri.parse('$baseUrl').replace(queryParameters: queryParameters);

      var res = await http.get(
          uri,headers:requestHeaders
      );

      try {
        final data = jsonDecode(res.body) as Map<String, dynamic>;

        print('LoadDocsEvent Response :  ${data.toString()}');
        RecListModel response = RecListModel.fromJson(data);

        if (res.statusCode == 200) {
          yield LoadedDocsState(response: response);
        } else {
          yield FailedDocsState();
        }
      } catch (e) {
        print('LoadDocsEvent Error :  ' + e.toString());
        yield FailedDocsState();
      }
    }
  }
}

// Event
abstract class DocsEvent {}

class LoadDocsEvent extends DocsEvent {
  LoadDocsEvent();
}

// Docs States
abstract class DocsState {}

class LoadingDocsState extends DocsState {}

class LoadedDocsState extends DocsState {
  RecListModel? response;

  LoadedDocsState({this.response});
}

class FailedDocsState extends DocsState {}
