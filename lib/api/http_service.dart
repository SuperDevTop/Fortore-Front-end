import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';

class PersonNetworkService {
  Future<List<Data>> fetchDatas(int amount) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');
    var data = {
      'id': userId,
    };

    Uri uri = Uri.parse("http://flutter.laravel.batektower.com/api/transaction_deposit" + "/" + userId.toString());
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      Map transactionData = jsonDecode(response.body);
      List<dynamic> datas = transactionData["transactions"];
      return datas.map((json) => Data.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}