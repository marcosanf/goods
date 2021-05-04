import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:goodz/app/model/user.dart';

class SingupController extends GetxController {
// final MyRepository repository;
// SingupController({@required this.repository}) : assert(repository != null);

  final UserModel _user = UserModel();
  late TextEditingController emailController,
      usernameController,
      passwordController;

  var email = '';
  var username = '';
  var password = '';

  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  UserModel get user => _user;

  adduser(UserModel user) {}

  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
