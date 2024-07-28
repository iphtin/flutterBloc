part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveItem extends CartEvent {
  final ProductDataModel productDataModel;

  CartRemoveItem({required this.productDataModel});
}
