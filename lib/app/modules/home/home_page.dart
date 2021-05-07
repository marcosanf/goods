import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:goodz/app/core/app_colors.dart';
import 'package:goodz/app/core/app_text_styles.dart';
import 'package:goodz/app/model/product.dart';
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
          controller.yTransValue = 0;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFf0f2f5),
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget(),
        body: controller.products.isNotEmpty
            ? GetBuilder(builder: (HomeController controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: AppColors.white,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25.0),
                                  topLeft: Radius.circular(25.0),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child:
                                    Image.asset('assets/images/product.webp'),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.products[index].name!,
                                  style: AppTextStyles.bodyBold,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Código: ${controller.products[index].code!}',
                                      style: AppTextStyles.body12,
                                    ),
                                    Text(
                                      ' | ',
                                      style: AppTextStyles.body12,
                                    ),
                                    Text(
                                      'Quantidade: ${controller.products[index].amount.toString()}',
                                      style: AppTextStyles.body12,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'R\$ ${controller.products[index].price.toString()}',
                                      style: AppTextStyles.bodyGrey20,
                                    ),
                                    SizedBox(
                                      width: 100.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.deleteProduct(
                                            controller.products[index].id!);
                                      },
                                      child: Text(
                                        'Remover',
                                        style: AppTextStyles.bodyDarkRed,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              })
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
