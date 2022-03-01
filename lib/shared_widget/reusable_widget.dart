import 'package:flutter/material.dart';
import 'package:teamx_client/pages/home.dart';
import 'package:teamx_client/pages/products.dart';
import 'package:teamx_client/pages/users.dart';

// ********SharedBottomItem***********
class SharedBottomItem extends StatelessWidget {
  final IconData iconData;
  final Function onTap;
  final Color color;

  const SharedBottomItem({
    Key? key,
    required this.color,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap(), child: Icon(iconData, color: color, size: 30));
  }
}

class BottomBar extends StatelessWidget {
  final String buttonName;
  const BottomBar({
    Key? key,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color activeColor = Colors.green;
    Color inactiveColor = Colors.black;
    return Card(
      elevation: 4.0,
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Products()));
                    },
                    child:  Icon(Icons.shop,
                        color: buttonName == "product" ? activeColor:inactiveColor, size: 30))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Icon(Icons.home, color: buttonName == "home" ? activeColor:inactiveColor, size: 30))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Users()));
                    },
                    child:  Icon(Icons.person, color: buttonName == "user" ? activeColor:inactiveColor, size: 30))),
          ],
        ),
      ),
    );
  }
}

// ########## CounterBox ###############
class CounterBox extends StatelessWidget {
  final String? label;
  final int? value;
  const CounterBox({
    Key? key,
      this.label,
      this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color activeColor = Colors.green;
    Color inactiveColor = Colors.black;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [
        Text(label!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
        Text("$value", style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w900, color: Colors.white),)
      ],);
  }
}

// ################### ProductItem #########################

class ProductItem extends StatelessWidget {
  final IconData iconData;
  final String image_caption;

  const ProductItem(this.iconData, this.image_caption);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title:  Icon(iconData,size: 50, color: Colors.green,),
            subtitle: Container(
                alignment: Alignment.topCenter, child: Text(image_caption)),
          ),
        ),
      ),
    );
  }
}




