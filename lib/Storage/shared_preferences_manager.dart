import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class SharedPreferencesManager {
  //saveName
  Future<void> saveName({required String key, required dynamic value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value).catchError((error) {
      print(error.message);
    });
  }

  //saveEmail
  Future<void> saveEmail({required String key, required dynamic value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value).catchError((error) {
      print(error.message);
    });
  }

  //savePassword
  Future<void> savePassword(
      {required String key, required dynamic value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value).catchError((error) {
      print(error.message);
    });
  }

  //getData
  Future<String?> getData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? result = prefs.getString(key);
    return result;
  }

  //getName
  //getEmail
  //getPassword
}
