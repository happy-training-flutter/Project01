import 'package:flutter/material.dart';

class Productcard extends StatelessWidget {
  final String image;
  final String price;
  final String product;

  Productcard({ required this.image, required this.product, required this.price});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(image),
        Padding(
            padding: EdgeInsetsGeometry.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product),
                Text(price)
              ],
            ),
        )
      ],
    );
  }
}
