import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:goodz/app/core/app_colors.dart';
import 'package:goodz/app/core/app_text_styles.dart';
import 'package:goodz/app/modules/home/widgets/app_bar_widget.dart';
import 'package:goodz/app/modules/home/widgets/bottom_nav_bar_widget.dart';
import 'package:goodz/app/modules/home/widgets/product_form_widget.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        if (notification.scrollDelta!.sign == 1) {
          controller.yTransValue = 100;
        } else if (notification.scrollDelta!.sign == -1) {
          controller.yTransValue = 100;
        }
        return true;
      },
      child: Scaffold(
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
                                              homeController
                                                  .products[index].price
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
                                              child: Icon(FontAwesomeIcons
                                                  .solidTrashAlt),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 0),
                        child: Icon(
                          FontAwesomeIcons.boxOpen,
                          color: AppColors.mainPurple,
                          size: 90.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(28.0, 28, 28.0, 0),
                        child: Text(
                          'Você não possui produtos cadastrados!',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body20,
                        ),
                      )
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
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
