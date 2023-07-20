// ignore: non_constant_identifier_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
String LOGIN_KEY = "5FD6G46SDF4GD64F1VG9SD68";
// ignore: non_constant_identifier_names
String ONBOARD_KEY = "GD2G82CG9G82VDFGVD22DVG";

class AppService with ChangeNotifier {
  late final SharedPreferences sharedPreferences;
  final StreamController<bool> _loginStateChange = StreamController<bool>.broadcast();
  bool _loginState = false;
  bool _initialized = false;
  bool _onboarded = false;

  AppService(this.sharedPreferences);
  
  bool get loginState => _loginState;
  bool get initialized => _initialized;
  bool get onboarded => _onboarded;
  Stream<bool> get loginStateChange => _loginStateChange.stream;

  set loginState(bool value) {
    _loginState = value;
    _loginStateChange.add(value);
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set onboarded(bool value) {
    _onboarded = value;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    _onboarded = sharedPreferences.getBool(ONBOARD_KEY) ?? true;
    _loginState = sharedPreferences.getBool(LOGIN_KEY) ?? false;
    
    var url = Uri.parse('${dotenv.get('API_URL')}/api/ping');
    try {
      final response = await http.get(url);
      print("Server is running: ${response.statusCode}");
    } catch (e) {
      print("No response from server: $e");
      // TODO: Handle no response from server (show error message)
    } 

    _initialized = true;
    notifyListeners();
  }
}