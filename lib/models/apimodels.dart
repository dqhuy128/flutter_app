import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

List<ProductModels> userModelsFromJson(String str) => List<ProductModels>.from(
    json.decode(str).map((x) => ProductModels.fromJson(x)));

String userModelsToJson(List<ProductModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModels {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  ProductModels({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  // `toJson` converts a UserModels object to a JSON representation.
  // `fromJson` creates a UserModels object from a JSON map.

  ProductModels.fromJson(Map<String, dynamic> json) {
    id:
    json["id"];
    title:
    json["title"];
    price:
    json["price"];
    description:
    json["description"];
    category:
    json["category"];
    image:
    json["image"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      };
}
