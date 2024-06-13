import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data_pasien_rawat_inap.dart';

class TambahDataPasienRawatInapScreen extends StatefulWidget {
  @override
  _TambahDataPasienRawatInapScreenState createState() => _TambahDataPasienRawatInapScreenState();
}

class _TambahDataPasienRawatInapScreenState extends State<TambahDataPasienRawatInapScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController namaPasienController = TextEditingController();
  final TextEditingController noRmController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController umurController = TextEditingController();
  final TextEditingController tglMasukController = TextEditingController();

  Future<void> tambahDataPasien() async {
    if (_formKey.currentState!.validate()) {
      final Uri uri = Uri.parse('http://192.168.123.114/medical/create_pasien_rawat_inap.php');
      final response = await http.post(
        uri,
        body: {
          'no_rm': noRmController.text,
          'nama_pasien': namaPasienController.text,
          'jenis_kelamin': jenisKelaminController.text,
          'alamat': alamatController.text,
          'telepon': teleponController.text,
          'umur': umurController.text,
          'tgl_masuk': tglMasukController.text,
        },
      );

      if (mounted) {
        if (response.statusCode == 200) {
          // Data berhasil disimpan, navigasi ke tampilan data pasien rawat inap
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => DataPasienRawatInapScreen(),
            ),
          );
        } else {
          // Gagal menyimpan data, tampilkan pesan kesalahan kepada pengguna
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal menyimpan data')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Pasien Rawat Inap'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: namaPasienController,
                  decoration: InputDecoration(labelText: 'Nama Pasien'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama pasien tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: noRmController,
                  decoration: InputDecoration(labelText: 'Nomor RM'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor RM tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: jenisKelaminController,
                  decoration: InputDecoration(labelText: 'Jenis Kelamin'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jenis kelamin tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: alamatController,
                  decoration: InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: teleponController,
                  decoration: InputDecoration(labelText: 'Telepon'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor telepon tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: umurController,
                  decoration: InputDecoration(labelText: 'Umur'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Umur tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: tglMasukController,
                  decoration: InputDecoration(labelText: 'Tanggal Masuk'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tanggal masuk tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    tambahDataPasien();
                  },
                  child: Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
