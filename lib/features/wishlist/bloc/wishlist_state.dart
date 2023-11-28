// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';

abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState{}

class WishlistInitialState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistItems;
  WishlistSuccessState({
    required this.wishlistItems,
  });
  
}
