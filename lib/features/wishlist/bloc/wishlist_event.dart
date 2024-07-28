part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveItems extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistRemoveItems({required this.productDataModel});
}
