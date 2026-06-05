import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:sisconsultas/features/auth/data/services/auth_api_service.dart';

enum AuthStatus { loading, notAutenticated, autenticated }

class AuthProvider with ChangeNotifier {
  final _storage = FlutterSecureStorage();
  final AuthApiService _api = AuthApiService();
  String? _token;
  String? username;

  bool isLoginLoading = false;

  AuthStatus status = AuthStatus.loading;

  Future<void> checkLogin() async {
    _token = await _storage.read(key: 'token');
    username = await _storage.read(key: 'username');
    if (_token != null && username != null) {
      status = AuthStatus.autenticated;
    } else {
      status = AuthStatus.notAutenticated;
    }
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    isLoginLoading = true;
    notifyListeners();
    try {
      final response = await _api.login(username, password);
      if (response == null || !response.success) {
        return false;
      }

      final user = response.user!;

      _token = user.token;
      this.username = user.nombres;     

      await _storage.write(key: 'token', value: _token);
      await _storage.write(key: 'username', value: username);
      status = AuthStatus.autenticated;      
      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isLoginLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'username');
    status = AuthStatus.notAutenticated;
    notifyListeners();
  }
}
