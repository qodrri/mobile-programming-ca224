import 'package:flutter/material.dart';
import '../models/hewan.dart';

class HewanFormScreen extends StatefulWidget {
  final Map<String, dynamic>? initialData;

  HewanFormScreen({this.initialData});

  @override
  _HewanFormScreenState createState() => _HewanFormScreenState();
}

class _HewanFormScreenState extends State<HewanFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _namaSpesies;
  String? _namaIndonesia;
  String? _deskripsi;
  String? _gambar;

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      _namaSpesies = widget.initialData!['namaSpesies'];
      _namaIndonesia = widget.initialData!['namaIndonesia'];
      _deskripsi = widget.initialData!['deskripsi'];
      _gambar = widget.initialData!['gambar'];
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newHewan = Hewan(
        id: widget.initialData?['id'] ?? DateTime.now().toString(),
        namaSpesies: _namaSpesies!,
        namaIndonesia: _namaIndonesia!,
        deskripsi: _deskripsi!,
        gambar: _gambar!,
      );

      Navigator.of(context).pop(newHewan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initialData == null ? 'Tambah Hewan' : 'Edit Hewan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _namaSpesies,
                decoration: InputDecoration(labelText: 'Nama Spesies'),
                validator: (value) =>
                    value!.isEmpty ? 'Tidak boleh kosong' : null,
                onSaved: (value) => _namaSpesies = value,
              ),
              TextFormField(
                initialValue: _namaIndonesia,
                decoration: InputDecoration(labelText: 'Nama Indonesia'),
                validator: (value) =>
                    value!.isEmpty ? 'Tidak boleh kosong' : null,
                onSaved: (value) => _namaIndonesia = value,
              ),
              TextFormField(
                initialValue: _deskripsi,
                decoration: InputDecoration(labelText: 'Deskripsi'),
                validator: (value) =>
                    value!.isEmpty ? 'Tidak boleh kosong' : null,
                onSaved: (value) => _deskripsi = value,
              ),
              TextFormField(
                initialValue: _gambar,
                decoration: InputDecoration(labelText: 'URL Gambar'),
                validator: (value) =>
                    value!.isEmpty ? 'Tidak boleh kosong' : null,
                onSaved: (value) => _gambar = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Simpan'),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
