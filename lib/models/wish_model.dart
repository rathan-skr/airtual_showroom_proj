// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/product_class.dart';
import '../providers/wish_provider.dart';
import 'package:collection/collection.dart';

class WishlistModel extends StatelessWidget {
  const WishlistModel({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              SizedBox(
                  height: 100,
                  width: 120,
                  child: Image.network(product.imagesUrl.first)),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700]),
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rs.${product.price //33:00 vid 5
                                .toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read<Wish>()
                                        .removeItem(product);
                                  },
                                  icon: const Icon(
                                      Icons.delete_forever)),
                              const SizedBox(height: 10),
                              context
                                          .watch<Cart>()
                                          .getItems
                                          .firstWhereOrNull(
                                              (element) =>
                                                  element
                                                      .documentId ==
                                                  product
                                                      .documentId) !=
                                      null
                                  ? const SizedBox()
                                  : IconButton(
                                      onPressed: () {                                                                                                   context.read<Cart>().addItem(
                                            product.name,
                                            product.price,
                                            1,
                                            product.qntty,
                                            product.imagesUrl,
                                            product.documentId,
                                            product.suppId);
                                      },
                                      icon: const Icon(
                                          Icons.add_shopping_cart)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}