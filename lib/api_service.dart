import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchDoctors() async {
  var url = Uri.parse('http://127.0.0.1:8000/api/doctors'); // Mengubah string URL menjadi objek Uri
  var response = await http.get(url);
  
  if (response.statusCode == 200) {
    // Data berhasil diambil
    List<dynamic> data = jsonDecode(response.body)['data'];
    return data;
  } else {
    // Gagal mengambil data
    throw Exception('Failed to load data');
  }
}
