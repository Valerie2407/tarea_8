import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import '/models/events.dart';
import 'package:path_provider/path_provider.dart';

class RegistrarEventoScreen extends StatefulWidget {
  @override
  _RegistrarEventoScreenState createState() => _RegistrarEventoScreenState();
}

class _RegistrarEventoScreenState extends State<RegistrarEventoScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  File? _foto;
  File? _audioFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Evento'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
              ),
            ),
            SizedBox(height: 16.0),
            _buildFotoSelector(),
            SizedBox(height: 16.0),
            _buildAudioSelector(),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _registrarEvento();
                Navigator.pop(context);
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFotoSelector() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: _tomarFoto,
          child: Icon(Icons.camera_alt),
        ),
        SizedBox(width: 16.0),
        _foto != null
            ? Image.file(
                _foto!,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              )
            : SizedBox(
                height: 100,
                width: 100,
                child: Placeholder(),
              ),
      ],
    );
  }

  Future<void> _tomarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _foto = File(pickedFile.path);
      });
    }
  }

  Widget _buildAudioSelector() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: _seleccionarAudio,
          child: Icon(Icons.audiotrack),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Text(_audioFile != null ? 'Audio seleccionado' : 'Seleccionar Audio'),
        ),
      ],
    );
  }

  Future<void> _seleccionarAudio() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowCompression: true,
    );

    if (result != null) {
      setState(() {
        _audioFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _registrarEvento() async {
    final String titulo = _tituloController.text.trim();
    final String descripcion = _descripcionController.text.trim();
    String fotoUrl = '';
    String audioUrl = '';

    if (_foto != null) {
      final Reference ref = FirebaseStorage.instance.ref().child('fotos').child('${DateTime.now()}.jpg');
      final UploadTask uploadTask = ref.putFile(_foto!);
      await uploadTask.whenComplete(() async {
        fotoUrl = await ref.getDownloadURL();
      });
    }

    if (_audioFile != null) {
      final appDocDir = await getApplicationDocumentsDirectory();
      final String appDocPath = appDocDir.path;
      final String fileName = DateTime.now().toString() + '.wav';
      final String filePath = '$appDocPath/$fileName';
      await _audioFile!.copy(filePath);
      audioUrl = filePath;
    }

    final DatabaseReference nuevoEventoRef = FirebaseDatabase.instance.reference().child('eventos').push();
nuevoEventoRef.set(Evento(titulo: titulo, fecha: DateTime.now(), descripcion: descripcion, fotoUrl: fotoUrl, audioUrl: audioUrl).toJson());
  }
}
