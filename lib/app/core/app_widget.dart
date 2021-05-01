import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodz/app/modules/home/splash_page.dart';
import 'package:goodz/app/modules/login/singin_page.dart';
import 'package:goodz/app/modules/login/singup_page.dart';
import 'package:goodz/app/modules/login/welcome_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.native,
      locale: Locale('pt', 'BR'),
      getPages: [
        GetPage(name: '/', page: () => SplashPage()),
        GetPage(name: '/welcome', page: () => WelcomePage()),
        GetPage(name: '/login', page: () => SigninPage()),
        GetPage(name: '/singup', page: () => SingupPage()),
      ],
    );
  }
}
