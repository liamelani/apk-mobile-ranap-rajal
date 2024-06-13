import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data_kamar.dart';

class TambahDataKamarScreen extends StatefulWidget {
  @override
  _TambahDataKamarScreenState createState() => _TambahDataKamarScreenState();
}

class _TambahDataKamarScreenState extends State<TambahDataKamarScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController noTempatTidurController = TextEditingController();
  final TextEditingController ruangController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController diIsiOlehController = TextEditingController();
  final TextEditingController hargaKamarController = TextEditingController();

  Future<void> tambahDataKamar() async {
    if (_formKey.currentState!.validate()) {
      final Uri uri = Uri.parse('http://192.168.21.114/medical/create_kamar.php');
      final response = await http.post(
        uri,
        body: {
          'no_tempat_tidur': noTempatTidurController.text,
          'ruang': ruangController.text,
          'status': statusController.text,
          'di_isi_oleh': diIsiOlehController.text,
          'harga_kamar': hargaKamarController.text,
        },
      );

      if (response.statusCode == 200) {
        // Data berhasil ditambahkan, navigasi ke tampilan data kamar
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DataKamarScreen(),
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
        title: Text('Tambah Data Kamar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: noTempatTidurController,
                decoration: InputDecoration(labelText: 'Nomor Tempat Tidur'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor Tempat Tidur tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ruangController,
                decoration: InputDecoration(labelText: 'Ruang'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ruang tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: statusController,
                decoration: InputDecoration(labelText: 'Status'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Status tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: diIsiOlehController,
                decoration: InputDecoration(labelText: 'Diisi Oleh'),
              ),
              TextFormField(
                controller: hargaKamarController,
                decoration: InputDecoration(labelText: 'Harga Kamar'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga Kamar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: tambahDataKamar,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
