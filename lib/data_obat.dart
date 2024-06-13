import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_obat.dart'; // Import file detail_obat.dart
import 'tambah_data_obat.dart'; // Import file tambah_data_obat.dart

class DataObatScreen extends StatefulWidget {
  @override
  _DataObatScreenState createState() => _DataObatScreenState();
}

class _DataObatScreenState extends State<DataObatScreen> {
  Future<List<dynamic>> fetchDrugs() async {
    final response = await http.get(Uri.parse('http://192.168.123.114/medical/read_obat.php'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load drugs');
    }
  }

  void _goToTambahDataObat() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TambahDataObatScreen()),
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
                _deleteDrug(id); // Hapus data obat jika tombol "Ya" ditekan
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

  void _deleteDrug(String id) async {
    final response = await http.post(
      Uri.parse('http://192.168.123.114/medical/delete_obat.php'),
      body: {'id': id},
    );

    if (response.statusCode == 200) {
      // Jika penghapusan berhasil, perbarui UI
      setState(() {});
    } else {
      // Jika terjadi kesalahan saat menghapus data, tampilkan pesan kesalahan
      throw Exception('Failed to delete drug');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Obat'),
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
          future: fetchDrugs(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var drug = snapshot.data![index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        drug['nama_obat'],
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
                            'Jenis: ${drug['jenis_obat']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Stok: ${drug['stok']}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailObatScreen(drug: drug),
                          ),
                        );
                      },
                      // Tambahkan ikon delete ke trailing
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _confirmDelete(drug['id']);
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
        onPressed: _goToTambahDataObat,
        child: Icon(Icons.add),
      ),
    );
  }
}
