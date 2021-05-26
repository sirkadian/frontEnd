import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sirkadian_project/models/auth_models/initS_request.dart';
import 'package:sirkadian_project/models/auth_models/initS_response.dart';
import 'package:sirkadian_project/models/auth_models/login_request.dart';
import 'package:sirkadian_project/models/auth_models/login_response.dart';
import 'package:sirkadian_project/models/auth_models/register_request.dart';
import 'package:sirkadian_project/models/auth_models/register_response.dart';
import 'package:sirkadian_project/models/auth_models/userActivation_response.dart';
import 'package:sirkadian_project/models/url_model.dart';

class AuthRepository {
  Dio _dio = Dio();

  Future<Either<String, ActivationResponse>> userActivation(
      String idUser, String code) async {
    Response _response;
    try {
      _response = await _dio.post(
        '$root/user/activate?id=$idUser&code=$code',
      );
      ActivationResponse _activationResponse =
          ActivationResponse.fromJson(_response.data);

      return right(_activationResponse);
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
          errorMessage = error.response.data['error'];
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

  Future<Either<String, RegisterResponse>> signUpUserWithEmailUserPass({
    @required RegisterRequest registerRequest,
  }) async {
    Response _response;
    try {
      _response = await _dio.post(
        registerPostUrl,
        data: registerRequest.toJson(),
      );
      RegisterResponse _registerResponse =
          RegisterResponse.fromJson(_response.data);

      return right(_registerResponse);
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
          errorMessage = error.response.data['error'];
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

  Future<Either<String, LoginResponse>> signInUserWithEmailAndPassword({
    @required LoginRequest loginRequest,
  }) async {
    Response _response;
    try {
      _response = await _dio.post(
        loginPostUrl,
        data: loginRequest.toJson(),
      );
      LoginResponse _loginResponse = LoginResponse.fromJson(_response.data);

      return right(_loginResponse);
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
          errorMessage = error.response.data['error'];
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

  Future<Either<String, InitialSetupResponse>> getUserInitialSetup(
      {@required InitialSetupRequest initialSetupRequest,
      @required String authToken}) async {
    Response _response;
    String _responseI;

    try {
      _responseI = _dio.options.headers["Authorization"] = 'Bearer $authToken';
      print(_responseI);
      _response = await _dio.post(
        initSUrl,
        data: initialSetupRequest.toJson(),
      );

      InitialSetupResponse _initialSetupResponse =
          InitialSetupResponse.fromJson(_response.data);

      return right(_initialSetupResponse);
    } on DioError catch (error) {
      //error yang dihasilkan oleh dio
      String errorMessageI = error.response.data.toString();
      switch (error.type) {
        case DioErrorType.CONNECT_TIMEOUT:
          break;
        case DioErrorType.SEND_TIMEOUT:
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          break;
        case DioErrorType.RESPONSE:
          errorMessageI = error.response.data['error'];
          break;
        case DioErrorType.CANCEL:
          break;
        case DioErrorType.DEFAULT:
          break;
      }
      return left(errorMessageI);
    }
    //catch (error) {} ini bisa ditambahin untuk ngehandle error2 lain selain dio
  }
}
