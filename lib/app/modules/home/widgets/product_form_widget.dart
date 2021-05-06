import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodz/app/core/app_colors.dart';
import 'package:goodz/app/modules/home/home_controller.dart';

class ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Form(
      key: controller.productForm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Adicione um produto'),
            TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nome do produto',
                ),
                controller: controller.nameController,
                onSaved: (value) {
                  controller.name = value!;
                },
                validator: (value) {
                  return controller.validateProduct(value!);
                }),
            TextFormField(
              decoration: InputDecoration(hintText: 'Preço'),
              keyboardType: TextInputType.number,
              controller: controller.priceController,
              onSaved: (value) {
                controller.price = double.parse(value!);
              },
            ),
            TextFormField(
                decoration: InputDecoration(hintText: 'Quantidade'),
                controller: controller.amountController,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  controller.amount = int.parse(value!);
                }),
            TextFormField(
                decoration: InputDecoration(
                  hintText: 'Código do produto',
                ),
                controller: controller.codeController,
                onSaved: (value) {
                  controller.code = value!;
                },
                validator: (value) {
                  return controller.validateCode(value!);
                }),
            TextButton(
              onPressed: () {
                controller.productForm.currentState!.save();
                controller.validateRegister();
                controller.addProduct(controller.product);
                Get.back();
                controller.resetForm();
              },
              child: Text('Cadastrar'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
