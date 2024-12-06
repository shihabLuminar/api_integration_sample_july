import 'dart:convert';
import 'dart:developer';

import 'package:api_integration_sample/model/fact_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FactsScreenController with ChangeNotifier {
  FactModel? factModel;

  getRandomFacts() async {
    final url = Uri.parse("https://catfact.ninja/fact");
    try {
      final response = await http.get(url); //api method

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //convert to model classs
        factModel = factModelFromJson(response.body);
      } else {
        log("Api Failed with statuscode :  ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
