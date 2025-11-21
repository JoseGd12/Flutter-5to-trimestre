import 'package:flutter/material.dart';
import '../models/agendamiento.dart';
import '../services/agendamiento_service.dart';
import 'agendamiento_form_page.dart';

class AgendamientoListPage extends StatefulWidget {
  const AgendamientoListPage({super.key});

  @override
  State<AgendamientoListPage> createState() => _AgendamientoListPageState();
}

class _AgendamientoListPageState extends State<AgendamientoListPage> {
  List<Agendamiento> _agendamientos = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadAgendamientos();
  }

  Future<void> _loadAgendamientos() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });
      
      final agendamientos = await AgendamientoService.getAgendamientos();
      setState(() {
        _agendamientos = agendamientos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteAgendamiento(int id) async {
    try {
      await AgendamientoService.deleteAgendamiento(id);
      // Recargar la lista después de eliminar
      _loadAgendamientos();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Agendamiento eliminado exitosamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar: $e')),
      );
    }
  }

  void _confirmDelete(Agendamiento agendamiento) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Eliminación'),
          content: Text('¿Estás seguro de eliminar el agendamiento del ${agendamiento.fechaFormateada}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteAgendamiento(agendamiento.id);
              },
              child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamientos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: $_errorMessage'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _loadAgendamientos,
                        child: const Text('Reintentar'),
                      ),
                    ],
                  ),
                )
              : _agendamientos.isEmpty
                  ? const Center(child: Text('No hay agendamientos registrados'))
                  : ListView.builder(
                      itemCount: _agendamientos.length,
                      itemBuilder: (context, index) {
                        final agendamiento = _agendamientos[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: ListTile(
                            title: Text('${agendamiento.fechaFormateada} - ${agendamiento.horaInicioFormateada}'),
                            subtitle: Text('Cliente ID: ${agendamiento.clienteId} | Barbero ID: ${agendamiento.barberoId}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AgendamientoFormPage(
                                          agendamiento: agendamiento,
                                          onSave: _loadAgendamientos,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _confirmDelete(agendamiento),
                                ),
                              ],
                            ),
                            onTap: () {
                              // Ver detalles
                            },
                          ),
                        );
                      },
                    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgendamientoFormPage(onSave: _loadAgendamientos),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}