import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  //******** All Setter Methods. */
  static Future<bool> setBooleanValue(String keyName, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(keyName, value);
  }

  static Future<bool> setIntegerValue(String keyName, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(keyName, value);
  }

  static Future<bool> setDoubleValue(String keyName, double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(keyName, value);
  }

  static Future<bool> setStringValue(String keyName, String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyName, value!);
  }

  static Future<bool> setStringList(String keyName, List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(keyName, value);
  }

  //**************** All Getter Methods. */
  static Future<Set<String>> getAllKeys() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
  }

  static Future<dynamic> getSpecificKeyVal(String keyName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(keyName) ?? 'NA';
  }

  static Future<bool> getBoolValue(String keyName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyName) ?? false;
  }

  static Future<int?> getIntValue(String keyName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(keyName);
  }

  static Future<double?> getDoubleValue(String keyName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(keyName);
  }

  static Future<String?> getStringValue(String keyName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyName);
  }

  static Future<List<String>> getStringList(String keyName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(keyName) ?? [];
  }

  //*************** All Removal Methods. */
  static Future<bool> removeOneValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<bool> clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  //************************ Save Serialized Objects */
  static Future<dynamic> read(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) != null
        ? jsonDecode(prefs.getString(key)!)
        : null;
    // return jsonDecode(prefs.getString(key));
  }

  // static Future<List<SearchBar>> readData(String key) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(key) != null ? jsonDecode(prefs.getString(key)) : null;
  //   // return jsonDecode(prefs.getString(key));
  // }

  static Future<bool> save(String key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Locale being saved $key,$value");
    return prefs.setString(key, json.encode(value));
  }

  static Future<bool> saveObject(String key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  Future<dynamic> readObj(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) != null
        ? jsonDecode(prefs.getString(key)!)
        : null;
    // return jsonDecode(prefs.getString(key));
  }
}
