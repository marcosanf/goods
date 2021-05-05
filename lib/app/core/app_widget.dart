import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodz/app/modules/home/home_controller.dart';
import 'package:goodz/app/modules/home/home_page.dart';
import 'package:goodz/app/modules/home/splash_page.dart';
import 'package:goodz/app/modules/login/singin_page.dart';
import 'package:goodz/app/modules/login/singup_controller.dart';
import 'package:goodz/app/modules/login/singup_page.dart';
import 'package:goodz/app/modules/login/welcome_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put<SingupController>(SingupController());
    final homeController = Get.put<HomeController>(HomeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.native,
      locale: Locale('pt', 'BR'),
      getPages: [
        GetPage(name: '/', page: () => SplashPage()),
        GetPage(name: '/welcome', page: () => WelcomePage()),
        GetPage(name: '/signin', page: () => SigninPage()),
        GetPage(name: '/signup', page: () => SignupPage()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}
