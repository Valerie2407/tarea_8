import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '/screens/acerca_de_screen.dart';
import '../models/events.dart';
import '/screens/detalle_evento_screen.dart';
import '/widgets/item_evento.dart';

class EventosScreen extends StatefulWidget {
  @override
  _EventosScreenState createState() => _EventosScreenState();
}

class _EventosScreenState extends State<EventosScreen> {
  final DatabaseReference _eventosRef = FirebaseDatabase.instance.reference().child('eventos');
  List<Evento> _eventos = [];

  @override
  void initState() {
    super.initState();
    _eventosRef.onChildAdded.listen((event) {
      setState(() {
        _eventos.add(Evento.fromSnapshot(event.snapshot));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos Registrados'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Acerca de'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AcercaDeScreen()));
              },
            ),
            // Otras opciones del menú lateral aquí
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _eventos.length,
        itemBuilder: (context, index) {
          return ItemEvento(
            evento: _eventos[index],
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetalleEventoScreen(evento: _eventos[index])));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar función para agregar evento
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
