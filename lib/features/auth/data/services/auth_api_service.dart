import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sisconsultas/features/auth/data/models/login_response.dart';

class AuthApiService {

  final String baseUrl = "http://sisconsultas.senavex.gob.bo:3005";

  Future<LoginResponse?> login(String username, String password) async {
    
    final response = await http.post(
      Uri.parse('$baseUrl/api/login/getuser'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'user': username,
        'clave': password,
      }),
    );  
  
    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);

      return LoginResponse.fromJson(json);
    }    
    return null;
    
  }
}