import 'dart:convert';

import 'package:covid_application_flutter/models/world_state_model.dart';
import 'package:covid_application_flutter/services/utilities/api_urls.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class StateServices {
  Future<WorldStateModel> getWorldStateRecords() async {
    Response response = await http.get(Uri.parse(ApiUrls.worldStateApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception('Something is wrong');
    }
  }

  Future<List<dynamic>> getCountriesList() async {
    var data;
    Response response = await http.get(Uri.parse(ApiUrls.countriesUrl));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Data not found');
    }
  }
}
