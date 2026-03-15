import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signup(String email, String password, String name);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await client.post('https://api.example.com/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(message: 'Invalid credentials');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Unknown error');
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signup(String email, String password, String name) async {
    try {
      final response = await client.post('https://api.example.com/signup', data: {
        'email': email,
        'password': password,
        'name': name,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(message: 'Failed to sign up');
      }
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Unknown error');
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
