import 'package:coffee_shop_app/component/cart_tile.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeCartItem(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemToCart(coffee);
  }

  final snackBar = const SnackBar(
    content: Text('Item removed from cart'),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) {
      return SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          children: [
            const Text('Your Cart', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            if (value.userCart.isEmpty)
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Your cart is empty',
                  style: TextStyle(color: Colors.black38),
                ),
              ))
            else
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 20, 10),
                child: Row(
                  children: [
                    Text('Items',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text('Price',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            if (value.userCart.isNotEmpty)
              Expanded(
                  child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (context, index) {
                  Coffee eachCoffee = value.userCart[index];
                  return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        removeCartItem(eachCoffee);
                      },
                      child: CartTile(coffee: eachCoffee));
                },
              )),
            Row(
              children: [
                Text('Total Price: ${value.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const Spacer(),
                if (value.userCart.isNotEmpty)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          backgroundColor: Colors.brown[400]),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CheckoutPage();
                        }));
                      },
                      child: const Text('Checkout'))
              ],
            ),
          ],
        )),
      ));
    });
  }
}
