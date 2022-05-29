import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'depositdata.dart';

class DepositHistoryGet {
  Future<List<DepositData>> fetchDatas(int amount) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');
    var data = {
      'id': userId,
    };

    Uri uri = Uri.parse("http://flutter.laravel.batektower.com/api/depositHistory" + "/" + userId.toString());

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      Map depositData = jsonDecode(response.body);
      List<dynamic> depositdatas = depositData["data"];
      return depositdatas.map((json) => DepositData.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}