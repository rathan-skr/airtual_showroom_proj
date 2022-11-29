// ignore_for_file: use_build_context_synchronously

import 'package:airtual_showroom_proj/customer_screens/customers_orders.dart';
import 'package:airtual_showroom_proj/customer_screens/wishlist.dart';
import 'package:airtual_showroom_proj/main_screens/cart.dart';
import 'package:airtual_showroom_proj/widgets/appbar_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/alert_dialog.dart';

class ProfileScreen extends StatefulWidget {
  final String documentId;
  const ProfileScreen({Key? key, required this.documentId}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  CollectionReference anonymous =
      FirebaseFirestore.instance.collection('anonymous');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseAuth.instance.currentUser!.isAnonymous
          ? anonymous.doc(widget.documentId).get()
          : customers.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            /* Text("Full Name: ${data['full_name']} ${data['last_name']}"); */
            backgroundColor: Colors.grey.shade300,
            body: Stack(
              children: [
                Container(
                  height: 230,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.yellow, Colors.brown])),
                ),
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      centerTitle: true,
                      elevation: 0,
                      backgroundColor: Colors.white,
                      expandedHeight: 200,
                      flexibleSpace: LayoutBuilder(
                        builder: ((context, constraints) {
                          return FlexibleSpaceBar(
                            title: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity:
                                  constraints.biggest.height <= 120 ? 1 : 0,
                              child: const Text(
                                'Account',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            background: Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.yellow, Colors.brown])),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 30),
                                child: Row(
                                  children: [
                                    data['profileimage'] == ''
                                        ? const CircleAvatar(
                                            radius: 50,
                                            backgroundImage: AssetImage(
                                                'images/inapp/guest.png'),
                                          )
                                        : CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(
                                                data['profileimage']),
                                            /* const CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          AssetImage('image/inapp/logo.jpg'), */
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Text(
                                        data['name'] == ''
                                            ? 'guest'.toUpperCase()
                                            : data['name'].toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          //1
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40), //
                                      bottomLeft: Radius.circular(40), //
                                    ),
                                  ),
                                  child: TextButton(
                                    child: SizedBox(
                                      height: 60, //
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: const Center(
                                          child: Text(
                                        'Cart',
                                        style: TextStyle(
                                            color: Colors.yellow, fontSize: 20),
                                      )),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CartScreen(
                                                    back: AppBarBackButton(),
                                                  )));
                                    },
                                  ),
                                ),

                                //2
                                Container(
                                  color: Colors.yellow,
                                  child: TextButton(
                                    child: SizedBox(
                                      height: 60, //
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: const Center(
                                          child: Text(
                                        'Orders',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 20),
                                      )),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CustomerOrders()));
                                    },
                                  ),
                                ),

                                //3
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40), //
                                      bottomRight: Radius.circular(40), //
                                    ),
                                  ),
                                  child: TextButton(
                                    child: SizedBox(
                                      height: 60, //
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: const Center(
                                          child: Text(
                                        'Wishlist',
                                        style: TextStyle(
                                            color: Colors.yellow, fontSize: 20),
                                      )),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WishlistScreen()));
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.grey.shade300,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 150,
                                  child: Image(
                                      image:
                                          AssetImage('images/inapp/logo.jpg')),
                                ),
                                const ProfileHeaderLabel(
                                  headerLabel: '  Account Info.  ',
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 250,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      children: [
                                        //1
                                        /*ListTile(title: Text('Email Address'),
                        subtitle: Text('example@email.com'),
                        leading: Icon(Icons.email),
                        ),*/
                                        RepeatedListTile(
                                          title: 'Email Address',
                                          icon: Icons.email,
                                          subTitle: data['email'] == ''
                                              ? 'example@gmail.com'
                                              : data['email'],
                                        ),
                                        const YellowDivider(),

                                        //2
                                        RepeatedListTile(
                                          title: 'Phone Number',
                                          icon: Icons.phone,
                                          subTitle: data['phone'] == ''
                                              ? 'example: +11 123456789'
                                              : data['phone'],
                                        ),
                                        const YellowDivider(),

                                        //3
                                        RepeatedListTile(
                                          title: 'Address',
                                          icon: Icons.location_pin,
                                          subTitle: data['address'] == ''
                                              ? 'example: No.54, Galle street, Colombo'
                                              : data['address'],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const ProfileHeaderLabel(
                                    headerLabel: '  Account Settings  '),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 250,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      children: [
                                        //1
                                        RepeatedListTile(
                                          title: 'Edit Profile',
                                          subTitle: '',
                                          icon: Icons.edit,
                                          onPressed: () {},
                                        ),
                                        const YellowDivider(),

                                        //2
                                        RepeatedListTile(
                                          title: 'Change Password',
                                          icon: Icons.lock,
                                          onPressed: () {},
                                        ),
                                        const YellowDivider(),

                                        //3
                                        RepeatedListTile(
                                          title: 'Log Out',
                                          icon: Icons.logout,
                                          onPressed: () async {
                                            MyAlertDialog.showMyDialog(
                                              //alert dialog box
                                              context: context,
                                              title: 'Log Out',
                                              content:
                                                  'Are you sure to log out?',
                                              tabNo: () {
                                                Navigator.pop(context);
                                              },
                                              tabYes: () async {
                                                await FirebaseAuth.instance
                                                    .signOut();
                                                Navigator.pop(context);
                                                Navigator.pushReplacementNamed(
                                                    context, '/welcome_screen');
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        );
      },
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onPressed;
  const RepeatedListTile(
      {Key? key,
      required this.title,
      required this.icon,
      this.subTitle = '',
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const ProfileHeaderLabel({Key? key, required this.headerLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            headerLabel,
            style: const TextStyle(
                color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
