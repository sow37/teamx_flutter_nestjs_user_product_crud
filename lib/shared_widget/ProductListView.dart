import 'package:flutter/material.dart';
import 'package:teamx_client/service/productService.dart';
import 'package:teamx_client/service/userService.dart';
import 'package:teamx_client/shared_widget/productTile.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: ProductService.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            print(" Getting data");
            List<dynamic>? products = snapshot.data;
             var taille = products?.length;
            return ListView.builder(
              itemCount: products?.length,
              itemBuilder: (context, index) {
               // print("###############"+ProductService.getProducts()["price"]);
                return ProductTile(
                  product: products![index],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}