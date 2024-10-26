import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoplite/constants/apilist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoplite/constants/pref_data.dart';
import 'package:shoplite/models/site_setting.dart';

import '../models/profile.dart';

class AuthRepository {
  final String apiUrl = api_login; // URL của API
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      print('REPONSE CODE');
      // print(response.statusCode);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // print(response.body);
        // Giả sử API trả về token trong response
        g_token = data['token']['token'];
        PrefData.setToken(g_token);
        // print(token);
        initialProfile = Profile(
            phone: data['user']['phone'],
            full_name: data['user']['full_name'],
            address: data['user']['address'],
            photo: data['user']['photo'],
            email: data['user']['email'],
            username: data['user']['username']);
        print(initialProfile);
        return true;
        // Lưu token hoặc thực hiện các tác vụ khác tại đây
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }
}
