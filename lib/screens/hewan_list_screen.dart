import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import 'hewan_form_screen.dart';

class HewanListScreen extends StatefulWidget {
  @override
  _HewanListScreenState createState() => _HewanListScreenState();
}

class _HewanListScreenState extends State<HewanListScreen> {
  void _navigateToForm({Map<String, dynamic>? initialData}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HewanFormScreen(initialData: initialData),
      ),
    );

    if (result != null) {
      setState(() {
        if (initialData != null) {
          // Update data
          dummyHewan.removeWhere((hewan) => hewan.id == initialData['id']);
        }
        dummyHewan.add(result);
      });
    }
  }

  void _deleteHewan(String id) {
    setState(() {
      dummyHewan.removeWhere((hewan) => hewan.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Hewan'),
      ),
      body: ListView.builder(
        itemCount: dummyHewan.length,
        itemBuilder: (ctx, index) {
          final hewan = dummyHewan[index];
          return Card(
            child: ListTile(
              leading: Image.network(hewan.gambar),
              title: Text(hewan.namaIndonesia),
              subtitle: Text(hewan.namaSpesies),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _navigateToForm(
                      initialData: {
                        'id': hewan.id,
                        'namaSpesies': hewan.namaSpesies,
                        'namaIndonesia': hewan.namaIndonesia,
                        'deskripsi': hewan.deskripsi,
                        'gambar': hewan.gambar,
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteHewan(hewan.id),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToForm(),
      ),
    );
  }
}
