import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/view/screen/auth/signin.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: const Locale('ar'),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SigninView(),
    );
  }
}
