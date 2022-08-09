import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../controller/shopping_controller.dart';
import 'shopping_description.dart';

void main() {
  runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false, home: ShoppingPage()));
}

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final shoppingcontroller = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.product.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {

                            // Get.to(const ShoppingDescription(),
                            //     arguments: controller.product[index]);
                    //using navigator
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ShoppingDescription(product: controller.product[index]),
                            //   ),
                            // );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShoppingDescription(),
                                settings: RouteSettings(
                                  arguments: controller.product[index],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.all(12),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.product[index].productName}',
                                              style:
                                                  const TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                              '${controller.product[index].productDescription}',
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text('${controller.product[index].price}',
                                          style: const TextStyle(fontSize: 24)),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        cartController.addTocart(
                                            controller.product[index]);
                                      },
                                      child: const Text('Add to Cart')),
                                  // Obx(() => IconButton(
                                  //     onPressed: () {
                                  //       cartController.cartItems[index].isFavorite
                                  //           .toggle();
                                  //     },
                                  //     icon: cartController
                                  //             .cartItems[index].isFavorite.value
                                  //         ? Icon(Icons.check_box_rounded)
                                  //         : Icon(Icons
                                  //             .check_box_outline_blank_outlined)))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }),
              ),
              // GetBuilder<CartController>(builder: (controller){
              //   return Text('Total amount: \$ ${controller.testAmount}', style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600 , fontSize: 30),);
              // }),
              // GetX<CartController>(
              //     builder: (controller) {
              //     return Text('Total amount: \$ ${controller.totalPrice}', style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600 , fontSize: 30),);
              //   }
              // ),
              Obx(() {
                //if instance is with you
                return Text(
                  'Total amount: \$ ${cartController.totalPrice}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                );
              }),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
    );
  }
}
