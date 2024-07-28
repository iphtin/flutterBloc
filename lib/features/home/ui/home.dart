import 'package:bloc_project/features/cart/ui/cart.dart';
import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/home/ui/product_tile_widget.dart';
import 'package:bloc_project/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishList()));
        } else if (state is HomeProductItemCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Is Added To Cart")));
        } else if (state is HomeProductItemWishListActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Is Added To WishList")));
        }
      },
      builder: (context, state) {
         switch (state.runtimeType) {
         case HomeLoadingState:
         return Scaffold(
          body: Center(child: CircularProgressIndicator(),),
         );
        case HomeLoadedSuccessState:
        final successState = state as HomeLoadedSuccessState;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Slice Grocery App", style: TextStyle(color: Colors.white),),
            actions: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeWishListButtonNavigateEvent());
                  },
                  icon: Icon(Icons.favorite_border, size: 24, color: Colors.white,)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeCartButtonNavigateEvent());
                  },
                  icon: Icon(Icons.shopping_bag_outlined, size: 24, color: Colors.white,)),
            ],
          ),
          body: ListView.builder(
            itemCount: successState.products.length,
            itemBuilder: (context, index) {
            return ProductTileWidget(productDataModel: successState.products[index], homeBloc: homeBloc,);
          }),
        );
        case HomeErrorState:
        return Scaffold(
          body: Center(child: Text("Error"),),
        );
         default:
         return SizedBox();
       }
      },
    );
  }
}
