import 'package:coffee_shop_app/component/bottom_nav.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/pages/shop_page.dart';
import 'package:coffee_shop_app/pages/cart_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables
  int selectedIndex = 0;
  final List<Widget> _pages = [ShopPage(), CartPage()];

  //methods
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[selectedIndex],
        backgroundColor: backgroundColor,
        bottomNavigationBar:
            BottomNav(onTabChange: (index) => navigateBottomBar(index)));
  }
}
