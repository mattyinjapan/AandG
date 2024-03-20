import 'dart:convert';

import 'package:http/http.dart';

import '../models/dictionary.dart';

class ApiService {
  String endpoint = const String.fromEnvironment('endPoint');

  Future<List<Dictionary>> fetchDictionary(String word) async {
    final response = await get(Uri.parse('$endpoint$word'));
    if (response.statusCode == 200) {
      List<Dictionary> objects = List<Dictionary>.from(
          json.decode(response.body).map((x) => Dictionary.fromJson(x)));
      return objects.toList();
    } else {
      throw Exception('Failed to load dictionary definition');
    }
  }
}

