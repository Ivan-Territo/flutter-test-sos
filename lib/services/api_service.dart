import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/dish.dart';

class ApiService {
  static const String _baseUrl =
      'https://69846b7e885008c00db120c3.mockapi.io/api/v1';

  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  Future<List<Piatto>> getMenu() async {
    try {
      final response = await _dio.get('/Exam1');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        if (data.isNotEmpty && data[0]['menu'] != null) {
          final List<dynamic> menuData = data[0]['menu'];
          return menuData.map((item) => Piatto.fromMap(item)).toList();
        }
        return [];
      }
      return [];
    } catch (e) {
      debugPrint('Errore getMenu: $e');
      return [];
    }
  }
}
