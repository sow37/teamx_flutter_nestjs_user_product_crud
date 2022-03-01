import 'package:flutter/material.dart';
import 'package:teamx_client/pages/ProductDetail.dart';
import 'package:teamx_client/pages/userDetail.dart';
import 'package:teamx_client/pages/users.dart';
import 'package:teamx_client/service/productService.dart';
import 'package:teamx_client/service/userService.dart';

class ProductTile extends StatelessWidget {
  final product;

  const ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Card(
              elevation: 2.0,
              margin: const EdgeInsets.fromLTRB(20, 6, 5, 0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                              iscreate: false,
                              productId: product["_id"],
                              name: product["name"],
                              price: product["price"],
                              image: product["image"],
                              quantity: product["quantity"],)));
                },
                leading: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/avatar.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  product["name"],
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  product["price"],
                  style: const TextStyle(fontSize: 15),
                ),


              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
                elevation: 2.0,
                child: Container(
                    padding: EdgeInsets.all(5),
                    height: 70,
                    width: 40,
                    child: GestureDetector(
                      child: const Icon(Icons.delete, color: Colors.red,),
                      onTap: (){
                        showDialog<String>(
                          builder: (context) => AlertDialog(
                            title: const Text('Alert'),
                            content: const Text('Do you want to delete this product'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  ProductService.delete(product["_id"]).then((success) {
                                    if (success) {
                                      print("################# success ################");
                                      showDialog<String>(
                                        builder: (context) => AlertDialog(
                                          title: const Text('Success'),
                                          content: const Text('Product has been deleted!!!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('OK'),
                                            )
                                          ],
                                        ),
                                        context: context,
                                      );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const Users()));
                                    } else {
                                      print("################# Failled ################");
                                      showDialog<String>(
                                        builder: (context) => AlertDialog(
                                          title: const Text('Failled!!!'),
                                          content: const Text('Error adding Product!!!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('OK'),
                                            )
                                          ],
                                        ),
                                        context: context,
                                      );
                                      return;
                                    }
                                  });
                                },
                                child: const Text('Delete'),
                              )
                            ],
                          ),
                          context: context,
                        );
                      },
                    ))),
          )
        ],
      ),
    );
  }
}