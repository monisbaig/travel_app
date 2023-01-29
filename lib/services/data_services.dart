import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/model/data_model.dart';

class DataServices {
  static const baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    final url = Uri.parse('$baseUrl/getplaces');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      return <DataModel>[];
    }
  }
}
