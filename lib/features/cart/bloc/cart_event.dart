


import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';

abstract class CartEvent{}

class CartInitialEvent extends CartEvent{}

class CartRemoveFromCartEvent extends CartEvent{
  final ProductDataModel productDataModel;
  CartRemoveFromCartEvent({
    required this.productDataModel,
  });
}