import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/env/endpoint.dart';

class ApiClient {
  Future<http.Response?> signup(String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://manduong2k2.bsite.net/api/Accounts/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Id': username,
          'Email': email,
          'Password': password,
        }),
      );
      return response;
    } catch (e) {
      print('Error in signup: $e');
      return null;
    }
  }

  Future<http.Response?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${Endpoint.music}/Accounts/login/$username&$password'),
      );
      return response;
    } catch (e) {
      print('Error in login: $e');
      return null;
    }
  }

  Future<http.Response?> getUserProfileData(String accessToken) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.loginradius.com/identity/v2/auth/account'),
        headers: <String, String>{
          'Authorization': 'Bearer $accessToken',
        },
      );
      return response;
    } catch (e) {
      print('Error in getUserProfileData: $e');
      return null;
    }
  }
}