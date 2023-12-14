import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/data/wishlist_items.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cart_event.dart';

import 'package:flutter_bloc_project/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_project/features/home/bloc/home_event.dart';

import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc_project/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_project/features/wishlist/bloc/wishlist_event.dart';

import '../../../data/cart_item.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  const ProductTileWidget({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    final WishlistBloc wishlistBloc = WishlistBloc();
    final CartBloc cartBloc = CartBloc();

    bool isExistWishlist = wishlistItems.contains(productDataModel);
    bool isExistCart = cartItems.contains(productDataModel);

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(productDataModel.imageUrl),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(productDataModel.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        Text(productDataModel.description),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${productDataModel.price}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (isExistWishlist) {
                      wishlistBloc.add(
                        RemoveFromWishlistEvent(
                          productDataModel: productDataModel,
                        ),
                      );
                      
                    } else {
                      homeBloc.add(
                        HomeProductWishlistButtonClickedEvent(
                          clickedProduct: productDataModel,
                        ),
                      );
                    }
                    homeBloc.add(HomeProductResetEvent());
                  },
                  icon: Icon(
                    isExistWishlist ? Icons.favorite : Icons.favorite_border,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (isExistCart) {
                      cartBloc.add(
                        CartRemoveFromCartEvent(
                            productDataModel: productDataModel),
                      );
                    } else {
                      homeBloc.add(
                        HomeProductCartButtonClickedEvent(
                            clickedProduct: productDataModel),
                      );
                    }
                    homeBloc.add(HomeProductResetEvent());
                  },
                  icon: Icon(
                    isExistCart
                        ? Icons.shopping_bag
                        : Icons.shopping_bag_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
