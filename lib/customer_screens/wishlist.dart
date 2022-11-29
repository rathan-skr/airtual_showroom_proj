// ignore_for_file: non_constant_identifier_names

import 'package:airtual_showroom_proj/providers/wish_provider.dart';
import 'package:airtual_showroom_proj/widgets/appbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wish_model.dart';
import '../widgets/alert_dialog.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ScaffoldMessenger(
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: const AppBarBackButton(),
              title: const AppBarTitle(
                title: 'Wishlist',
              ),
              actions: [
                context.watch<Wish>().getWishItems.isEmpty
                    ? const SizedBox()
                    : IconButton(
                        onPressed: () {
                          MyAlertDialog.showMyDialog(
                              context: context,
                              title: 'Clear wishlist',
                              content:
                                  'Are you sure to clear wishlist?',
                              tabNo: () {
                                Navigator.pop(context);
                              },
                              tabYes: () {
                                context.read<Wish>().clearWhishlist();
                                Navigator.pop(context);
                              });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                      )
              ],
            ),
            body: context
                    .watch<Wish>()
                    .getWishItems
                    .isNotEmpty //checking whether the cart is empty
                ? const WishItems()
                : const EmptyWishlist(),
          ),
        ),
      ),
    );
  }
}

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Your Wishlist Is Empty !',
          style: TextStyle(fontSize: 30),
        ),
      ],
    ));
  }
}

class WishItems extends StatelessWidget {
  const WishItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Wish>(
      builder: (context, wish, child) {
        return ListView.builder(
            itemCount: wish.count,
            itemBuilder: (context, index) {
              final product = wish.getWishItems[index];
              return WishlistModel(product: product);
            });
      },
    );
  }
}


