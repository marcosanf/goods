import 'package:flutter/material.dart';
import 'package:goodz/app/core/app_gradients.dart';
import 'package:goodz/app/core/app_text_styles.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250.0),
          child: Container(
            height: 161,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.heading2,
                          children: [
                            TextSpan(
                              text: "Marcos",
                              style: AppTextStyles.heading2,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 58.0,
                        height: 58.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://avatars.githubusercontent.com/u/32041514?v=4"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
}
