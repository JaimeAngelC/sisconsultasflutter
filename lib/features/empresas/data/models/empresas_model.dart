class Empresa {
  final String? idEmpresa;
  final String? idEstadoEmpresa;
  final String? razonSocial;
  final String? nit;
  final String? estado;
  final String? telefono;
  final String? celular;
  final String? email;
  final String? direccionFiscal;
  final String? descripcionTipo;
  final String? descripcionCategoria;

  const Empresa({
    this.idEmpresa,
    this.idEstadoEmpresa,
    this.razonSocial,
    this.nit,
    this.estado,
    this.telefono,
    this.celular,
    this.email,
    this.direccionFiscal,
    this.descripcionTipo,
    this.descripcionCategoria,
  });

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      idEmpresa: json['id_empresa'],
      idEstadoEmpresa: json['id_estado_empresa'],
      razonSocial: json['razon_social'],
      nit: json['nit'],
      estado: json['estado'],
      telefono: json['telefono'],
      celular: json['celular'],
      email: json['email'],
      direccionFiscal: json['direccion_fiscal'],
      descripcionTipo: json['descripcion_tipo'],
      descripcionCategoria: json['descripcion_categoria'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_empresa': idEmpresa,
      'id_estado_empresa': idEstadoEmpresa,
      'razon_social': razonSocial,
      'nit': nit,
      'estado': estado,
      'telefono': telefono,
      'celular': celular,
      'email': email,
      'direccion_fiscal': direccionFiscal,
      'descripcion_tipo': descripcionTipo,
      'descripcion_categoria': descripcionCategoria,
    };
  }

  Empresa copyWith({
    String? idEmpresa,
    String? idEstadoEmpresa,
    String? razonSocial,
    String? nit,
    String? estado,
    String? telefono,
    String? celular,
    String? email,
    String? direccionFiscal,
    String? descripcionTipo,
    String? descripcionCategoria,
  }) {
    return Empresa(
      idEmpresa: idEmpresa ?? this.idEmpresa,
      idEstadoEmpresa: idEstadoEmpresa ?? this.idEstadoEmpresa,
      razonSocial: razonSocial ?? this.razonSocial,
      nit: nit ?? this.nit,
      estado: estado ?? this.estado,
      telefono: telefono ?? this.telefono,
      celular: celular ?? this.celular,
      email: email ?? this.email,
      direccionFiscal: direccionFiscal ?? this.direccionFiscal,
      descripcionTipo: descripcionTipo ?? this.descripcionTipo,
      descripcionCategoria:
          descripcionCategoria ?? this.descripcionCategoria,
    );
  }
}