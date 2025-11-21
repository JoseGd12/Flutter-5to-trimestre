import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/agendamiento.dart';
import 'api_service.dart';

class AgendamientoService {
  static const String endpoint = 'agendamientos';

  // GET - Obtener todos los agendamientos
  static Future<List<Agendamiento>> getAgendamientos() async {
    try {
      final response = await ApiService.get(endpoint);
      
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Agendamiento.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar agendamientos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // GET - Obtener agendamiento por ID
  static Future<Agendamiento> getAgendamientoById(int id) async {
    try {
      final response = await ApiService.get('$endpoint/$id');
      
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return Agendamiento.fromJson(jsonData);
      } else if (response.statusCode == 404) {
        throw Exception('Agendamiento no encontrado');
      } else {
        throw Exception('Error al cargar agendamiento: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // POST - Crear nuevo agendamiento
  static Future<Agendamiento> createAgendamiento(Agendamiento agendamiento) async {
    try {
      final response = await ApiService.post(
        endpoint, 
        json.encode(agendamiento.toJson())
      );
      
      if (response.statusCode == 201) {
        final jsonData = json.decode(response.body);
        return Agendamiento.fromJson(jsonData);
      } else {
        throw Exception('Error al crear agendamiento: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // PUT - Actualizar agendamiento
  static Future<void> updateAgendamiento(Agendamiento agendamiento) async {
    try {
      final response = await ApiService.put(
        '$endpoint/${agendamiento.id}', 
        json.encode(agendamiento.toJson())
      );
      
      if (response.statusCode != 204) {
        throw Exception('Error al actualizar agendamiento: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // DELETE - Eliminar agendamiento
  static Future<void> deleteAgendamiento(int id) async {
    try {
      final response = await ApiService.delete('$endpoint/$id');
      
      if (response.statusCode != 204) {
        throw Exception('Error al eliminar agendamiento: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}