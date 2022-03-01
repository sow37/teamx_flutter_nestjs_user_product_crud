import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teamx_client/constant/constant.dart';

class UserService {
  static Future<List<dynamic>> getUsers() async {
    final response = await http.get(
        Uri.parse(URL+'users'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      // print(body[1]['firstname']);
      // List<User> users = body.map(
      //       (dynamic item) => User.fromJson(item),
      // ).toList();
      // print(users[0].firstname);
      return body;
    } else {
      print("################## No Data ###################");
      throw "Unable to retrieve users.";
    }
  }

  static Future<dynamic> addUser(body) async {
    final response = await http.post(Uri.parse(URL+'users/'), body: body);
    if (response.statusCode == 200) {
      // List<dynamic> body = jsonDecode(response.body);
    print("#################### from Service Added ####################");
      return true;
    } else {
      print("#################### from Service Failed ####################");
      throw "Unable to add User.";
    }
  }

  static Future<dynamic> update(body,id) async {
    final response = await http.patch(Uri.parse(URL+'users/'+id), body: body);
    if (response.statusCode == 200) {
      // List<dynamic> body = jsonDecode(response.body);

      return true;
    } else {
      throw "Unable to update User.";
    }
  }
  static Future<dynamic> delete(id) async {
    final response = await http.delete(Uri.parse(URL+'users/'+id));
    if (response.statusCode == 200) {
      // List<dynamic> body = jsonDecode(response.body);

      return true;
    } else {
      throw "Unable to delete User.";
    }
  }
}