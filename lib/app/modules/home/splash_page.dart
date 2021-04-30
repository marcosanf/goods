import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:goodz/app/core/app_text_styles.dart';
import 'package:goodz/app/core/core.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    launchApp();
  }

  launchApp() async {
    return Timer(Duration(seconds: 5), changeScreen);
  }

  changeScreen() async {
    Get.toNamed('/login');
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.box,
              size: 100.0,
              color: AppColors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'GOODS',
                style: AppTextStyles.heading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
