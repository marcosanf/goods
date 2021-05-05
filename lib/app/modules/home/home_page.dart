import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:goodz/app/core/app_colors.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('HomePage')),
      body: controller.products.isNotEmpty
          ? GetBuilder(
              builder: (HomeController homeController) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    homeController.products[index].amount
                                        .toString(),
                                  ),
                                  Text(
                                    homeController.products[index].price
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                            Icon(FontAwesomeIcons.boxes),
                            Column(
                              children: [
                                Text(homeController.products[index].name!),
                                Text(homeController.products[index].code!),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(FontAwesomeIcons.heart),
                                  GestureDetector(
                                    onTap: () => controller.deleteProduct(
                                        controller.products[index].id!),
                                    child: Icon(FontAwesomeIcons.solidTrashAlt),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Container(),
      floatingActionButton: FloatingActionButton(
        //onPressed: () => controller.addProduct(Product(
        //    amount: 50,
        //    code: 'RXK-567',
        //    name: 'Placa de Vídeo',
        //    price: 699.90)),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: buildForm(),
                );
              });
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }

  Form buildForm() {
    return Form(
      key: controller.productForm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Adicione um produto'),
            TextFormField(
              decoration: InputDecoration(hintText: 'Nome do produto'),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Preço'),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Quantidade'),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Código do produto'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Cadastrar'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.lightPurple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
