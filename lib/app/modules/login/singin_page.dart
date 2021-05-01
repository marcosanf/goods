import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'singin_controller.dart';

class SigninPage extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('LoginPage')),
        body: SafeArea(child: Text('LoginController')));
  }
}
