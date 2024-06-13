import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'data_diagnosa_rawat_inap.dart';

class TambahDataDiagnosaRawatInapScreen extends StatefulWidget {
  @override
  _TambahDataDiagnosaRawatInapScreenState createState() =>
      _TambahDataDiagnosaRawatInapScreenState();
}

class _TambahDataDiagnosaRawatInapScreenState
    extends State<TambahDataDiagnosaRawatInapScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController noDiagnosisController =
      TextEditingController();
  final TextEditingController tglDiagnosisController =
      TextEditingController();
  final TextEditingController hDiagnosisController = TextEditingController();

  List<DropdownMenuItem<String>> _listObat = [];
  String _selectedObat = '';

  List<DropdownMenuItem<String>> _listDokter = [];
  String _selectedDokter = '';

  List<DropdownMenuItem<String>> _listPasien = [];
  String _selectedPasien = '';

  @override
  void initState() {
    super.initState();
    _fetchObat();
    _fetchDokter();
    _fetchPasien();
  }

  Future<void> _fetchObat() async {
    final response = await http
        .get(Uri.parse('http://192.168.123.114/medical/read_obat.php'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<DropdownMenuItem<String>> obatItems = data.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem<String>(
          value: '${e['kode_obat']} - ${e['nama_obat']}',
          child: Text('${e['kode_obat']} - ${e['nama_obat']}'),
        );
      }).toList();
      setState(() {
        _listObat = obatItems;
        _selectedObat = _listObat.isNotEmpty ? _listObat[0].value! : '';
      });
    } else {
      throw Exception('Failed to load obat data');
    }
  }

  Future<void> _fetchDokter() async {
    final response = await http
        .get(Uri.parse('http://192.168.123.114/medical/read.php'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<DropdownMenuItem<String>> dokterItems = data.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem<String>(
          value: '${e['no_dokter']} - ${e['nama']}',
          child: Text('${e['no_dokter']} - ${e['nama']}'),
        );
      }).toList();
      setState(() {
        _listDokter = dokterItems;
        _selectedDokter = _listDokter.isNotEmpty ? _listDokter[0].value! : '';
      });
    } else {
      throw Exception('Failed to load dokter data');
    }
  }

  Future<void> _fetchPasien() async {
    final response = await http
        .get(Uri.parse('http://192.168.123.114/medical/read_pasien_rawat_inap.php'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<DropdownMenuItem<String>> pasienItems = data.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem<String>(
          value: '${e['No_RM_Inap']} - ${e['Nama_Pasien']}',
          child: Text('${e['No_RM_Inap']} - ${e['Nama_Pasien']}'),
        );
      }).toList();
      setState(() {
        _listPasien = pasienItems;
        _selectedPasien = _listPasien.isNotEmpty ? _listPasien[0].value! : '';
      });
    } else {
      throw Exception('Failed to load pasien data');
    }
  }

  Future<void> tambahDataDiagnosaRawatInap() async {
    if (_formKey.currentState!.validate()) {
      final Uri uri = Uri.parse(
          'http://192.168.123.114/medical/create_diagnosa_rawat_inap.php');
      final response = await http.post(
        uri,
        body: {
          'no_diag_inap': noDiagnosisController.text,
          'tgl_diagnosis': tglDiagnosisController.text,
          'no_rm_inap': _selectedPasien.split(' - ')[0],
          'nama_pasien': _selectedPasien.split('-')[1],
          'h_diagnosis': hDiagnosisController.text,
          'kd_obat': _selectedObat.split(' - ')[0],
          'nama_obat': _selectedObat.split(' - ')[1],
          'no_dokter': _selectedDokter.split(' - ')[0],
          'nama_dokter': _selectedDokter.split(' - ')[1],
        },
      );

      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DataDiagnosaRawatInapScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Gagal menyimpan data')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Diagnosa Rawat Inap'),
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
                  controller: noDiagnosisController,
                  decoration: InputDecoration(labelText: 'Nomor Diagnosis'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor diagnosis tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: tglDiagnosisController,
                  decoration:
                      InputDecoration(labelText: 'Tanggal Diagnosis'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tanggal diagnosis tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedPasien,
                  items: _listPasien,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPasien = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Nomor RM Rawat Inap',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor RM Rawat Inap - Nama Pasien tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: hDiagnosisController,
                  decoration: InputDecoration(labelText: 'Diagnosis'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Diagnosis tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedObat,
                  items: _listObat,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedObat = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Kode Obat',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kode obat - nama obat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedDokter,
                  items: _listDokter,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedDokter = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Nomor Dokter',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor dokter - nama dokter tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: tambahDataDiagnosaRawatInap,
                  child: Text('Tambah Data Diagnosa Rawat Inap'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
