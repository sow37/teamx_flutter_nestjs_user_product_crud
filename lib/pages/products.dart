
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teamx_client/pages/ProductDetail.dart';
import 'package:teamx_client/pages/userDetail.dart';
import 'package:teamx_client/shared_widget/ProductListView.dart';
import 'package:teamx_client/shared_widget/UsersListView.dart';
import 'package:teamx_client/shared_widget/reusable_widget.dart';


class Products extends StatefulWidget {

  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: 80.0,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.green),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    const Text("List of Products", style: TextStyle(fontSize: 25, color: Colors.white),),
                    GestureDetector(
                      child: const Icon(Icons.person_add, color: Colors.white, size: 40),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductDetails(
                                  iscreate: true,
                                )));
                      },
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: ProductListView(),
              )
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar(buttonName: "product",)
    );
  }
}
