import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Información sobre el delegado:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/delegate_photo.jpg'), // Reemplaza con la imagen del delegado
            ),
            SizedBox(height: 8),
            Text(
              'Nombre: John Doe',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Apellido: Smith',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Matrícula: 123456',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text(
              'Reflexión sobre democracia, elecciones o servicio cívico:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '"La democracia es el gobierno del pueblo, por el pueblo y para el pueblo." - Abraham Lincoln',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
