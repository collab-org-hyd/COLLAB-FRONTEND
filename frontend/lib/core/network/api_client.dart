import 'dart:convert';
import 'package:frontend/features/auth/presentation/pages/replaceForgottenPassword.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/core/constants/api_constants.dart';

class ApiClient {
  static Future<Map<String, dynamic>?> checkEmail(String email) async {
    final url = Uri.parse("$BASE_URL$VALIDATE_MAIL?email=$email");

    try {
      print('Email: ${email}');
      print('inside API');
      print('Full URL: $url');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("API Response: $data");

        return data;
      } else {
        print("API Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        return null;
      }
    } on http.ClientException catch (e, stackTrace) {
      print("HTTP ClientException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } on FormatException catch (e, stackTrace) {
      print("JSON FormatException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } catch (e, stackTrace) {
      print("Request failed: $e");
      print("Error type: ${e.runtimeType}");
      print("Stack trace: $stackTrace");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> verifyExistingUser(
      String email, String password) async {
    print('verifyExistingUser code');
    final url = Uri.parse("$BASE_URL$LOGIN_ENDPOINT");

    try {
      print('inside verify mail API');
      print('Full URL: $url');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("API Response: $data");

        return data;
      } else {
        print("API Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        return null;
      }
    } on http.ClientException catch (e, stackTrace) {
      print("HTTP ClientException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } on FormatException catch (e, stackTrace) {
      print("JSON FormatException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } catch (e, stackTrace) {
      print("Request failed: $e");
      print("Error type: ${e.runtimeType}");
      print("Stack trace: $stackTrace");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> registerUser({
    required String username,
    required String email,
    required String password,
    required String name,
  }) async {
    print('registerUser called');
    final url = Uri.parse("$BASE_URL$REGISTER_ENDPOINT");

    try {
      print('inside register API');
      print('Full URL: $url');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
          'display_name': name,
          'role': 'customer',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print("API Response: $data");
        return data;
      } else {
        print("API Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        return jsonDecode(response.body);
      }
    } on http.ClientException catch (e, stackTrace) {
      print("HTTP ClientException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } on FormatException catch (e, stackTrace) {
      print("JSON FormatException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } catch (e, stackTrace) {
      print("Request failed: $e");
      print("Error type: ${e.runtimeType}");
      print("Stack trace: $stackTrace");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> replaceforgottenpasswordAPICall({
    required String email,
    required String new_password,
    required String reset_token,
  }) async {
    print('Replace Forgotten Password called');
    final url = Uri.parse("$BASE_URL$REGISTER_ENDPOINT");

    try {
      print('inside register API');
      print('Full URL: $url');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print("API Response: $data");
        return data;
      } else {
        print("API Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        return jsonDecode(response.body);
      }
    } on http.ClientException catch (e, stackTrace) {
      print("HTTP ClientException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } on FormatException catch (e, stackTrace) {
      print("JSON FormatException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } catch (e, stackTrace) {
      print("Request failed: $e");
      print("Error type: ${e.runtimeType}");
      print("Stack trace: $stackTrace");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> requestOTP(
      {required String email}) async {
    print('requestOTP called with ${email}');
    final url = Uri.parse("$BASE_URL$REQUEST_OTP");

    try {
      print('inside register API');
      print('Full URL: $url');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print("API Response: $data");
        return data;
      } else {
        print("API Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        return jsonDecode(response.body);
      }
    } on http.ClientException catch (e, stackTrace) {
      print("HTTP ClientException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } on FormatException catch (e, stackTrace) {
      print("JSON FormatException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } catch (e, stackTrace) {
      print("Request failed: $e");
      print("Error type: ${e.runtimeType}");
      print("Stack trace: $stackTrace");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> verifyOTP(
      {required String email, required String otp}) async {
    print('verify OTP called');
    final url = Uri.parse("$BASE_URL$VERIFY_OTP");

    try {
      print('inside verify OTP API');
      print('Full URL: $url');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'otp': otp}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print("API Response: $data");
        return data;
      } else {
        print("API Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        return jsonDecode(response.body);
      }
    } on http.ClientException catch (e, stackTrace) {
      print("HTTP ClientException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } on FormatException catch (e, stackTrace) {
      print("JSON FormatException: $e");
      print("Stack trace: $stackTrace");
      return null;
    } catch (e, stackTrace) {
      print("Request failed: $e");
      print("Error type: ${e.runtimeType}");
      print("Stack trace: $stackTrace");
      return null;
    }
  }
}
