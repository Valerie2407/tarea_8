import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importar Firebase Core
import '/screens/eventos_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( // Inicializar Firebase
    options: FirebaseOptions(
      apiKey: '',
      authDomain: '',
      projectId: 'partidos-app-movil',
      storageBucket: '',
      messagingSenderId: '',
      appId: '40259689629',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EventosScreen(),
    );
  }
}
