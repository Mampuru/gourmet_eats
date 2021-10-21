import 'package:get/get.dart';
import 'package:gourmet_eats/models/cart_item.dart';

class CartController extends GetxController {
  var counter = 0.obs;
  var total = 0.obs;

  List<CartItem> cart = [];

  @override
  void onInit() {
    super.onInit();
  }

  addToCart(CartItem item){
    cart.add(item);
  }

  removeFromCart(CartItem item){
    cart.remove(item);
  }

  emptyCart(){
    cart.clear();
    total = 0.obs;
    counter = 0.obs;
  }

  getCart(){
    return cart;
  }
}