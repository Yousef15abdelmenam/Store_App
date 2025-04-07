import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage();

  static final id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, image, description, price;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Update Product'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  CustomTextField(
                    hintText: 'Product Name',
                    onchanged: (data) {
                      productName = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Description',
                    onchanged: (data) {
                      description = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Price ',
                    textInputType: TextInputType.number,
                    onchanged: (data) {
                      price = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Image',
                    onchanged: (data) {
                      image = data;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    text: 'Update',
                    ontap: () async{
                      isLoading = true;
                      setState(() {});
                     await updateProduct(product);
                      try {
                      
                        print('success');
                      } catch (e) {
                        print(e.toString());
                      }

                      isLoading = false;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }

    Future <void> updateProduct(ProductModel product) async{
    await UpdateProductService().updateProduct(
      id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
