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

  double yTransValue = 0;
  String name = '';
  late double price;
  late int amount;
  String code = '';
  Product product = Product();

  void onInit() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    amountController = TextEditingController();
    codeController = TextEditingController();
    super.onInit();
  }

  void onClose() {
    nameController.dispose();
    priceController.dispose();
    amountController.dispose();
    codeController.dispose();
    super.onClose();
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

  updateProduct() {}

  String? validateProduct(String value) {
    if (value.isEmpty) {
      return 'Informe o nome do produto';
    }
  }

  String? validateCode(String value) {
    if (value.isEmpty) {
      return 'Informe o código do produto';
    }
  }

  void resetForm() {
    productForm.currentState!.reset();
    nameController.clear();
    priceController.clear();
    amountController.clear();
    codeController.clear();
  }

  void validateRegister() {
    productForm.currentState!.validate();
  }
}
