import 'dart:io';
import 'package:flutter/material.dart';
import 'package:goodz/app/core/app_widget.dart';
import 'package:goodz/app/model/user.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.openBox<UserModel>('users');
  runApp(AppWidget());
}
