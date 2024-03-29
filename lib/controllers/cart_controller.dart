import 'package:get/get.dart';
import 'package:gourmet_eats/models/cart_item.dart';

class CartController extends GetxController {
  var counter = 0.obs;
  var total = 0.obs;
  var order = [].obs;
  var cart = [].obs;

  @override
  void onInit() {
    super.onInit();

  }

  addToCart(CartItem item){
    cart.add(item);
  }

  removeFromCart(int index){
    cart.removeAt(index);
  }

  emptyCart(){
    cart.clear();
    total = 0.obs;
    counter = 0.obs;
  }

  counterIncrement(){
    counter++;
  }

  counterDecrement(){
    counter--;
  }
}