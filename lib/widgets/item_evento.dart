import 'package:flutter/material.dart';
import 'package:tarea_8/models/events.dart';

class ItemEvento extends StatelessWidget {
  final Evento evento; // Definición del parámetro evento
  final Function onTap; // Definición del parámetro onTap

  const ItemEvento({
    required this.evento,
    required this.onTap,
  }); // Constructor que recibe los parámetros evento y onTap

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(); // Llama a la función onTap proporcionada
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Center(child: Text('Item de Evento')),
      ),
    );
  }
}
