import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Apicall {
  static const baseUrl = "http://192.168.02.137:12345";
// Register Api
  Future<Map<String, dynamic>> postRegister(Map data) async {
    String endpoint = "/postClientDetails";

    try {
      Response response = await http.post(Uri.parse("$baseUrl$endpoint"),
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          "StatusCode": {response.statusCode}
        };
      }
    } catch (e) {
      return {"Exception": e};
    }
  }

// login Api
}
