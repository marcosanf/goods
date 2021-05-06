import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:goodz/app/core/app_colors.dart';
import 'package:goodz/app/core/app_gradients.dart';
import 'package:goodz/app/modules/home/home_controller.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      transform: Matrix4.translationValues(0, controller.yTransValue, 0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.box,
                  color: AppColors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.solidHeart,
                  color: AppColors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.plus,
                  color: AppColors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.solidMoon,
                  color: AppColors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.solidUser,
                  color: AppColors.white,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
