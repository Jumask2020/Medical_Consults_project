import 'package:dio/dio.dart';

class ExceptionHelper {
  static handleException(DioException error){
    switch(error.type){
      case DioExceptionType.badResponse :{
        return "خطأ في الايميل او كلمة المرور";
      }
      case DioExceptionType.connectionTimeout :{
        return "حدث خطاء أثناء الاتصال بالسيرفر";
      }
      case DioExceptionType.receiveTimeout :{
        return " لم يتم تلقي اي أستجابه من السيرفير , حاول مرة اخرى";
      }
      default:{
        return "تأكد من الاتصال بالانترنت ثم حاول مرة أخرى";
      }

    }
  }
}
