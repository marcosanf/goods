import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:goodz/app/model/product.dart';

class HomeController extends GetxController {
//final MyRepository repository;
//HomeController({@required this.repository}) : assert(repository != null);

  final GlobalKey<FormState> productForm = GlobalKey<FormState>();
  late List<Product> _products;
  List<Product> get products => _products;
  late TextEditingController nameController,
      priceController,
      amountController,
      codeController;

  var name = '';
  var price;
  var amount;
  var code = '';
  Product product = Product();

  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    priceController = TextEditingController();
    amountController = TextEditingController();
    codeController = TextEditingController();
  }

  HomeController() {
    _products = [];
  }

  addProduct(Product product) {
    product.name = name;
    product.price = price;
    product.amount = amount;
    product.code = code;
    _products.add(product);
    update();
  }

  deleteProduct(String id) {
    _products.removeWhere((element) => element.id == id);
    update();
  }

  String? validateProduct(String value) {
    if (value == null) {
      return 'Informe o nome do produto';
    }
  }

  String? validateCode(String value) {
    if (value == null) {
      return 'Informe o código do produto';
    }
  }

  void onClose() {
    nameController.dispose();
    priceController.dispose();
    amountController.dispose();
    codeController.dispose();
  }
}
