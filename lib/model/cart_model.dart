import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{


  // list of item on sale

  final List _shopItems = [
    // [itmeName , itemPrice, imagePath, color]
    ["Avacado","120.00","images/avocado.png", Colors.green],
    ["Banana","80.00","images/banana.png", Colors.yellow],
    ["Chicken","200.00","images/chicken.png", Colors.brown],
    ["Water","50.00","images/water.png", Colors.blue],
  ];

  // list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  // add item to cart
  void addItemCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // Delede item to cart

  void removeItemFromCart(int index){
    _cartItems.remove(_shopItems[index]);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal(){
    double totalPrice = 0;
    for(int i = 0; i < _cartItems.length ; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}