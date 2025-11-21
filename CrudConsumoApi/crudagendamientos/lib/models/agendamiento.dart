import 'package:intl/intl.dart';
import 'barbero.dart';
import 'cliente.dart';
import 'paquete.dart';
import 'servicio.dart';

class Agendamiento {
  int id;
  int clienteId;
  int barberoId;
  int? servicioId;
  int? paqueteId;
  DateTime fechaCita;
  DateTime horaInicio;
  DateTime horaFin;
  String? estadoCita;
  double? monto;
  String? observaciones;
  bool? estado;
  
Cliente? cliente;
Barbero? barbero;
Servicio? servicio;
Paquete? paquete;

  Agendamiento({
    required this.id,
    required this.clienteId,
    required this.barberoId,
    this.servicioId,
    this.paqueteId,
    required this.fechaCita,
    required this.horaInicio,
    required this.horaFin,
    this.estadoCita,
    this.monto,
    this.observaciones,
    this.estado,
    // this.cliente,
    // this.barbero,
    // this.servicio,
    // this.paquete,
  });

  factory Agendamiento.fromJson(Map<String, dynamic> json) {
    // Convertir DateOnly y TimeOnly de .NET a DateTime
    final fechaCita = DateTime.parse(json['fechaCita']);
    
    // Para TimeOnly, asumimos que viene como string "HH:mm:ss"
    final horaInicioStr = json['horaInicio'].toString();
    final horaFinStr = json['horaFin'].toString();
    
    // Crear DateTime combinando fecha con hora
    final horaInicio = DateTime(
      fechaCita.year, 
      fechaCita.month, 
      fechaCita.day,
      int.parse(horaInicioStr.split(':')[0]),
      int.parse(horaInicioStr.split(':')[1])
    );
    
    final horaFin = DateTime(
      fechaCita.year, 
      fechaCita.month, 
      fechaCita.day,
      int.parse(horaFinStr.split(':')[0]),
      int.parse(horaFinStr.split(':')[1])
    );

    return Agendamiento(
      id: json['id'],
      clienteId: json['clienteId'],
      barberoId: json['barberoId'],
      servicioId: json['servicioId'],
      paqueteId: json['paqueteId'],
      fechaCita: fechaCita,
      horaInicio: horaInicio,
      horaFin: horaFin,
      estadoCita: json['estadoCita'],
      monto: json['monto'] != null ? double.parse(json['monto'].toString()) : null,
      observaciones: json['observaciones'],
      estado: json['estado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clienteId': clienteId,
      'barberoId': barberoId,
      'servicioId': servicioId,
      'paqueteId': paqueteId,
      'fechaCita': DateFormat('yyyy-MM-dd').format(fechaCita),
      'horaInicio': DateFormat('HH:mm:ss').format(horaInicio),
      'horaFin': DateFormat('HH:mm:ss').format(horaFin),
      'estadoCita': estadoCita,
      'monto': monto,
      'observaciones': observaciones,
      'estado': estado,
    };
  }

  String get fechaFormateada => DateFormat('dd/MM/yyyy').format(fechaCita);
  String get horaInicioFormateada => DateFormat('HH:mm').format(horaInicio);
  String get horaFinFormateada => DateFormat('HH:mm').format(horaFin);
}