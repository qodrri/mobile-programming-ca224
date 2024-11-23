import 'package:flutter/material.dart';
import '../models/animal.dart';

class AddAnimalPage extends StatefulWidget {
  final Function(Animal) onAdd;

  AddAnimalPage({required this.onAdd});

  @override
  _AddAnimalPageState createState() => _AddAnimalPageState();
}

class _AddAnimalPageState extends State<AddAnimalPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _indonesianController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imagePathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Hewan"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                  if (_formKey.currentState!.validate()) {
                    final newAnimal = Animal(
                      speciesName: _speciesController.text,
                      indonesianName: _indonesianController.text,
                      description: _descriptionController.text,
                      imagePath: _imagePathController.text,
                    );
                    widget.onAdd(newAnimal);
                    Navigator.pop(context);
                  }
                },
                child: Text("Tambahkan"),
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
      validator: (value) =>
          value!.isEmpty ? "$label tidak boleh kosong" : null,
    );
  }
}
