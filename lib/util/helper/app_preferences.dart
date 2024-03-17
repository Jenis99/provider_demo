import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static late SharedPreferences _prefs;
  static String reviewTimer = 'reviewTimer';
  static String todayDate = 'todayDate';

  static Future initMySharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void clearSharedPreferences() {
    _prefs.clear();
    return;
  }

  static Future setTodayDate(String value) async {
    await _prefs.setString(todayDate, value);
  }

  static String getTodayDate() {
    final String? value = _prefs.getString(todayDate);
    return value ?? "";
  }

  static Future setReviewTimer(int value) async {
    await _prefs.setInt(reviewTimer, value);
  }

  static int getReviewTimer() {
    return _prefs.getInt(reviewTimer) ?? 0;
  }

  static Future setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String getString(String key) {
    final String? value = _prefs.getString(key);
    return value ?? "";
  }

  static String getCurrentThemeString(String key) {
    final String? value = _prefs.getString(key);
    return value ?? "Light";
  }

  static String firstTimeOpen = 'isFirstTimeOpen';

  Future setFirstTimeOpen(bool value) async {
    print("setPreference-->$value");
    await _prefs.setBool(firstTimeOpen, value);
  }

  bool getFirstTimeOpen() {
    print("getPreference-->${_prefs.getBool(firstTimeOpen)}");
    return _prefs.getBool(firstTimeOpen) ?? false;
  }

  static Future setBoolean(String key, {required bool value}) async {
    await _prefs.setBool(key, value);
  }

  static bool getSubscribeToTopicBoolean(String key) {
    final bool? value = _prefs.getBool(key);
    return value ?? true;
  }

  static Future setIsSwichedBoolean(String key, {required bool value}) async {
    await _prefs.setBool(key, value);
  }

  static Future<bool> getTheme() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool("theme") ?? true;
    // return ;
  }

  static bool getBoolean(String key) {
    final bool? value = _prefs.getBool(key);
    return value ?? false;
  }
  static bool getFirstTimeBoolean(String key) {
    final bool? value = _prefs.getBool(key);
    return value ?? true;
  }

  static bool getSpeechMuteBoolean(String key) {
    final bool? value = _prefs.getBool(key);
    return value ?? true;
  }

  static bool getCurrentThemeBoolean(String key) {
    final bool? value = _prefs.getBool(key);
    return value ?? true;
  }

  static Future setLong(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  static double getLong(String key) {
    final double? value = _prefs.getDouble(key);
    return value ?? 0.0;
  }

  static Future setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  static int getInt(String key) {
    final int? value = _prefs.getInt(key);
    return value ?? 0;
  }

  // static Future setUserToken(String token) async {
  //   await _prefs.setString(Constants.keyToken, token);
  // }

  static Future setMatchesList(String key, List<String> matchId) async {
    await _prefs.setStringList(key, matchId);
  }

  static Future setOnBoardingList(String key, List<String> onBoarding) async {
    await _prefs.setStringList(key, onBoarding);
  }

  // static String? getUserToken() {
  //   return _prefs.get(Constants.keyToken) as String?;
  // }

  static List<String>? getMatchesList(String key) {
    return _prefs.getStringList(key);
  }

  static List<String>? getOnBoardingList(String key) {
    return _prefs.getStringList(key);
  }

  // static bool isUserLogin() {
  //   final String? getToken = getUserToken();
  //   return getToken != null && getToken.isNotEmpty;
  // }

  ///show case
  static String homeShowCase = 'homeShowCase';

  static Future setHomeShowCase(bool value) async {
    print("homeShowCase-->$value");
    await _prefs.setBool(homeShowCase, value);
  }

  static bool getHomeShowCase() {
    return _prefs.getBool(homeShowCase) ?? false;
  }

  static Future setShowCase({required String key, required bool value}) async {
    await _prefs.setBool(key, value);
  }

  static bool getShowCase({required String key}) {
    return _prefs.getBool(key) ?? false;
  }
}
