import 'package:flutter/material.dart';
import 'package:myapp/models/moment.dart';
import 'package:myapp/resources/colors.dart';
import 'package:myapp/resources/dimensions.dart';
import 'package:nanoid2/nanoid2.dart';

class MomentEntryPage extends StatefulWidget {
  const MomentEntryPage({super.key, required this.onSave});
  final Function(Moment) onSave;

  @override
  _MomentEntryPageState createState() => _MomentEntryPageState();
}

class _MomentEntryPageState extends State<MomentEntryPage> {
  final _formKey = GlobalKey<FormState>();
  // Object map data
  final Map<String, dynamic> _momentState = {};
  // Definisi date format
  // final _dateFormat = DateFormat('yyyy-MM-dd');

  void _saveMoment() {
    // Validasi bila input pengguna sudah sesuai
    if (_formKey.currentState!.validate()) {
      // Simpan input pengguna ke object _momentState
      _formKey.currentState!.save();
      // Membuat object moment baru
      final newMoment = Moment(
        id: nanoid(),
        creator: _momentState['creator'],
        location: _momentState['location'],
        momentDate: _momentState['momentDate'],
        caption: _momentState['caption'],
        imageUrl: _momentState['imageUrl'],
      );
      // Simpan moment baru ke list moment
      widget.onSave(newMoment);
      // Menutup moment entry
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Moment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: largeSize),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Moment Date'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter moment date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        DateTime.tryParse(value) == null) {
                      return 'Please enter a moment date in format yyyy-MM-dd';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    // Bila moment date tidak kosong maka simpan ke object map
                    if (newValue != null) {
                      _momentState['momentDate'] = DateTime.parse(newValue);
                    }
                  },
                ),
                const Text('Creator Name'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter moment creator',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter creator name';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    // Bila nama kreator tidak kosong maka simpan ke object map
                    if (newValue != null) {
                      _momentState['creator'] = newValue.toString();
                    }
                  },
                ),
                const Text('Location'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter moment location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter moment location';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    // Bila nama kreator tidak kosong maka simpan ke object map
                    if (newValue != null) {
                      _momentState['location'] = newValue.toString();
                    }
                  },
                ),
                const Text('Caption'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter moment caption',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter moment caption';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    // Bila nama kreator tidak kosong maka simpan ke object map
                    if (newValue != null) {
                      _momentState['caption'] = newValue.toString();
                    }
                  },
                ),
                const Text('Image URL'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter moment image URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter moment image URL';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    // Bila nama kreator tidak kosong maka simpan ke object map
                    if (newValue != null) {
                      _momentState['imageUrl'] = newValue.toString();
                    }
                  },
                ),
                const SizedBox(height: largeSize),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _saveMoment,
                  child: const Text('Save'),
                ),
                const SizedBox(height: mediumSize),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    side: const BorderSide(color: primaryColor),
                  ),
                  onPressed: () {
                    // Menutup moment entry
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(height: largeSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
