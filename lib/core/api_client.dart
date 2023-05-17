import 'dart:async';

import 'package:dio/dio.dart';

import '../config/env/endpoint.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response?> signup(String username,String email, String password) async {
    try {
      Response response = await _dio.post(
        '/api/v1/users',
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        '${Endpoint}/Accounts/login/$username&$password',
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> getUserProfileData(String accesstoken) async {
        try {
          Response response = await _dio.get(
            'https://api.loginradius.com/identity/v2/auth/account',
            // options: Options(
            //   headers: {
            //     'Authorization': 'Bearer ${YOUR_ACCESS_TOKEN}',
            //   },
            // ),
          );
          return response.data;
        } on DioError catch (e) {
          return e.response;
        }
    }
}