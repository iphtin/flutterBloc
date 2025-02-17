import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/cart_item.dart';
import 'package:bloc_project/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveItem>(cartRemoveItem);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveItem(
      CartRemoveItem event, Emitter<CartState> emit) {
        cartItems.remove(event.productDataModel);
        emit(CartSuccessState(cartItems: cartItems));
      }
}
