// class Doctor {
//   final int id;
//   final String noDokter;
//   final String nama;
//   final String spesialisasi;
//   final DateTime diterima;
//   final String noHp;
//   final String alamat;

//   Doctor({
//     required this.id,
//     required this.noDokter,
//     required this.nama,
//     required this.spesialisasi,
//     required this.diterima,
//     required this.noHp,
//     required this.alamat,
//   });

//   factory Doctor.fromJson(Map<String, dynamic> json) {
//     return Doctor(
//       id: json['id'],
//       noDokter: json['no_dokter'],
//       nama: json['nama'],
//       spesialisasi: json['spesialisasi'],
//       diterima: DateTime.parse(json['diterima']),
//       noHp: json['no_hp'],
//       alamat: json['alamat'],
//     );
//   }
// }