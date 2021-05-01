import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodz/app/modules/login/singup_controller.dart';

class SingupPage extends GetView<SingupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SingupPage')),
        body: SafeArea(child: Text('SingupController')));
  }
}
