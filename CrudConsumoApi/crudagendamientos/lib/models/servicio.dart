class Servicio {
  int id;
  String nombre;
  String? descripcion;
  double precio;
  int duracionMinutos;
  bool? estado;

  Servicio({
    required this.id,
    required this.nombre,
    this.descripcion,
    required this.precio,
    required this.duracionMinutos,
    this.estado,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'].toDouble(),
      duracionMinutos: json['duracionMinutos'],
      estado: json['estado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'duracionMinutos': duracionMinutos,
      'estado': estado,
    };
  }
}