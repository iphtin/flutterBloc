import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/wishlist_item.dart';
import 'package:bloc_project/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveItems>(wishlistRemoveItems);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishLisItems));
  }

  FutureOr<void> wishlistRemoveItems(WishlistRemoveItems event, Emitter<WishlistState> emit) {
    wishLisItems.remove(event.productDataModel);
    emit(WishlistSuccessState(wishlistItems: wishLisItems));
  }
}
