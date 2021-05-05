import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:goodz/app/core/app_text_styles.dart';
import 'package:goodz/app/core/core.dart';
import 'singin_controller.dart';

class SigninPage extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(gradient: AppGradients.linear),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Entre na sua conta',
                      style: AppTextStyles.heading,
                    ),
                    Text(
                      'Bem vindo(a),',
                      style: AppTextStyles.heading24,
                    ),
                    Text(
                      'Sentimos sua falta!',
                      style: AppTextStyles.heading24,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: AppColors.white,
                          hintStyle: AppTextStyles.heading16,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: AppColors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: AppColors.white,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: AppColors.white,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          hintStyle: AppTextStyles.heading16,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: AppColors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: AppColors.white,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColors.white,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Não possui uma conta?',
                            style: AppTextStyles.heading16,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/signup');
                            },
                            child: Text(
                              'Cadastre-se',
                              style: AppTextStyles.linkText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/home');
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                        child: Container(
                          height: 55.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                              child: Text(
                            'Entrar',
                            style: AppTextStyles.titlePurple,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
