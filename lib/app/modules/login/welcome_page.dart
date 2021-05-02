import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodz/app/modules/login/welcome_controller.dart';
import '../../core/app_text_styles.dart';
import '../../core/core.dart';

class WelcomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: AppImages.boxSvg,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                      child: Text(
                        'Organização para seus pedidos',
                        style: AppTextStyles.heading,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                      child: Text(
                        'Crie um catalógo de produtos gerenciável. Com a Wishlist, selecione os itens e envie oraçamentos de forma rápida.',
                        style: AppTextStyles.heading16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton('Entrar', '/login'),
                      buildButton('Criar conta', '/singup'),
                    ],
                  ),
                ),
              ),
              //Expanded(child: Text(),)
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildButton(String title, String route) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(route);
      },
      child: Container(
        height: 70.0,
        width: 165.0,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.titlePurple,
          ),
        ),
      ),
    );
  }
}
