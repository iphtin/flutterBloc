import 'package:bloc_project/features/home/models/home_product_data_model.dart';
import 'package:bloc_project/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishListTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishListTileWidget({super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(productDataModel.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20,),
              Column(
                children: [
                  Text(productDataModel.name, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  Text(productDataModel.description, style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  Text("\$ ${productDataModel.price}", style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.redAccent
                  ),),
                ],
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: (){
                  wishlistBloc.add(WishlistRemoveItems(productDataModel: productDataModel));
                },
                icon: Icon(Icons.cancel, color: Colors.redAccent, size: 24,)),
               IconButton(
                onPressed: (){},
                icon: Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 24,)),
            ],
          )

        ],
      ),
    );
  }
}