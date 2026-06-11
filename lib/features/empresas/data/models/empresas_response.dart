import 'package:sisconsultas/features/empresas/data/models/empresas_model.dart';


class RespuestaEmpresas {
  final bool success;
  final String message;
  final List<Empresa> empresas;

  const RespuestaEmpresas({
    required this.success,
    required this.message,
    required this.empresas,
  });

  factory RespuestaEmpresas.fromJson(Map<String, dynamic> json) {
    return RespuestaEmpresas(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      empresas: (json['data'] as List<dynamic>?)
              ?.map((e) => Empresa.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': empresas.map((e) => e.toJson()).toList(),
    };
  }
}