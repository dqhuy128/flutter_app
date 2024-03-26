import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/apimodels.dart';

Future<List<ProductModels>> fetchProductModels() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final data = json.decode(response.body);
    List<ProductModels> result = [];
    for (var item in data) {
      result.add(ProductModels(
        id: item['id'],
        title: item['title'],
        description: item['description'] ?? 'null',
        category: item['category'] ?? 'null',
      ));
    }
    return result;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
