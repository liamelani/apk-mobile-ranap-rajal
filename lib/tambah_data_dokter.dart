import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data_dokter.dart'; // Impor file data_dokter.dart

class TambahDataDokterScreen extends StatefulWidget {
  @override
  _TambahDataDokterScreenState createState() => _TambahDataDokterScreenState();
}

class _TambahDataDokterScreenState extends State<TambahDataDokterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController noDokterController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController spesialisasiController = TextEditingController();
  final TextEditingController diterimaController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  Future<void> tambahDataDokter() async {
    if (_formKey.currentState!.validate()) {
      final Uri uri = Uri.parse('http://192.168.123.114:8000/api/doctors');
      final response = await http.post(
        uri,
        body: {
          'no_dokter': noDokterController.text,
          'nama': namaController.text,
          'spesialisasi': spesialisasiController.text,
          'diterima': diterimaController.text, // Sesuaikan dengan nama field di API
          'no_hp': noHpController.text,
          'alamat': alamatController.text,
        },
      );

      if (response.statusCode == 201) {
        // Data berhasil ditambahkan, navigasi ke tampilan data dokter
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DataDokterScreen(),
          ),
        );
      } else {
        // Gagal menambahkan data, tampilkan pesan kesalahan
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal menambahkan data')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Dokter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: noDokterController,
                decoration: InputDecoration(labelText: 'Nomor Dokter'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor Dokter tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama Dokter'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Dokter tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: spesialisasiController,
                decoration: InputDecoration(labelText: 'Spesialisasi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Spesialisasi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: diterimaController,
                decoration: InputDecoration(labelText: 'Tanggal Diterima'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal Diterima tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: noHpController,
                decoration: InputDecoration(labelText: 'Nomor HP'),
              ),
              TextFormField(
                controller: alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: tambahDataDokter,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
