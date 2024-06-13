import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_diagnosa_rawat_inap.dart'; // Pastikan file detail_diagnosa_rawat_inap.dart diimpor dengan benar
import 'tambah_data_diagnosa_rawat_inap.dart'; // Impor tambah_data_diagnosa_rawat_inap.dart

class DataDiagnosaRawatInapScreen extends StatefulWidget {
  @override
  _DataDiagnosaRawatInapScreenState createState() => _DataDiagnosaRawatInapScreenState();
}

class _DataDiagnosaRawatInapScreenState extends State<DataDiagnosaRawatInapScreen> {
  Future<List<dynamic>> fetchDiagnosis() async {
    final response = await http.get(Uri.parse('http://192.168.123.114/medical/read_diagnosa_rawat_inap.php'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load diagnosis');
    }
  }

  void _goToTambahDataDiagnosaRawatInap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TambahDataDiagnosaRawatInapScreen()),
    ).then((_) {
      setState(() {});
    });
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
                _deleteDiagnosis(id); // Hapus data diagnosis jika tombol "Ya" ditekan
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

  void _deleteDiagnosis(String id) async {
    final response = await http.post(
      Uri.parse('http://192.168.123.114/medical/delete_diagnosa_rawat_inap.php'),
      body: {'id': id},
    );

    if (response.statusCode == 200) {
      // Jika penghapusan berhasil, perbarui UI
      setState(() {});
    } else {
      // Jika terjadi kesalahan saat menghapus data, tampilkan pesan kesalahan
      throw Exception('Failed to delete diagnosis');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Diagnosa Rawat Inap'),
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
          future: fetchDiagnosis(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var diagnosis = snapshot.data![index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        diagnosis['nama_pasien'],
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
                            'Tanggal Diagnosis: ${diagnosis['tgl_diagnosis']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Diagnosis: ${diagnosis['h_diagnosis']}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailDiagnosaRawatInapScreen(diagnosis: diagnosis),
                          ),
                        );
                      },
                      // Tambahkan fungsi untuk mengonfirmasi dan menghapus diagnosis
                      onLongPress: () {
                        _confirmDelete(diagnosis['id']);
                      },
                      // Tambahkan IconButton untuk menghapus item
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _confirmDelete(diagnosis['id']);
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
        onPressed: _goToTambahDataDiagnosaRawatInap,
        child: Icon(Icons.add),
      ),
    );
  }
}
