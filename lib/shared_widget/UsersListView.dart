import 'package:flutter/material.dart';
import 'package:teamx_client/service/userService.dart';
import 'package:teamx_client/shared_widget/UserTile.dart';

class UsersListView extends StatefulWidget {
  @override
  _UsersListViewState createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: UserService.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            print("Get data");
            List<dynamic>? users = snapshot.data;
            //print("##############"+users![0]["name"]);
            return ListView.builder(
              itemCount: users?.length,
              itemBuilder: (context, index) {
                return UserTile(
                  user: users![index] ?? null,
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