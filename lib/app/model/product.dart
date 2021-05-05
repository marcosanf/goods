import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class Product extends GetxController {
  String? id;
  String? name;
  double? price;
  int? amount;
  String? code;

  Product({this.name, this.price, this.amount, this.code})
      : this.id = Uuid().v1();
}
