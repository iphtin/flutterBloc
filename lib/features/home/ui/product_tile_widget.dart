import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(productDataModel.imageUrl), fit: BoxFit.cover)
          ),
        ),
        SizedBox(height: 20,),
        Text(productDataModel.name, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
        SizedBox(height: 10,),
        Text(productDataModel.description, style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$ ${productDataModel.price.toString()}", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.deepOrange
            ),),
            Row(children: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishListButtonClickedEvent(clickedProduct: productDataModel));
                  },
                  icon: Icon(Icons.favorite_border, size: 24, color: Colors.black,)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                  },
                  icon: Icon(Icons.shopping_bag_outlined, size: 24, color: Colors.black,)),
            ],)
          ],
        ),
      ],),
    );
  }
}