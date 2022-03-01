import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teamx_client/constant/constant.dart';

class ProductService {
  static Future<List<dynamic>> getProducts() async {
    final response = await http.get(
        Uri.parse(URL+'products'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

       //print("###############"+body[0]['name']);
      return body;
    } else {
      print("################## No Data ###################");
      throw "Unable to retrieve product.";
    }
  }

  static Future<dynamic> addProduct(body) async {
    final response = await http.post(Uri.parse(URL+'products/'), body: body);
    if (response.statusCode == 200) {
      // List<dynamic> body = jsonDecode(response.body);
      print("#################### from Service Added ####################");
      return true;
    } else {
      print("#################### from Service Failed ####################");
      throw "Unable to add product.";
    }
  }

  static Future<dynamic> update(body,id) async {
    final response = await http.patch(Uri.parse(URL+'products/'+id), body: body);
    if (response.statusCode == 200) {
      // List<dynamic> body = jsonDecode(response.body);

      return true;
    } else {
      throw "Unable to update product.";
    }
  }
  static Future<dynamic> delete(id) async {
    final response = await http.delete(Uri.parse(URL+'products/'+id));
    if (response.statusCode == 200) {
      // List<dynamic> body = jsonDecode(response.body);

      return true;
    } else {
      throw "Unable to delete product.";
    }
  }
}