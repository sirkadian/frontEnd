import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:sirkadian_project/models/auth_models/initS_request.dart';
import 'package:sirkadian_project/models/auth_models/initS_response.dart';

import 'package:sirkadian_project/models/url_model.dart';

class InitSRepository {
  Dio _dio = Dio();

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
          // TODO: Handle this case.
          break;
        case DioErrorType.SEND_TIMEOUT:
          // TODO: Handle this case.
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          // TODO: Handle this case.
          break;
        case DioErrorType.RESPONSE:
          // TODO: Handle this case.
          errorMessageI = error.response.data['error'];
          break;
        case DioErrorType.CANCEL:
          // TODO: Handle this case.
          break;
        case DioErrorType.DEFAULT:
          // TODO: Handle this case.
          break;
      }
      return left(errorMessageI);
    }
    //catch (error) {} ini bisa ditambahin untuk ngehandle error2 lain selain dio
  }
}
