import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:goodz/app/core/core.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    launchApp();
  }

  launchApp() async {
    return Timer(Duration(seconds: 5), changeScreen);
  }

  changeScreen() async {
    Get.toNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.linear,
      ),
      child: Center(
        child: Icon(
          FontAwesomeIcons.box,
          size: 80.0,
          color: AppColors.white,
        ),
      ),
    );
  }
}
