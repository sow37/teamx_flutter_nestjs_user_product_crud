import 'package:flutter/material.dart';
import 'package:teamx_client/constant/constant.dart';
import 'package:teamx_client/service/productService.dart';
import 'package:teamx_client/service/userService.dart';
import 'package:teamx_client/shared_widget/reusable_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var nbuser;
  var nbproduct;
  @override
  void initState() {
    super.initState();
    // nbuser = UserService.getUsers().then((value) => value.length);
    // var res = ProductService.getProducts();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(children:   [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 25),
                      child: Text(
                        'Tableau de bord',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  const [
                        CounterBox(label: "Users", value: 50),
                        CounterBox(label: "Product", value: 23),
                      ],
                    )
                  ],),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 12),
                    child: Text(
                      'Popular Product',
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,)
                ),
                Container(
                  height: 130.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      ProductItem(Icons.tv,'TV'),
                      ProductItem(Icons.phone, 'Phone'),
                      ProductItem(Icons.computer,'Computer'),
                      ProductItem(Icons.album,'Album'),
                      ProductItem(Icons.car_rental,'Car'),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomBar(buttonName: "home"));
  }
}
