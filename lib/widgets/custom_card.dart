import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_product_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product});

  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(10, 10))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 1),
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$2' '${product.price.toString()}',
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: -60,
              right: 32,
              child: Image.network(
                product.image,
                height: 100,
                width: 100,
              ))
        ],
      ),
    );
  }
}
