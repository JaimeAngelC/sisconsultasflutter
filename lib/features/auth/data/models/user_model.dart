class UserModel {

  final String idPersona;
  final String nombres;
  final String paterno;
  final String materno;
  final String email;
  final String numeroDocumento;
  final String token;

  UserModel({
    required this.idPersona,
    required this.nombres,
    required this.paterno,
    required this.materno,
    required this.email,
    required this.numeroDocumento,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {

    return UserModel(
      idPersona: json['id_persona'],
      nombres: json['nombres'],
      paterno: json['paterno'],
      materno: json['materno'],
      email: json['email'],
      numeroDocumento: json['numero_documento'],
      token: json['token'],
    );
  }
}