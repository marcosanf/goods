import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  var uuid = Uuid();
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? username;
  @HiveField(3)
  String? password;

  UserModel({this.email, this.username, this.password}) : this.id = Uuid().v1();
}
