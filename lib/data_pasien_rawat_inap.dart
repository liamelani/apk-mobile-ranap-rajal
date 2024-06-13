import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_pasien_rawat_inap.dart'; // Pastikan file detail_pasien_rawat_inap.dart diimpor dengan benar
import 'tambah_data_pasien_rawat_inap.dart'; 

class DataPasienRawatInapScreen extends StatefulWidget {
  @override
  _DataPasienRawatInapScreenState createState() => _DataPasienRawatInapScreenState();
}

class _DataPasienRawatInapScreenState extends State<DataPasienRawatInapScreen> {
  Future<List<dynamic>> fetchPatients() async {
    final response = await http.get(Uri.parse('http://192.168.123.114/medical/read_pasien_rawat_inap.php'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load patients');
    }
  }

  void _goToTambahDataPasienRawatInap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TambahDataPasienRawatInapScreen()),
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
                _deletePatient(id); // Hapus data pasien jika tombol "Ya" ditekan
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

  void _deletePatient(String id) async {
    final response = await http.post(
      Uri.parse('http://192.168.21.114/medical/delete_patient_rawat_inap.php'),
      body: {'id': id},
    );

    if (response.statusCode == 200) {
      // Refresh data setelah menghapus data
      setState(() {});
    } else {
      throw Exception('Failed to delete patient');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pasien Rawat Inap'),
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
          future: fetchPatients(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var patient = snapshot.data![index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        patient['Nama_Pasien'],
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
                            'Jenis Kelamin: ${patient['Jenis_Kelamin']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Umur: ${patient['Umur']} tahun',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _confirmDelete(patient['id']); // Panggil fungsi konfirmasi hapus dengan id pasien
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPasienRawatInapScreen(patient: patient),
                          ),
                        );
                      },
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
        onPressed: _goToTambahDataPasienRawatInap,
        child: Icon(Icons.add),
      ),
    );
  }
}
