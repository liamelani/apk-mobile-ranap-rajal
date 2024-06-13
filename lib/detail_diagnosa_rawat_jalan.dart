import 'package:flutter/material.dart';

class DetailDiagnosaRawatJalanScreen extends StatelessWidget {
  final Map<String, dynamic> diagnosis;

  DetailDiagnosaRawatJalanScreen({required this.diagnosis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Diagnosa Rawat Jalan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Pasien: ${diagnosis['nama_pasien']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Tanggal Diagnosis: ${diagnosis['tgl_diagnosis']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Diagnosis: ${diagnosis['h_diagnosis']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            
            Text(
              'Nama Obat: ${diagnosis['nama_obat']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            
            Text(
              'Nama Dokter: ${diagnosis['nama_dokter']}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
