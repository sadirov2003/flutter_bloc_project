// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';

abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class RemoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel productDataModel;
  RemoveFromWishlistEvent({
    required this.productDataModel,
  });
  
}
