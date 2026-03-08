import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final _storage = FlutterSecureStorage();

  String? _token;
  String? _username;

  String? get token => _token;
  String? get username => _username;

  Future<void> _storeTokenAndUsername(String token, String username) async {
    await _storage.write(key: 'token', value: token);
    await _storage.write(key: 'username', value: username);
  }

  Future<void> _clearTokenAndUsername() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'username');
  }

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://api.example.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      await _storeTokenAndUsername(token, username);
      _token = token;
      _username = username;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> logout() async {
    await _clearTokenAndUsername();
    _token = null;
    _username = null;
    notifyListeners();
    return true;
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');
    final username = await _storage.read(key: 'username');
    if (token != null && username != null) {
      _token = token;
      _username = username;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
