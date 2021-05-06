import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:goodz/app/core/app_colors.dart';
import 'package:goodz/app/modules/home/widgets/app_bar_widget.dart';
import 'package:goodz/app/modules/home/widgets/product_form_widget.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(),
      body: controller.products.isNotEmpty
          ? GetBuilder(
              builder: (HomeController homeController) {
                return Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text('Meus produtos'),
                      ),
                      Expanded(
                        flex: 12,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 210,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.border,
                                        offset: Offset(1, 2),
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            homeController
                                                .products[index].amount
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
                                        Text(homeController
                                            .products[index].name!),
                                        Text(homeController
                                            .products[index].code!),
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
                                            onTap: () => controller
                                                .deleteProduct(controller
                                                    .products[index].id!),
                                            child: Icon(
                                                FontAwesomeIcons.solidTrashAlt),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.boxOpen,
                      color: AppColors.purple,
                      size: 100.0,
                    ),
                    Text('Você não possui produtos cadastrados!')
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ProductForm(),
                );
              });
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
