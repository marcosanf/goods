import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodz/app/core/app_colors.dart';
import 'package:goodz/app/core/app_text_styles.dart';
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Text(
                'Adicione um produto',
                style: AppTextStyles.body20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nome do produto',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: AppColors.mainPurple),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  controller: controller.nameController,
                  onSaved: (value) {
                    controller.name = value!;
                  },
                  validator: (value) {
                    return controller.validateProduct(value!);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Preço',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: AppColors.mainPurple),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: controller.priceController,
                onSaved: (value) {
                  controller.price = double.parse(value!);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Quantidade',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: AppColors.mainPurple),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  controller: controller.amountController,
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    controller.amount = int.parse(value!);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Código do produto',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: AppColors.mainPurple),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  controller: controller.codeController,
                  onSaved: (value) {
                    controller.code = value!;
                  },
                  validator: (value) {
                    return controller.validateCode(value!);
                  }),
            ),
            GestureDetector(
              onTap: () {
                controller.productForm.currentState!.save();
                controller.validateRegister();
                controller.addProduct(controller.product);
                Get.back();
                controller.resetForm();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Container(
                  height: 55.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.mainPurple,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                      child: Text(
                    'Cadastrar',
                    style: AppTextStyles.title,
                  )),
                ),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     controller.productForm.currentState!.save();
            //     controller.validateRegister();
            //     controller.addProduct(controller.product);
            //     Get.back();
            //     controller.resetForm();
            //   },
            //   child: Text('Cadastrar'),
            //   style: ButtonStyle(
            //     backgroundColor:
            //         MaterialStateProperty.all<Color>(AppColors.purple),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
