import 'package:firebase_database/firebase_database.dart';

class Evento {
  late String titulo;
  late DateTime fecha;
  late String descripcion;
  late String fotoUrl;
  late String audioUrl;

  Evento( {
    required this.titulo,
    required this.fecha,
    required this.descripcion,
    required this.fotoUrl,
    required this.audioUrl,
  });

  Evento.fromSnapshot(DataSnapshot snapshot) {
    final dynamic data = snapshot.value;

    titulo = data['titulo'] ?? '';
    fecha = (data['fecha'] != null) ? DateTime.parse(data['fecha']) : DateTime.now();
    descripcion = data['descripcion'] ?? '';
    fotoUrl = data['fotoUrl'] ?? '';
    audioUrl = data['audioUrl'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'fecha': fecha.toIso8601String(),
      'descripcion': descripcion,
      'fotoUrl': fotoUrl,
      'audioUrl': audioUrl,
    };
  }
}
