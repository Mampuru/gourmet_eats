class CartItem {
  String type;
  double price;
  int quantity;
  var removeToppings = [];
  var extras = [];
  var sauces = [];

  CartItem({this.type, this.quantity, this.removeToppings,this.extras,this.sauces,this.price});
}