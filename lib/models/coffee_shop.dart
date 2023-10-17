import 'package:coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale list
  final List<Coffee> _shop = [
    Coffee(name: 'Long Black', price: '4.10', imagePath: 'assets/black.png'),
    Coffee(name: 'Latte', price: '4.20', imagePath: 'assets/latte.png'),
    Coffee(name: 'Espresso', price: '3.50', imagePath: 'assets/espresso.png'),
    Coffee(
        name: 'Ice Coffee', price: '4.40', imagePath: 'assets/ice_coffee.png'),
  ];

  //user cart
  List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemToCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  //get total price from cart
  double get totalPrice {
    double total = 0;
    for (Coffee coffee in _userCart) {
      total += double.parse(coffee.price);
    }
    return total;
  }

  //clear cart
  void clearCart() {
    _userCart.clear();
  }
}
