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
    totalPrice(cart);
  }

  removeFromCart(int index){
    cart.removeAt(index);
    totalPrice(cart);
  }

  emptyCart(){
    cart.clear();
    total = 0.obs;
    counter = 0.obs;
  }

  totalPrice(List list) {
    var priceList = [];
    if(list.isNotEmpty){
      list.forEach((element) {
        priceList.add(element.price);
      });
      total = priceList.reduce((value, element) => value + element);
    }
  }
}