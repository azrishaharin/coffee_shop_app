import 'package:flutter/material.dart';

import '../models/coffee.dart';

class CartTile extends StatelessWidget {
  final Coffee coffee;
  const CartTile({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(coffee.name),
        leading: Image.asset(coffee.imagePath),
        trailing: Text(coffee.price),
      ),
    );
  }
}
