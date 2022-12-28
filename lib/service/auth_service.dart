import 'dart:convert';

import 'package:flutter_getjadwal/config/api.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<Map> login({
    required String email,
  }) async {
    Uri url = Uri.parse(Api.checkin);
    Map body = {"email": email};
    var headers = {"Content-Type": "application/json"};
    var response = await http.post(
      url,
      body: jsonEncode(body),
      headers: headers,
    );
    Map responseData = jsonDecode(response.body);
    return responseData;
  }
}
