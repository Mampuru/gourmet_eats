class CartItem {
  String? type;
  double? price;
  int? quantity;
  List? removeToppings = [];
  List? extras = [];
  List? sauces = [];

  CartItem({this.type, this.quantity, this.removeToppings,this.extras,this.sauces,this.price});
}