import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sisconsultas/core/exceptions/unauthorized_exception.dart';
import 'package:sisconsultas/features/empresas/data/models/empresas_model.dart';
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
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error HTTP: ${response.statusCode}');
    }

    final json = jsonDecode(response.body);

    // Token expirado
    if (json['success'] == false && json['message'] == 'Token inválido') {
      throw UnauthorizedException();
    }

    return RespuestaEmpresas.fromJson(json);
  }


  Future<RespuestaEmpresas?> getEmpresasSinApi() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return RespuestaEmpresas(
    success: true,
    message: 'Datos obtenidos correctamente',
    empresas: [
      Empresa(
        idEmpresa: '1',
        razonSocial: 'IMPORTADORA BOLIVIANA SRL',
        nit: '1234567011',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '2',
        razonSocial: 'EXPORTACIONES ANDINAS SA',
        nit: '9876543210',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '3',
        razonSocial: 'TECNOLOGIA GLOBAL SRL',
        nit: '4567891230',
        estado: 'INACTIVO',
      ),
      Empresa(
        idEmpresa: '4',
        razonSocial: 'COMERCIAL DEL ORIENTE',
        nit: '7418529630',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '5',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '6',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '7',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '8',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '9',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '10',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '11',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),

      Empresa(
        idEmpresa: '12',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '13',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '14',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),
      Empresa(
        idEmpresa: '15',
        razonSocial: 'SERVICIOS INDUSTRIALES SA',
        nit: '3692581470',
        estado: 'ACTIVO',
      ),
      

    ],
  );
}
}
