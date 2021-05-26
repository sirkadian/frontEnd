import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:sirkadian_project/models/food_models/foodRecomendation_model.dart';
import 'package:sirkadian_project/models/food_models/food_model.dart';
import 'package:sirkadian_project/models/food_models/food_necessity.dart';
import 'package:sirkadian_project/models/url_model.dart';
import 'package:http/http.dart' as http;

class FoodRepository {
  Dio _dio = Dio();

  Future<Either<String, List<AllFoodResponse>>> getAllFoods() async {
    try {
      final responseAll = await http.get(apiMakanUrl);

      final _data = jsonDecode(responseAll.body);
      // print(data);
      List<AllFoodResponse> _allFoodsResponse =
          (_data as List).map((e) => AllFoodResponse.fromJson(e)).toList();

      return right(_allFoodsResponse);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, List<FoodRecomModel>>> getFoodRecomLauk() async {
    try {
      final _response = await http.get(foodRecomUrl);

      final _dataLauk = jsonDecode(_response.body)[0]['lauk'];

      List<FoodRecomModel> _foodRecomModelLauk =
          (_dataLauk as List).map((e) => FoodRecomModel.fromJson(e)).toList();

      return right(_foodRecomModelLauk);
    } catch (error) {
      //error yang dihasilkan oleh dio

      return left(error.toString());
    }
    //catch (error) {} ini bisa ditambahin untuk ngehandle error2 lain selain dio
  }

  Future<Either<String, List<FoodRecomModel>>> getFoodRecomSayur() async {
    try {
      final _response = await http.get(foodRecomUrl);
      final _dataSayur = jsonDecode(_response.body)[1]['sayur'];

      List<FoodRecomModel> _foodRecomModelSayur =
          (_dataSayur as List).map((e) => FoodRecomModel.fromJson(e)).toList();

      return right(_foodRecomModelSayur);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, FoodNecessityModel>> getFoodNecessity() async {
    Response _response;

    try {
      _response = await _dio.get(foodNecessityUrl);

      FoodNecessityModel _foodNecessityModel =
          FoodNecessityModel.fromJson(_response.data);

      return right(_foodNecessityModel);
    } on DioError catch (error) {
      //error yang dihasilkan oleh dio
      String errorMessage = error.response.data.toString();
      switch (error.type) {
        case DioErrorType.CONNECT_TIMEOUT:
          break;
        case DioErrorType.SEND_TIMEOUT:
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          break;
        case DioErrorType.RESPONSE:
          // errorMessage = error.response.data['error'];
          break;
        case DioErrorType.CANCEL:
          break;
        case DioErrorType.DEFAULT:
          break;
      }
      return left(errorMessage);
    }
    //catch (error) {} ini bisa ditambahin untuk ngehandle error2 lain selain dio
  }
}


 // Future<Null> _fetchData() async {
  //   if (widget.rendered == false) {
  //     setState(() {
  //       loading = true;
  //     });

  // final responseFoodNecessity = await http.get(foodNecessityUrl);

  // if (responseFoodNecessity.statusCode == 200) {
  //   final jsonResponse = json.decode(responseFoodNecessity.body);
  //   widget.foodNecessityModel =
  //       new FoodNecessityModel.fromJson(jsonResponse);
  // }

  // final responseAll = await http.get(apiMakanUrl);

  // if (responseAll.statusCode == 200) {
  //   final data = jsonDecode(responseAll.body);

  //   setState(() {
  //     for (Map idx in data) {
  //       widget.allFoods.add(AllFoodResponse.fromJson(idx));
  //     }
  //   });

  // }
  // final responseRecom = await http.get(foodRecomUrl);
  // if (responseRecom.statusCode == 200) {
  //   final lauk = jsonDecode(responseRecom.body)[0]['lauk'];
  //   setState(() {
  //     for (Map idx in lauk) {
  //       widget.foodsLauk.add(FoodRecomModel.fromJson(idx));
  //     }
  //   });
  //   final sayur = jsonDecode(responseRecom.body)[1]['sayur'];
  //   setState(() {
  //     for (Map idx in sayur) {
  //       widget.foodsSayur.add(FoodRecomModel.fromJson(idx));
  //     }
  //   });
  //       widget.rendered = true;
  //       loading = false;
  //     }
  //   } else {
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   _fetchData();

  //   super.initState();
  // }
