// ignore: file_names
import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String prefName = "com.example.shopping";

  static String introAvailable = prefName + "isIntroAvailable";
  static String isLoggedIn = prefName + "isLoggedIn";
  static String token = prefName + "token";
  static Future<SharedPreferences> getPrefInstance() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  static Future<bool> isIntroAvailable() async {
    SharedPreferences preferences = await getPrefInstance();
    bool isIntroAvailable = preferences.getBool(introAvailable) ?? true;
    return isIntroAvailable;
  }

  static setIntroAvailable(bool avail) async {
    SharedPreferences preferences = await getPrefInstance();
    preferences.setBool(introAvailable, avail);
  }

  static setLogIn(bool avail) async {
    SharedPreferences preferences = await getPrefInstance();
    preferences.setBool(isLoggedIn, avail);
  }

  static Future<bool> isLogIn() async {
    SharedPreferences preferences = await getPrefInstance();
    bool isIntroAvailable = preferences.getBool(isLoggedIn) ?? false;
    return isIntroAvailable;
  }

  //dinh nghi luu tru token
  static setToken(String mtoken) async {
    SharedPreferences preferences = await getPrefInstance();
    preferences.setString(token, mtoken);
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await getPrefInstance();
    String tokenvalue = preferences.getString(token) ?? '';
    return tokenvalue;
  }
}
