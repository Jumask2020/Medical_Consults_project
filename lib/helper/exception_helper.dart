import 'package:dio/dio.dart';

class ExceptionHelper {
  static handleException(DioException error) {
    switch (error.response!.statusCode) {
      case 200:
        return 'Login successful';
      case 422:
        return 'The email has already been taken';
      case 401:
        return 'Invalid login credentials';
    }
  }
}
