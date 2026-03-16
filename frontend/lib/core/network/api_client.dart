import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/core/constants/api_constants.dart';

class ApiClient {
  static Future<Map<String, dynamic>?> checkEmail(String email) async {
    final url = Uri.parse("$BASE_URL$VALIDATE_MAIL?email=$email");

    try {
      print('Email: ${email}');
      print('inside API');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("API Response: $data");

        return data;
      } else {
        print("API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Request failed: $e");
      return null;
    }
  }
}
