import 'package:airtual_showroom_proj/galleries/beds_gallery.dart';
import 'package:airtual_showroom_proj/galleries/cabinetry_gallery.dart';
import 'package:airtual_showroom_proj/galleries/chairs_gallery.dart';
import 'package:airtual_showroom_proj/galleries/couch_gallery.dart';
import 'package:airtual_showroom_proj/galleries/desks_gallery.dart';
import 'package:airtual_showroom_proj/galleries/others_gallery.dart';
import 'package:airtual_showroom_proj/galleries/tables_gallery.dart';
import 'package:flutter/material.dart';
import '../galleries/bookcases_gallery.dart';
import '../widgets/fake_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade100.withOpacity(0.5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          /*title: InkWell(
            
          ),*/
          
            title: 
               const FakeSearch(),
            
          
          /*actions:[
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfileScreen() ));
            }, 
            icon: const Icon(
              Icons.person, 
              color: Colors.black,
            ),
          )
        ],*/
        
          /*actions: <Widget> [
            
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const StoresScreen() ));
                },
                child: const Icon(
                  Icons.person,color: Colors.black,
                  size: 26.0,
                ),
              )
            ),  
          ],*/
          
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.grey,
            indicatorWeight: 5,
            tabs: [
              RepeatedTab(label: 'beds',),
              RepeatedTab(label: 'bookcases',),
              RepeatedTab(label: 'cabinetry',),
              RepeatedTab(label: 'chairs',),
              RepeatedTab(label: 'couch',),
              RepeatedTab(label: 'desks',),
              RepeatedTab(label: 'tables',),
              RepeatedTab(label: 'others',),

           
              ],
            ),
          ),
          body: const TabBarView(children: [
            BedGalleryScreen(),
            BookcaseGalleryScreen(),
            CabinetryGalleryScreen(),
            ChairsGalleryScreen(),
            CouchGalleryScreen(),
            DesksGalleryScreen(),
            TablesGalleryScreen(),
            OthersGalleryScreen(),
          ]),
      ),
    );
  }
}



class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({
    Key? key, required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(child: Text(label, 
      style: TextStyle(color: Colors.grey.shade600),
      ),);
  }
}
