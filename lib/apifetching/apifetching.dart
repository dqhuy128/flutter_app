import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/apimodels.dart';

class ModelApi {
  static Future<List<ProductModels>> getData() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => ProductModels.fromJson(e)).toList();

    // if (response.statusCode == 200) {
    //   for (Map<String, dynamic> index in data) {
    //     userData.add(ProductModels.fromJson(index));
    //   }
    //   return userData;
    // }
    // return userData; //empty list
  }
}
