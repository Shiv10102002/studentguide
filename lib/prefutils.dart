import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<PrefUtils> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return this;
  }

  Future<void> setEmailId(String value) {
    return _sharedPreferences!.setString('emailId', value);
  }

  Future<void> setLoginStatus(bool value) {
    return _sharedPreferences!.setBool('islogin', value);
  }

  bool getLoginStatus() {
    return _sharedPreferences!.getBool('islogin') ?? false;
  }

  Future<void> setRole(String value) {
    return _sharedPreferences!.setString('role', value);
  }

  String getRole() {
    try {
      return _sharedPreferences!.getString('role') ?? '';
    } catch (e) {
      return 'error';
    }
  }

  String getEmailId() {
    try {
      return _sharedPreferences!.getString('emailId') ?? '';
    } catch (e) {
      return 'error';
    }
  }

  Future<void> setUsername(String value) {
    return _sharedPreferences!.setString('username', value);
  }

  String getUsername() {
    try {
      return _sharedPreferences!.getString('username') ?? '';
    } catch (e) {
      return 'error';
    }
  }

  Future<void> setToken(String val) {
    return _sharedPreferences!.setString('token', val);
  }

  String getToken() {
    try {
      return _sharedPreferences!.getString('token') ?? '';
    } catch (e) {
      return 'error';
    }
  }

  // Store summary and image path together as a JSON string in a list
  Future<void> addSummaryAndImagePath(String summary, File imagePath) async {
    List<String> summaryList =
        _sharedPreferences!.getStringList('summaryList') ?? [];

    // Create a JSON object with both summary and imagePath
    Map<String, dynamic> entry = {"summary": summary, "imagePath": imagePath};

    // Add the JSON string to the list
    summaryList.add(jsonEncode(entry));

    // Store the updated list in SharedPreferences
    await _sharedPreferences!.setStringList('summaryList', summaryList);
  }

  // Get the list of summary and image path entries
  List<Map<String, dynamic>> getSummaryList() {
    List<String> summaryList =
        _sharedPreferences!.getStringList('summaryList') ?? [];

    // Decode each JSON string back into a Map
    return summaryList
        .map((item) => Map<String, String>.from(jsonDecode(item)))
        .toList();
  }
}
