import 'dart:convert';

import 'package:flutter/material.dart';

// List<FoodRecomModel> foodRecomFromJson() => List<FoodRecomModel>.from(
//     json.decode.map((x) => FoodRecomModel.fromJson(x)));

// String foodRecomToJson(List<FoodRecomModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodRecomModel {
  final String id;
  final String images;
  final String name;
  final double rekomendasi;
  Color color;
  FoodRecomModel({
    this.color = Colors.green,
    @required this.id,
    @required this.images,
    @required this.name,
    @required this.rekomendasi,
  });

  factory FoodRecomModel.fromJson(Map<String, dynamic> json) {
    return FoodRecomModel(
      id: json['id'].toString(),
      images: json['image_filename'],
      name: json['name'],
      rekomendasi: json['rekomendasi'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'image_filename': images,
        'name': name,
        'rekomendasi': rekomendasi,
      };
}

// class FoodRecomModel {
//   int id;
//   String imageFilename;
//   String name;
//   int rekomendasi;

//   FoodRecomModel({this.id, this.imageFilename, this.name, this.rekomendasi});

//   factory FoodRecomModel.fromJson(Map<String, dynamic> json) {
//     return FoodRecomModel(
//       id: json['id'],
//       imageFilename: json['image_filename'],
//       name: json['name'],
//       rekomendasi: json['rekomendasi'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['image_filename'] = this.imageFilename;
//     data['name'] = this.name;
//     data['rekomendasi'] = this.rekomendasi;
//     return data;
//   }
// }
