import 'package:airtual_showroom_proj/utilities/categ_list.dart';
import 'package:flutter/material.dart';
import '../widgets/categ_widgets.dart';

class DesksCategory extends StatelessWidget {
  const DesksCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width*0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CategHeaderLabel(headerLabel:'Desks',),
                SizedBox(height: MediaQuery.of(context).size.height*0.68,
                child: GridView.count(
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 15,
                  crossAxisCount: 3, 
                  children: List.generate(desks.length-1, (index){
                  return SubcategModel(
                    mainCategName: 'desks',
                    subCategName: desks[index+1],
                    assetName: 'images/desks/desk$index.jpg',
                    subcategLabel: desks[index+1],
                  );
                }),),
                )
              ],
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 0,

          child: SliderBar(maincategName: 'Desks'),
        ),],
      ),
    );
    
  }
}

