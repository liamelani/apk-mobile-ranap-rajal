import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_kamar.dart'; // Impor file detail_kamar.dart
import 'tambah_data_kamar.dart'; // Impor file tambah_data_kamar.dart

class DataKamarScreen extends StatefulWidget {
  @override
  _DataKamarScreenState createState() => _DataKamarScreenState();
}

class _DataKamarScreenState extends State<DataKamarScreen> {
  Future<List<dynamic>> fetchRooms() async {
    final response = await http.get(Uri.parse('http://192.168.123.114/medical/read_kamar.php'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load rooms');
    }
  }

  void _goToTambahDataKamar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TambahDataKamarScreen()),
    );
  }

  void _confirmDelete(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah Anda yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                _deleteRoom(id); // Hapus data kamar jika tombol "Ya" ditekan
              },
              child: Text("Ya"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text("Batal"),
            ),
          ],
        );
      },
    );
  }

  void _deleteRoom(String id) async {
    final response = await http.post(
      Uri.parse('http://192.168.123.114/medical/delete_kamar.php'),
      body: {'id': id},
    );

    if (response.statusCode == 200) {
      // Jika penghapusan berhasil, perbarui UI
      setState(() {});
    } else {
      // Jika terjadi kesalahan saat menghapus data, tampilkan pesan kesalahan
      throw Exception('Failed to delete room');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kamar'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade800],
          ),
        ),
        child: FutureBuilder<List<dynamic>>(
          future: fetchRooms(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var room = snapshot.data![index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        room['no_tempat_tidur'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text(
                            'Ruang: ${room['ruang']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Status: ${room['status']}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailKamarScreen(room: room),
                          ),
                        );
                      },
                      // Tambahkan ikon delete ke trailing
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _confirmDelete(room['id']);
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            // Menampilkan loading spinner jika masih memuat data
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTambahDataKamar,
        child: Icon(Icons.add),
      ),
    );
  }
}
