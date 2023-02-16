import 'dart:async';
import 'dart:convert';

import 'package:covid_tracker_api/Services/Utilities/app_url.dart';
import 'package:covid_tracker_api/View/countries_list_screen.dart';
import 'package:http/http.dart' as http;
import 'package:covid_tracker_api/Model/WorldStatesModel.dart';


class StatesServices {

  Future<WorldStatesModel> fetchWorldStatesRecords() async{

    var data;
    final response = await http.get(Uri.parse(AppUrl.worldStatesUrl));

    if (response.statusCode == 200){
      data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    }
    else {
      throw Exception('Error occurred in States Services file.');
    }
  }


  Future<List<dynamic>>countriesListApi() async{
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    var data;

  if (response.statusCode == 200){
    const Duration(seconds: 3);
     data = jsonDecode(response.body.toString());
    return data!;
  }
  else {
    throw Exception('Error occurred in States Services file.');
  }
}

}