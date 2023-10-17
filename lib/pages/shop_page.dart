import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../component/coffee_tile.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(children: [
              const Text("How would you like your coffee?",
                  style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (context, index) {
                        Coffee eachCoffee = value.coffeeShop[index];
                        return CoffeeTile(
                            coffee: eachCoffee,
                            onPressed: (() => addToCart(eachCoffee)));
                      }))
            ]),
          ),
        ),
      ),
    );
  }
}
