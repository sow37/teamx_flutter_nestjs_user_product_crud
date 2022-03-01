
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teamx_client/pages/userDetail.dart';
import 'package:teamx_client/shared_widget/UsersListView.dart';
import 'package:teamx_client/shared_widget/reusable_widget.dart';


class Users extends StatefulWidget {

  const Users({Key? key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {

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
                    const Text("List of users", style: TextStyle(fontSize: 25, color: Colors.white),),
                    GestureDetector(
                      child: const Icon(Icons.person_add, color: Colors.white, size: 40),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserDetails(
                                  iscreate: true,
                                )));
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: UsersListView(),
              )
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar(buttonName: "user",)
    );
  }
}
