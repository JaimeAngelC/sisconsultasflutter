import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sisconsultas/core/exceptions/unauthorized_exception.dart';
import 'package:sisconsultas/features/empresas/data/models/empresas_response.dart';


class EmpresaApiService {
  final storage = const FlutterSecureStorage();
  final String baseUrl = "http://sisconsultas.senavex.gob.bo:3005";

  Future<RespuestaEmpresas?> getEmpresas() async {
  final token = await storage.read(key: 'token');
  final idUsuario = await storage.read(key: 'idUsuario');

  final response = await http.get(
    Uri.parse('$baseUrl/api/empresas/getempresas/$idUsuario'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  // Error HTTP
  if (response.statusCode != 200 &&
      response.statusCode != 201) {
    throw Exception(
      'Error HTTP: ${response.statusCode}',
    );
  }

  final json = jsonDecode(response.body);

  // Token expirado
  if (json['success'] == false &&
      json['message'] == 'Token inválido') {
    throw UnauthorizedException();
  }

  return RespuestaEmpresas.fromJson(json);
}
}