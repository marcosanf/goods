import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodz/app/core/app_text_styles.dart';
import 'package:goodz/app/core/core.dart';
import 'package:goodz/app/model/user.dart';
import 'package:goodz/app/modules/login/singup_controller.dart';

class SignupPage extends GetView<SingupController> {
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
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vamos começar',
                      style: AppTextStyles.heading,
                    ),
                    Text(
                      'Crie uma conta para continuar',
                      style: AppTextStyles.heading24,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      key: controller.signUpFormKey,
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
                        controller: controller.emailController,
                        onSaved: (value) {
                          controller.email = value!;
                        },
                        validator: (value) => controller.validateEmail(value!),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Nome de usuário',
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
                            Icons.person,
                            color: AppColors.white,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        controller: controller.usernameController,
                        onSaved: (value) {
                          controller.username = value!;
                        },
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
                        controller: controller.passwordController,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) =>
                            controller.validatePassword(value!),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Já possui uma conta?',
                            style: AppTextStyles.heading16,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/signin');
                            },
                            child: Text(
                              'Entrar',
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
                        controller.adduser(controller.user);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                        child: Container(
                          height: 70.0,
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
