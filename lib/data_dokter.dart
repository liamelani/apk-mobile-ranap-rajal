import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_dokter.dart'; // Import halaman detail_dokter.dart
import 'tambah_data_dokter.dart'; // Import halaman tambah_data_dokter.dart

class DataDokterScreen extends StatefulWidget {
  @override
  _DataDokterScreenState createState() => _DataDokterScreenState();
}

class _DataDokterScreenState extends State<DataDokterScreen> {
  late Future<List<dynamic>> _futureDoctors;

  @override
  void initState() {
    super.initState();
    _futureDoctors = fetchDoctors();
  }

  Future<List<dynamic>> fetchDoctors() async {
    final response = await http.get(Uri.parse('http://192.168.123.114/medical/read.php'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  void _goToTambahDataDokter() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TambahDataDokterScreen()),
    );
    if (result == true) {
      setState(() {
        _futureDoctors = fetchDoctors();
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Dokter berhasil ditambahkan'),
      ));
    }
  }

  void _confirmDeleteDoctor(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah Anda yakin ingin menghapus dokter ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                _deleteDoctor(id); // Hapus dokter jika tombol "Ya" ditekan
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

  void _deleteDoctor(String id) async {
    final response = await http.post(
      Uri.parse('http://192.168.123.114/medical/delete_doctor.php'),
      body: {'id': id},
    );

    if (response.statusCode == 200) {
      setState(() {
        _futureDoctors = fetchDoctors();
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Dokter berhasil dihapus'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Gagal menghapus dokter'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Dokter'),
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
          future: _futureDoctors,
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Tidak ada data dokter'));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var doctor = snapshot.data![index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      doctor['nama'],
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
                          'Spesialisasi: ${doctor['spesialisasi']}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailDokterScreen(doctor: doctor),
                        ),
                      );
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _confirmDeleteDoctor(doctor['id']);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTambahDataDokter,
        child: Icon(Icons.add),
      ),
    );
  }
}
