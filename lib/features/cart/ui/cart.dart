import 'package:bloc_project/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_project/features/cart/ui/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: Colors.white, size: 28,),
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text("Cart items", style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
            final successState = state as CartSuccessState;
            return ListView.builder(
            itemCount: successState.cartItems.length,
            itemBuilder: (context, index) {
            return CartTileWidget(productDataModel: successState.cartItems[index], cartBloc: cartBloc);
          });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
