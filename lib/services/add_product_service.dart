import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class AddProductService {
  Future<ProductModel> addProduct(
      {required String title,
      required double price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });

    return ProductModel.fromjson(data);
  }
}
