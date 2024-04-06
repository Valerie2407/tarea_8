import 'package:flutter/material.dart';
import '/screens/acerca_de_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Aplicación'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Acerca de'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AcercaDeScreen()));
              },
            ),
            // Agregar otras secciones del menú aquí
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Información sobre el delegado:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Aquí puedes mostrar la información sobre el delegado
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
                // Puedes agregar más detalles sobre el delegado aquí
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Reflexión sobre democracia, elecciones o servicio cívico:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '"La democracia es el gobierno del pueblo, por el pueblo y para el pueblo." - Abraham Lincoln',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
