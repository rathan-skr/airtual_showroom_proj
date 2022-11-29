import 'package:flutter/material.dart';

import '../minor_screens/SearchScreen.dart';

class FakeSearch extends StatelessWidget {
  const FakeSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchScreen() ));
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width:1.4),
          borderRadius: BorderRadius.circular(25)
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(
            children: const[
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.search, color: Colors.grey,
                  ),
              ),
              Text(
                'What are you looking for?', style: TextStyle(fontSize:16, color: Colors.grey),
                ),
            ],
          ),
          
              Container(
                height: 35,
                width: 70,
                decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(25)),
                child: const Center(
                  child: Text(
                    'Search', style: TextStyle(fontSize:16, color: Colors.grey),
                    ),
                ),
              ),
        ]),
        ),
    );
  }
}