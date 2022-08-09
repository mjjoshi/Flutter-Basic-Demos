import 'package:get/get.dart';
import '../model/product.dart';

//controller is based on funcnality
class CartController extends GetxController {
  var cartItems = List<Product>.empty(growable: true).obs; //observable
  int get count => cartItems.length;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price!);

  var testAmount = 0.0;

  // addTocart(Product product) {
  //   cartItems.add(product);
  // }

  addTocart(Product product) {
    cartItems.add(product);
    testAmount = totalPrice;
    update(); //getBuilder method working manually udpate value
  }




}
