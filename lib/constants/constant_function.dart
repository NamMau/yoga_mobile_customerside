import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConstantFunction {
  static Future<List<Map<String, dynamic>>> getResponse(String course) async {
    String api = 'https://yoga-api-nzy4.onrender.com/v1/categories';
    final response = await http.get(Uri.parse(api));

    // Check if the response status code is 200
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> categories = [];
      var data = jsonDecode(response.body);

      // Assuming `data` is a list of categories directly
      for (var category in data) {
        // Convert each category item to Map<String, dynamic> format
        categories.add(Map<String, dynamic>.from(category));
      }
      return categories;
    }
    return [];
  }
}
