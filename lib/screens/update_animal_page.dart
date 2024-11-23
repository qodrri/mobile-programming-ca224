import 'package:flutter/material.dart';
import '../models/animal.dart';

class UpdateAnimalPage extends StatefulWidget {
  final Animal animal;
  final Function(Animal) onUpdate;

  UpdateAnimalPage({required this.animal, required this.onUpdate});

  @override
  _UpdateAnimalPageState createState() => _UpdateAnimalPageState();
}

class _UpdateAnimalPageState extends State<UpdateAnimalPage> {
  late TextEditingController _speciesController;
  late TextEditingController _indonesianController;
  late TextEditingController _descriptionController;
  late TextEditingController _imagePathController;

  @override
  void initState() {
    super.initState();
    _speciesController = TextEditingController(text: widget.animal.speciesName);
    _indonesianController =
        TextEditingController(text: widget.animal.indonesianName);
    _descriptionController =
        TextEditingController(text: widget.animal.description);
    _imagePathController = TextEditingController(text: widget.animal.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Data Hewan"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              _buildTextField("Nama Spesies", _speciesController),
              SizedBox(height: 10),
              _buildTextField("Nama Indonesia", _indonesianController),
              SizedBox(height: 10),
              _buildTextField("Deskripsi", _descriptionController),
              SizedBox(height: 10),
              _buildTextField("Path Gambar", _imagePathController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final updatedAnimal = Animal(
                    speciesName: _speciesController.text,
                    indonesianName: _indonesianController.text,
                    description: _descriptionController.text,
                    imagePath: _imagePathController.text,
                  );
                  widget.onUpdate(updatedAnimal);
                  Navigator.pop(context);
                },
                child: Text("Perbarui"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
