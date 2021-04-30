import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodz/app/modules/home/splash_page.dart';
import 'package:goodz/app/modules/login/login_page.dart';

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
        GetPage(name: '/login', page: () => LoginPage()),
      ],
    );
  }
}
