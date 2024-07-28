import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/cart_item.dart';
import 'package:bloc_project/data/grocery_data.dart';
import 'package:bloc_project/data/wishlist_item.dart';
import 'package:bloc_project/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.products.map((e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            description: e['category'],
            imageUrl: e['imageUrl'],
            price: e['price'])).toList()));
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Product clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartActionState());
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Product Clicked");
    wishLisItems.add(event.clickedProduct);
    emit(HomeProductItemWishListActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Navigate Clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Wishlist Navigate Clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }
}
