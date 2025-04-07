import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productslist = [];

    for (int i = 0; i < data.length; i++) {
      productslist.add(ProductModel.fromjson(data[i]));
    }

    return productslist;
  }
}
