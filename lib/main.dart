import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teamx_client/pages/home.dart';
import 'package:teamx_client/pages/products.dart';
import 'package:teamx_client/pages/splashScreen.dart';
import 'package:teamx_client/pages/users.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.white70),
        home: const SplashScreen()
    );
  }

}