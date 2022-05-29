import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'interestdata.dart';

class MyInterestLog {
  Future<List<InterestData>> fetchDatas(int amount) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userId = localStorage.getInt('userid');
    var data = {
      'id': userId,
    };

    Uri uri = Uri.parse("http://flutter.laravel.batektower.com/api/interest_log" + "/" + userId.toString());

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      Map interestData = jsonDecode(response.body);
      List<dynamic> interestdatas = interestData["logs"];

      return interestdatas.map((json) => InterestData.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}