import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:sisconsultas/features/auth/data/services/auth_api_service.dart';

class AuthProvider with ChangeNotifier {
  final _storage = FlutterSecureStorage();
  final AuthApiService _api = AuthApiService();

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
    final response = await _api.login(username, password);

    if (response != null && response.success) {

      final user = response.user!;

      _token = user.token;
      _username = user.nombres;

      await _storeTokenAndUsername(user.token, user.nombres);

      notifyListeners();

      return true;
    }

    return false;
  }

  Future<void> logout() async {
    await _clearTokenAndUsername();
    _token = null;
    _username = null;
    notifyListeners();    
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
