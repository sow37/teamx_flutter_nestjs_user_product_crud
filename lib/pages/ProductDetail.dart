import 'package:flutter/material.dart';
import 'package:teamx_client/pages/users.dart';
import 'package:teamx_client/service/productService.dart';
import 'package:teamx_client/service/userService.dart';

class ProductDetails extends StatefulWidget {
  final productId;
  final name;
  final price;
  final quantity;
  final image;
  final iscreate;

  const ProductDetails(
      {Key? key, this.productId, this.name, this.price, this.quantity, this.image, required this.iscreate})
      : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool loginFail = false;
  var nameCont = TextEditingController();
  var priceCont = TextEditingController();
  var quantityCont = TextEditingController();
  var imageCont = TextEditingController();
  var  label;

  @override
  Widget build(BuildContext context) {
    if(!widget.iscreate){
      nameCont.text = widget.name;
      priceCont.text = widget.price;
      quantityCont.text = widget.quantity;
      imageCont.text = widget.image;
      label = "UPDATE";
    }else{
      label = "ADD";
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Icon(Icons.person, color: Colors.grey, size: 200,),
              ),
              Divider(
                color: Colors.grey[800],
                height: 60.0,
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: nameCont,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entrer Product name',
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  labelText: 'name',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  errorText: loginFail ? 'please enter product name' : null,
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: priceCont,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entrer product price',
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  labelText: 'Price',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  errorText: loginFail ? 'please enter product price' : null,
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: quantityCont,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entrer product quantity',
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  labelText: 'Quantity',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  errorText: loginFail ? 'please enter product quantity' : null,
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
        onPressed: () {
          if(widget.iscreate){
            final body = {
              "image": "unknown",
              "quantity": quantityCont.text,
              "price": priceCont.text,
              "name": nameCont.text,
            };
            ProductService.addProduct(body).then((success) {
              if (success) {
                print("################# success ################");
                showDialog<String>(
                  builder: (context) => AlertDialog(
                    title: const Text('Success'),
                    content: const Text('Product has been added!!!'),
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
          }else{
            final body = {
              "_id": widget.productId,
              "image": "unknown",
              "quantity": quantityCont.text,
              "price": priceCont.text,
              "name": nameCont.text,
            };
            ProductService.update(body,widget.productId).then((success) {
              if (success) {
                print("################# success ################");
                showDialog<String>(
                    builder: (context) => AlertDialog(
                      title: const Text('Status'),
                      content: const Text('Product has been updated!!!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        )
                      ],
                    ),
                    context: context);
              } else {
                print("################# Failled ################");
                showDialog<String>(
                  builder: (context) => AlertDialog(
                    title: const Text('Status!!!'),
                    content: const Text('Error updating product!!!'),
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
          }

        },
        child: SizedBox(
          height: 60,
          child:  Center(
              child: Text(
                '$label',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              )),
        ),
      ),
    );
  }
}
