class CartItem {
  String type;
  String quantity;
  var removeToppings = [];
  var extras = [];
  var sauces = [];

  CartItem({this.type, this.quantity, this.removeToppings,this.extras,this.sauces});
}