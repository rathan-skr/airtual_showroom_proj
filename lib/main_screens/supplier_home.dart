import 'package:airtual_showroom_proj/main_screens/category.dart'; //hidden categ page
import 'package:airtual_showroom_proj/main_screens/dashboard.dart';
import 'package:airtual_showroom_proj/main_screens/home.dart';
import 'package:airtual_showroom_proj/main_screens/stores.dart';
import 'package:airtual_showroom_proj/main_screens/upload_product.dart';
import 'package:flutter/material.dart';



class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({Key? key}) : super(key: key);

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = const[
    HomeScreen(),
    CategoryScreen(), 
    StoresScreen(),
    DashboardScreen(),
    UploadProductScreen(),
    
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
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Stores'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
          
          
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
