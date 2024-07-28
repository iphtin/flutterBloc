import 'package:bloc_project/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_project/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }
  final WishlistBloc wishlistBloc = WishlistBloc();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 28,
        ),
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text(
          "WishList",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.favorite,
              size: 24,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
         listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is !WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
            final successState = state as WishlistSuccessState;
            return ListView.builder(
            itemCount: successState.wishlistItems.length,
            itemBuilder: (context, index) {
            return WishListTileWidget(productDataModel: successState.wishlistItems[index], wishlistBloc: wishlistBloc);
          });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
