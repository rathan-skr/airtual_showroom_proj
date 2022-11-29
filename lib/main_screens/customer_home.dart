import 'package:airtual_showroom_proj/main_screens/category.dart'; //hidden categ page
import 'package:airtual_showroom_proj/main_screens/home.dart';
import 'package:airtual_showroom_proj/main_screens/profile.dart';
import 'package:airtual_showroom_proj/main_screens/stores.dart';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import 'cart.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    const StoresScreen(),
    const CartScreen(),
    ProfileScreen(
      documentId: FirebaseAuth.instance.currentUser!.uid,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: Colors.black,
        //unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: 'Category'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.store), label: 'Stores'),
          BottomNavigationBarItem(
            icon: Badge(
                showBadge: context.read<Cart>().getItems.isEmpty ? false : true,
                padding: const EdgeInsets.all(2),
                badgeColor: Colors.yellow,
                badgeContent: Text(
                  context.watch<Cart>().getItems.length.toString(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                child: const Icon(Icons.shopping_cart)),
                label: 'Cart',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
