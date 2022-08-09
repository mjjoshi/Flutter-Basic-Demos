import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/GetxDemo/model/product.dart';

//passing data using navigator & GetX

class ShoppingDescription extends StatefulWidget {
  // const ShoppingDescription({Key? key}) : super(key: key);
  // final Product product;
  //const ShoppingDescription({super.key, required this.product});

  @override
  State<ShoppingDescription> createState() => _ShoppingDescriptionState();
}

class _ShoppingDescriptionState extends State<ShoppingDescription> {
  late var data;

  @override
  void initState() {
    super.initState();
    // data = Get.arguments as Product;
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(title: Text(data.productName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(data.productDescription!),
      ),
    );
  }
}
