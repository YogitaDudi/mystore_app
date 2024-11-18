import 'package:flutter/material.dart';
import 'package:mystore/auth/cart/view/cart_screen.dart';
import 'package:mystore/auth/category/view/category_screen.dart';
import 'package:mystore/auth/dashborad/provider/dashborad_provider.dart';
import 'package:mystore/auth/product/view/product_screen.dart';
import 'package:mystore/auth/profile/view/profile_screen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  final List<Widget> screens = [
    const ProductScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
          return screens[dashboardProvider.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
          return BottomNavigationBar(
            currentIndex: dashboardProvider.currentIndex,
            onTap: (index) {
              dashboardProvider.updateIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.greenAccent,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: 'Product'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          );
        },
      ),
    );
  }
}
