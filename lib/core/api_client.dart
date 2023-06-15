import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/env/endpoint.dart';
import '../model/Category.dart';
import '../model/playlist.dart';
import '../model/song.dart';

class ApiClient {
  Future<http.Response?> signup(
      String username, String email, String password) async {
    try {
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

  Future<List<Song>> getSongsOfPlaylist(int idPlaylist) async {
    final response = await http.get(
        Uri.parse('${Endpoint.music}/Playlists/getAllSong?id=$idPlaylist'));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Song.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Category>> getAllCategories() async {
    final response = await http.get(Uri.parse('${Endpoint.music}/Categories'));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Playlist>> getAllPlaylists() async {
    final response = await http.get(Uri.parse('${Endpoint.music}/Playlists'));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Playlist.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Playlist>> getPlaylistsofSong(int idSong) async {
    final response = await http
        .get(Uri.parse('${Endpoint.music}/Playlists/songplaylist?id=$idSong'));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Playlist.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Song>> getSongsOfUser(int idUser) async {
    final response = await http
        .get(Uri.parse('${Endpoint.music}/Profiles/Songs?userid=$idUser'));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Song.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Playlist>> getPlaylistsofUser(int idUser) async {
    final response = await http
        .get(Uri.parse('${Endpoint.music}/Profiles/Playlists?userid=$idUser'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Playlist.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Playlist>> getLikedPlaylistsofUser(int idUser) async {
    final response = await http
        .get(Uri.parse('${Endpoint.music}/Profiles/Playlists?userid=$idUser'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Playlist.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Song>> searchAPI(String query) async {
    final response = await http
        .get(Uri.parse('${Endpoint.music}/Songs/Search?input=$query'));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Song.fromJson(e)).toList();
    } else {
      return List<Song>.empty();
    }
  }

  Future<http.Response?> addSong(
      String namesong, String urlsong, String urlimage, String username) async {
    try {
      final response = await http.post(
        Uri.parse('${Endpoint.music}/Songs/addsong'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Name': namesong,
          'Url': urlsong,
          'ImageUrl': urlimage,
          'ProfileId': username,
        }),
      );
      return response;
    } catch (e) {
      print('Error in signup: $e');
      return null;
    }
  }

  Future<http.Response?> LikeASong(int idUser, int songid) async {
    final response = await http.post(Uri.parse(
        '${Endpoint.music}/Profiles/LikeSong?userid=$idUser&songid=$songid'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<http.Response?> LikeAPlaylist(int idUser, int playlistid) async {
    final response = await http.post(Uri.parse(
        '${Endpoint.music}/Profiles/LikePlaylist?userid=$idUser&playlistid=$playlistid'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
