import 'dart:developer';

import 'package:api_integration_sample/model/nationalise_api_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NationaliseApiScreenController with ChangeNotifier {
  // NaionaliseApiResModel? resModel;
  bool isLoading = false;
  num? count;
  String? name;
  List<Country> countryList = [];

  fetchNationalizeData() async {
    final url = Uri.parse("https://api.nationalize.io/?name=nathaniel");

    try {
      isLoading = true;
      notifyListeners();

      final response = await http.get(url);
      if (response.statusCode == 200) {
        NaionaliseApiResModel resModel =
            naionaliseApiResModelFromJson(response.body);

        count = resModel.count ?? 0;
        name = resModel.name.toString();
        countryList = resModel.country ?? [];
      } else {
        log("Api Failed with statuscode ${response.statusCode}");
      }
    } catch (e) {}

    isLoading = false;
    notifyListeners();
  }
}
