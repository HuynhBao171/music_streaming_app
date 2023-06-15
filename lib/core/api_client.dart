import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/env/endpoint.dart';
import '../model/playlist.dart';

class ApiClient {
  Future<http.Response?> signup(
      String username, String email, String password) async {
    try {
      print(jsonEncode(<String, String>{
        'Id': username,
        'Email': email,
        'Password': password,
      }));
      final response = await http.post(
        Uri.parse('${Endpoint.music}/Accounts/register'),
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

  Future<http.Response?> forgetPassword(
    String email,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('${Endpoint.music}/Accounts/recovery?email=$email'),
      );
      return response;
    } catch (e) {
      print('Error in sent email: $e');
      return null;
    }
  }

  // Future<List<Playlist>> fetchAllPlaylist() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('${Endpoint.music}/Accounts/login/'),
  //     );
  //     var dataJson = jsonDecode(response.body);
  //     List articleJson = dataJson["articles"] as List;
  //     final List<Playlist> playlist = [];
  //     for (int i = 0; i < articleJson.length; i++) {
  //       articles.add(Playlist.fromJson(articleJson[i]));
  //     }
  //     // TODO FIX LỖI SERVER
  //     return articles;
  //   } catch (e) {
  //     print(e);
  //     // please shutdown your wifi
  //     throw "NetworkDown";
  //   }
  // }

  // Future<List<Song>> fetchAllPlaylist() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('${Endpoint.music}/Accounts/login/'),
  //     );
  //     var dataJson = jsonDecode(response.body);
  //     List articleJson = dataJson["articles"] as List;
  //     final List<Song> song = [];
  //     for (int i = 0; i < articleJson.length; i++) {
  //       articles.add(Playlist.fromJson(articleJson[i]));
  //     }
  //     // TODO FIX LỖI SERVER
  //     return articles;
  //   } catch (e) {
  //     print(e);
  //     // please shutdown your wifi
  //     throw "NetworkDown";
  //   }
  // }
}
