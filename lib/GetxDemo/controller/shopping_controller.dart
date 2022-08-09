import 'package:get/get.dart';
import 'package:untitled1/GetxDemo/model/product.dart';

class ShoppingController extends GetxController {
  var product = List<Product>.empty(growable: true).obs; //observable

  //getBuilder - you have to update your data manually , ObX, GetX
  //obs = update data & reflact UI

  //GetX, obX- rective approch , use .obs, auto update , normal
  //GEt Builder == light , set state(), manually update
  //if you have access to your controller then use obx otherwise you can use GetX



  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product descriptions done for all',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product there is all about descriptions',
          productImage: 'abd',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product test new descriptions for all usage',
          productImage: 'abd',
          productName: 'ThirdProd'),
    ];

    product.value = productResult;
  }
}
