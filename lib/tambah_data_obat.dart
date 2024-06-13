import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data_obat.dart'; // Impor file data_obat.dart

class TambahDataObatScreen extends StatefulWidget {
  @override
  _TambahDataObatScreenState createState() => _TambahDataObatScreenState();
}

class _TambahDataObatScreenState extends State<TambahDataObatScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController kodeObatController = TextEditingController();
  final TextEditingController namaObatController = TextEditingController();
  final TextEditingController jenisObatController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController hargaObatController = TextEditingController();

  Future<void> tambahDataObat() async {
    if (_formKey.currentState!.validate()) {
      final Uri uri = Uri.parse('http://192.168.21.114/medical/create_obat.php');
      final response = await http.post(
        uri,
        body: {
          'kode_obat': kodeObatController.text,
          'nama_obat': namaObatController.text,
          'jenis_obat': jenisObatController.text,
          'stok': stokController.text,
          'harga_obat': hargaObatController.text,
        },
      );

      if (response.statusCode == 200) {
        // Data berhasil ditambahkan, navigasi ke tampilan data obat
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DataObatScreen(),
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
        title: Text('Tambah Data Obat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: kodeObatController,
                decoration: InputDecoration(labelText: 'Kode Obat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kode Obat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: namaObatController,
                decoration: InputDecoration(labelText: 'Nama Obat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Obat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: jenisObatController,
                decoration: InputDecoration(labelText: 'Jenis Obat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis Obat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: stokController,
                decoration: InputDecoration(labelText: 'Stok'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Stok tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: hargaObatController,
                decoration: InputDecoration(labelText: 'Harga Obat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga Obat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: tambahDataObat,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
