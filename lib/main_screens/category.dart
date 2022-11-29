import 'package:airtual_showroom_proj/categories/beds_categ.dart';
import 'package:airtual_showroom_proj/categories/couch_categ.dart';
import 'package:airtual_showroom_proj/categories/desks_categ.dart';
import 'package:airtual_showroom_proj/categories/others_categ.dart';
import 'package:airtual_showroom_proj/categories/tables_categ.dart';
import 'package:airtual_showroom_proj/widgets/fake_search.dart';
import 'package:flutter/material.dart';

import '../categories/bookcases_categ.dart';
import '../categories/cabinetry_categ.dart';
import '../categories/chairs_categ.dart';

List<ItemsData> items = [
  ItemsData(label: 'beds'),
  ItemsData(label: 'bookcases'),
  ItemsData(label: 'cabinetry'),
  ItemsData(label: 'chair'),
  ItemsData(label: 'couch'),
  ItemsData(label: 'desks'),
  ItemsData(label: 'tables'),
  ItemsData(label: 'others')
];


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    for (var elements in items){
              elements.isSelected = false;
            }
            setState(() {
              items[0].isSelected = true;
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),),
        body: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: sideNavigator(size )),
          Positioned(
            bottom: 0,
            right: 0,
            child: categView(size))
        ],),
    );
  }
  Widget sideNavigator(Size size){
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,

      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
        return GestureDetector(
          onTap: () {
            _pageController.animateToPage(index,
            duration: const Duration(milliseconds:300),
            curve: Curves.bounceInOut );
            /*for (var elements in items){
              elements.isSelected = false;
            }
            setState(() {
              items[index].isSelected = true;
            }); */
          },
          child: Container(
            color: items[index].isSelected == true?
            Colors.white
            : Colors.grey.shade300,
            height: 100,
            child: Center(
              child: Text(items[index].label),
            )
          ),
        );
      }),
    );
  }
  Widget categView(Size size){
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          for (var elements in items){
              elements.isSelected = false;
            }
            setState(() {
              items[value].isSelected = true;
            });
        },
        scrollDirection: Axis.vertical,
        children: const [
        BedsCategory(),
        BookcasesCategory(),
        CabinetryCategory(),
        ChairsCategory(),
        CouchCategory(),
        DesksCategory(),
        TablesCategory(),
        OthersCategory()
      ],),
      );
  }
}

class ItemsData{
  String label;
  bool isSelected;
  ItemsData({required this.label, this.isSelected = false,});
}