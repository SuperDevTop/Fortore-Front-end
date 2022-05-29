import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'membershipdata.dart';

class MembershipGet {
  Future<List<MembershipInfo>> fetchDatas(int amount) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    Uri uri = Uri.parse("http://flutter.laravel.batektower.com/api/user_plan");

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      Map membershipData = jsonDecode(response.body);
      List<dynamic> membershipdatas = membershipData["data"];
      return membershipdatas.map((json) => MembershipInfo.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}