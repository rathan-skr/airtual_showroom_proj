// ignore_for_file: use_build_context_synchronously

import 'package:airtual_showroom_proj/dashboard_components/edit_business.dart';
import 'package:airtual_showroom_proj/dashboard_components/manage_products.dart';
import 'package:airtual_showroom_proj/dashboard_components/supl_balance.dart';
import 'package:airtual_showroom_proj/dashboard_components/supl_order.dart';
import 'package:airtual_showroom_proj/dashboard_components/supl_statics.dart';
import 'package:airtual_showroom_proj/minor_screens/visit_store.dart';
import 'package:airtual_showroom_proj/widgets/appbar_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/alert_dialog.dart';

List<String> label = [
  'my store',
  'orders',
  'edit profile',
  'manage profile',
  'balance',
  'statics'
];
List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart
];
List<Widget> pages =  [
  VisitStore(suppId: FirebaseAuth.instance.currentUser!.uid),
  const SupplierOrder(),
  const EditBusiness(), //editsupplierprofile
  const ManageProducts(),
  const Balance(),
  const Statics()
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              MyAlertDialog.showMyDialog(
                //alert dialog box
                context: context,
                title: 'Log Out',
                content: 'Are you sure to log out?',
                tabNo: () {
                  Navigator.pop(context);
                },
                tabYes: () async {
                  await FirebaseAuth.instance.signOut();
                  //Navigator.pop(context);
                  Navigator.popAndPushNamed(context, '/welcome_screen');
                  // Navigator.pushReplacementNamed(context, '/welcome_screen');
                },
              );
            },
            icon: const Icon(Icons.logout),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pages[index]));
              },
              child: Card(
                elevation: 20,
                shadowColor: Colors.purpleAccent.shade400,
                color: Colors.blueGrey.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icons[index],
                      color: Colors.yellowAccent,
                      size: 50,
                    ),
                    Text(
                      label[index].toUpperCase(),
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          fontFamily: 'Acme'),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
