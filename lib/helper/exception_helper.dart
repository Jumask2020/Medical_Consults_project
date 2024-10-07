import 'package:dio/dio.dart';

class ExceptionHelper {

  static handleExceptionArabic(DioException error) {
    switch (error.type) {
      case DioException.badResponse:
        {
          return "استجابة سيئة، تحقق من اسم المستخدم أو كلمة المرور";
        }
      case DioException.connectionError:
        {
          return 'خطأ في الاتصال';
        }
      case DioException.connectionTimeout:
        {
          return "الخادم استغرق وقتاً طويلاً للرد";
        }
      case DioException.receiveTimeout:
        {
          return "لم يتم الحصول على أي رد من الخادم";
        }
      default:
        {
          return "خطأ غير معروف، يرجى التحقق من اتصال الإنترنت والمحاولة لاحقاً";
        }
    }
  }
  static handleExption(DioException error) {
    switch (error.type) {
      case DioException.badResponse:
        {
          return "bad response check username or password";
        }
      case DioException.connectionError:
        {
          return 'Connection Error';
        }
      case DioException.connectionTimeout:
        {
          return "server take long time to response";
        }
      case DioException.receiveTimeout:
        {
          return "didn't get any response from server";
        }
      default:{
        return "unknown error please check your internet connection and try later";
      }

    }
  }
}
