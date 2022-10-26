import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:form_app/app/data/model/steps.dart';

class JSONDataProvider {
  Future<Steps> getJSONData() async {
    final String response = await rootBundle.loadString('assets/steps.json');
    final rawJSON = await json.decode(response);
    return Steps.fromJSON(rawJSON);
  }
}
