class LinkApi {
  static const String linkRoot = 'https://cons.actnow-ye.com/api';
  static const String linkSignUp = '$linkRoot/register';
  static const String linkSignIn = '$linkRoot/login';
  static const String linkPostProfile = '$linkRoot/profile/update';
  static const String linkGetProfile = '$linkRoot/profile';
  static const String linkGetConsults = '$linkRoot/consultations';

  String linkGetReplaies(String id){
    return '$linkRoot/consultations/$id/replies';
  }

}
