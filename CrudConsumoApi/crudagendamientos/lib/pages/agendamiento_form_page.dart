import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/agendamiento.dart';
import '../services/agendamiento_service.dart';

class AgendamientoFormPage extends StatefulWidget {
  final Agendamiento? agendamiento;
  final VoidCallback onSave;

  const AgendamientoFormPage({
    super.key,
    this.agendamiento,
    required this.onSave,
  });

  @override
  State<AgendamientoFormPage> createState() => _AgendamientoFormPageState();
}

class _AgendamientoFormPageState extends State<AgendamientoFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _clienteIdController = TextEditingController();
  final _barberoIdController = TextEditingController();
  final _servicioIdController = TextEditingController();
  final _paqueteIdController = TextEditingController();
  final _observacionesController = TextEditingController();
  final _montoController = TextEditingController();

  DateTime _fechaCita = DateTime.now();
  TimeOfDay _horaInicio = TimeOfDay.now();
  TimeOfDay _horaFin = TimeOfDay.now();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.agendamiento != null) {
      _loadExistingData();
    }
  }

  void _loadExistingData() {
    final agendamiento = widget.agendamiento!;
    _clienteIdController.text = agendamiento.clienteId.toString();
    _barberoIdController.text = agendamiento.barberoId.toString();
    _servicioIdController.text = agendamiento.servicioId?.toString() ?? '';
    _paqueteIdController.text = agendamiento.paqueteId?.toString() ?? '';
    _observacionesController.text = agendamiento.observaciones ?? '';
    _montoController.text = agendamiento.monto?.toString() ?? '';
    _fechaCita = agendamiento.fechaCita;
    _horaInicio = TimeOfDay.fromDateTime(agendamiento.horaInicio);
    _horaFin = TimeOfDay.fromDateTime(agendamiento.horaFin);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaCita,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _fechaCita) {
      setState(() {
        _fechaCita = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _horaInicio : _horaFin,
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _horaInicio = picked;
        } else {
          _horaFin = picked;
        }
      });
    }
  }

  Future<void> _saveAgendamiento() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final agendamiento = Agendamiento(
        id: widget.agendamiento?.id ?? 0,
        clienteId: int.parse(_clienteIdController.text),
        barberoId: int.parse(_barberoIdController.text),
        servicioId: _servicioIdController.text.isNotEmpty 
            ? int.parse(_servicioIdController.text) 
            : null,
        paqueteId: _paqueteIdController.text.isNotEmpty
            ? int.parse(_paqueteIdController.text)
            : null,
        fechaCita: _fechaCita,
        horaInicio: DateTime(
          _fechaCita.year,
          _fechaCita.month,
          _fechaCita.day,
          _horaInicio.hour,
          _horaInicio.minute,
        ),
        horaFin: DateTime(
          _fechaCita.year,
          _fechaCita.month,
          _fechaCita.day,
          _horaFin.hour,
          _horaFin.minute,
        ),
        estadoCita: 'Pendiente',
        monto: _montoController.text.isNotEmpty 
            ? double.parse(_montoController.text) 
            : null,
        observaciones: _observacionesController.text.isNotEmpty
            ? _observacionesController.text
            : null,
        estado: true,
      );

      if (widget.agendamiento == null) {
        await AgendamientoService.createAgendamiento(agendamiento);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Agendamiento creado exitosamente')),
        );
      } else {
        await AgendamientoService.updateAgendamiento(agendamiento);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Agendamiento actualizado exitosamente')),
        );
      }

      widget.onSave();
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.agendamiento == null 
            ? 'Nuevo Agendamiento' 
            : 'Editar Agendamiento'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _clienteIdController,
                      decoration: const InputDecoration(
                        labelText: 'ID Cliente *',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el ID del cliente';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _barberoIdController,
                      decoration: const InputDecoration(
                        labelText: 'ID Barbero *',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el ID del barbero';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _servicioIdController,
                      decoration: const InputDecoration(
                        labelText: 'ID Servicio (Opcional)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _paqueteIdController,
                      decoration: const InputDecoration(
                        labelText: 'ID Paquete (Opcional)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    // Selector de fecha
                    ListTile(
                      title: const Text('Fecha de la cita'),
                      subtitle: Text(DateFormat('dd/MM/yyyy').format(_fechaCita)),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () => _selectDate(context),
                    ),
                    const SizedBox(height: 16),
                    // Selector de hora inicio
                    ListTile(
                      title: const Text('Hora de inicio'),
                      subtitle: Text(_horaInicio.format(context)),
                      trailing: const Icon(Icons.access_time),
                      onTap: () => _selectTime(context, true),
                    ),
                    const SizedBox(height: 16),
                    // Selector de hora fin
                    ListTile(
                      title: const Text('Hora de fin'),
                      subtitle: Text(_horaFin.format(context)),
                      trailing: const Icon(Icons.access_time),
                      onTap: () => _selectTime(context, false),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _montoController,
                      decoration: const InputDecoration(
                        labelText: 'Monto (Opcional)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _observacionesController,
                      decoration: const InputDecoration(
                        labelText: 'Observaciones (Opcional)',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _saveAgendamiento,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(widget.agendamiento == null 
                              ? 'Crear Agendamiento' 
                              : 'Actualizar Agendamiento'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _clienteIdController.dispose();
    _barberoIdController.dispose();
    _servicioIdController.dispose();
    _paqueteIdController.dispose();
    _observacionesController.dispose();
    _montoController.dispose();
    super.dispose();
  }
}