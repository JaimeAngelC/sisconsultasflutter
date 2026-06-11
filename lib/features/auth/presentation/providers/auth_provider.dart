import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:sisconsultas/features/auth/data/services/auth_api_service.dart';

enum AuthStatus { loading, notAutenticated, autenticated }

class AuthProvider with ChangeNotifier {
  final _storage = FlutterSecureStorage();
  final AuthApiService _api = AuthApiService();
  String? _token;
  String? username;
  String? email;
  String? idUsuario;

  bool isLoginLoading = false;

  AuthStatus status = AuthStatus.loading;

  Future<void> checkLogin() async {
    _token = await _storage.read(key: 'token');
    username = await _storage.read(key: 'username');  
    email = await _storage.read(key: 'email');  
    idUsuario = await _storage.read(key: 'idUsuario');

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
      email = user.email;  
      idUsuario = user.idPersona;   

      await _storage.write(key: 'token', value: _token);
      await _storage.write(key: 'username', value: username);
      await _storage.write(key: 'email', value: email);
      await _storage.write(key: 'idUsuario', value: idUsuario);

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
    await _storage.delete(key: 'email');
    await _storage.delete(key: 'idUsuario');
    status = AuthStatus.notAutenticated;
    notifyListeners();
  }



  Future<bool> login1(String username, String password) async {
    isLoginLoading = true;
    notifyListeners();
    try {
      //final response = await _api.login(username, password);


      if (username != '5551029' || password != 'J5551029') {
        return false;
      }

      //final user = response.user!;

      _token = '123456';
      this.username = '5551029';     
      email = 'jcaba@senavex.gob.bo'; 
      idUsuario= '3296';    

      await _storage.write(key: 'token', value: _token);
      await _storage.write(key: 'username', value: username);
      await _storage.write(key: 'email', value: email);
      await _storage.write(key: 'idUsuario', value: idUsuario);

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


}
