import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:goodz/app/model/user.dart';
import 'package:hive/hive.dart';

class SingupController extends GetxController {
// final MyRepository repository;
// SingupController({@required this.repository}) : assert(repository != null);

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  late List<UserModel> _users;
  late Box<UserModel> userBox;
  late TextEditingController emailController,
      usernameController,
      passwordController;

  var email = '';
  var username = '';
  var password = '';
  UserModel user = UserModel();

  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  List<UserModel> get users => _users;

  // ignore: non_constant_identifier_names
  SignUpController() {
    userBox = Hive.box<UserModel>('users');
    _users = [];
    for (int i = 0; i < userBox.values.length; i++) {
      _users.add(userBox.getAt(i)!);
    }
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Informe um e-mail válido';
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length <= 6) {
      return 'A senha precisa ter 6 caracteres';
    } else {
      return null;
    }
  }

  adduser(UserModel user) {
    user.email = email;
    user.username = username;
    user.password = password;
    _users.add(user);
    print(user.email);
    print(user.username);
    print(user.password);
    update();
  }

  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
