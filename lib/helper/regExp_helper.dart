// ignore: file_names
class RegExpHelper {

 static String? isUserNameValide(String? value) {
    if (value!.isEmpty ||
            !RegExp(r"^[أ-يA-Za-z ]+ +[أ-يA-Za-z ]+ +[أ-يA-Za-z ]")
                .hasMatch(value)
        ) {
      return 'يحب ادخال الاسم الثلاثي';
    }
    return null;
  }

 static String? isUserEmailValide(String? value) {
    if (value!.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return 'الايميل غير صحيح';
    }
    return null;
  }

 static String? isUserPassworValide(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
      return 'يجب ان تحتوي كلمة المرور على احروف ورموز وارقام والا تقل عن تمانيه';
    }

    return null;
  }
}