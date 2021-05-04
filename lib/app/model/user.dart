import 'package:uuid/uuid.dart';

class UserModel {
  var uuid = Uuid();
  String? id;
  String? email;
  String? username;
  String? password;

  UserModel({this.email, this.username, this.password}) : this.id = Uuid().v1();
}
