import 'package:flutter/material.dart';
import '/models/events.dart';

class DetalleEventoScreen extends StatelessWidget {
  final Evento evento;

  const DetalleEventoScreen({required this.evento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Evento'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título: ${evento.titulo}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Fecha: ${evento.fecha}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Descripción:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              evento.descripcion,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            if (evento.fotoUrl.isNotEmpty)
              Image.network(
                evento.fotoUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16),
            if (evento.audioUrl.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  // Implementa la lógica para reproducir el audio
                },
                child: Text('Reproducir Audio'),
              ),
          ],
        ),
      ),
    );
  }
}
