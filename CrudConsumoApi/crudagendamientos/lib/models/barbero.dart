class Barbero {
  int id;
  String documento;
  String nombre;
  String apellido;
  String? telefono;
  String? email;
  String? direccion;
  DateTime? fechaIngreso;
  bool? estado;

  Barbero({
    required this.id,
    required this.documento,
    required this.nombre,
    required this.apellido,
    this.telefono,
    this.email,
    this.direccion,
    this.fechaIngreso,
    this.estado,
  });

  factory Barbero.fromJson(Map<String, dynamic> json) {
    return Barbero(
      id: json['id'],
      documento: json['documento'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      telefono: json['telefono'],
      email: json['email'],
      direccion: json['direccion'],
      fechaIngreso: json['fechaIngreso'] != null 
          ? DateTime.parse(json['fechaIngreso'])
          : null,
      estado: json['estado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documento': documento,
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'email': email,
      'direccion': direccion,
      'fechaIngreso': fechaIngreso?.toIso8601String(),
      'estado': estado,
    };
  }
}