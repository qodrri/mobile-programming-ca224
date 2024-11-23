import 'package:flutter/material.dart';
import '../models/animal.dart';
import 'add_animal_page.dart';
import 'update_animal_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Animal> animals = [
    Animal(
      speciesName: "Panthera tigris",
      indonesianName: "Harimau",
      description: "Harimau adalah kucing besar yang hidup di hutan.",
      imagePath: "assets/images/tiger.jpg",
    ),
    Animal(
      speciesName: "Elephas maximus",
      indonesianName: "Gajah",
      description: "Gajah adalah hewan darat terbesar.",
      imagePath: "assets/images/elephant.jpg",
    ),
  ];

  void _addAnimal(Animal animal) {
    setState(() {
      animals.add(animal);
    });
  }

  void _updateAnimal(int index, Animal updatedAnimal) {
    setState(() {
      animals[index] = updatedAnimal;
    });
  }

  void _deleteAnimal(int index) {
    setState(() {
      animals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Hewan"),
      ),
      body: animals.isEmpty
          ? Center(child: Text("Belum ada data hewan"))
          : ListView.builder(
              itemCount: animals.length,
              itemBuilder: (context, index) {
                final animal = animals[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Image.asset(animal.imagePath, width: 50, height: 50),
                    title: Text(animal.indonesianName),
                    subtitle: Text(animal.speciesName),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.teal),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateAnimalPage(
                                  animal: animal,
                                  onUpdate: (updatedAnimal) =>
                                      _updateAnimal(index, updatedAnimal),
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _showDeleteDialog(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAnimalPage(onAdd: _addAnimal),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah Anda yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                _deleteAnimal(index);
                Navigator.pop(context);
              },
              child: Text("Hapus"),
            ),
          ],
        );
      },
    );
  }
}
