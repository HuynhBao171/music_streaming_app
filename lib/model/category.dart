import 'dart:convert';

import 'package:music_streaming_app/config/env/endpoint.dart';
import 'package:http/http.dart' as http;

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Name'] = name;
    return data;
  }
  static Future<List<Category>> getAllCategories() async {
    final response = await http.get(Uri.parse('${Endpoint.music}/Categories'));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
  static List<Category> get(){
    List<Category> list=[];
    Future<List<Category>> categories= Category.getAllCategories();
    categories.then((value) => list=value);
    return list;
  }
}