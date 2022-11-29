// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:airtual_showroom_proj/widgets/alert_dialog.dart';
import 'package:airtual_showroom_proj/widgets/appbar_widgets.dart';
import 'package:flutter/material.dart';
import '../minor_screens/place_order.dart';
import '../models/cart_model.dart';
import '../providers/cart_provider.dart';
import '../widgets/yellow_button.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({Key? key, this.back}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double total = context.watch<Cart>().totalPrice;
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: widget.back,
            title: const AppBarTitle(
              title: 'Cart',
            ),
            actions: [
              context.watch<Cart>().getItems.isEmpty
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        MyAlertDialog.showMyDialog(
                            context: context,
                            title: 'Clear Cart',
                            content:
                                'Are you sure to clear all items in the cart?',
                            tabNo: () {
                              Navigator.pop(context);
                            },
                            tabYes: () {
                              context.read<Cart>().clearCart();
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
                  .watch<Cart>()
                  .getItems
                  .isNotEmpty //checking whether the cart is empty
              ? const CartItems()
              : const EmptyCart(),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Total: Rs. ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      total.toStringAsFixed(2),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(25)),
                  child: MaterialButton(
                    onPressed: total == 0.0
                        ? null
                        : () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PlaceOrderScreen()));
                          },
                    child: const Text('CHECK OUT'),
                  ),
                ),
                /* YellowButton(
                  width: 0.45,
                  label: 'CHECK OUT',
                  onPressed: total == 0.0 ? null  () {
                    print('place order');
                  },
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Your Cart Is Empty !',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 50,
        ),
        Material(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(25),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width * 0.6,
              onPressed: () {
                Navigator.canPop(context)
                    ? Navigator.pop(context)
                    : Navigator.pushReplacementNamed(context, '/customer_home');
              },
              child: const Text(
                'Continue Shopping',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ))
      ],
    ));
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return ListView.builder(
            itemCount: cart.count,
            itemBuilder: (context, index) {
              final product = cart.getItems[index];
              return CartModel(
                product: product,
                cart: cart,
              );

              /// cart:cart---> here we can use 'context.read<Cart>()' instead of cart...if any problem occurs
            });
      },
    );
  }
}
