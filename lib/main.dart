import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'dashboard.dart';
import 'data_dokter.dart';
import 'data_pasien_rawat_inap.dart';
import 'data_pasien_rawat_jalan.dart';
import 'data_diagnosa_rawat_inap.dart';
import 'data_diagnosa_rawat_jalan.dart';
import 'data_kamar.dart';
import 'data_obat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/login': (context) => LoginScreen(),
        '/data_dokter': (context) => DataDokterScreen(),
        '/data_pasien_rawat_inap': (context) => DataPasienRawatInapScreen(),
        '/data_pasien_rawat_jalan': (context) => DataPasienRawatJalanScreen(),
        '/data_diagnosa_rawat_inap': (context) => DataDiagnosaRawatInapScreen(),
        '/data_diagnosa_rawat_jalan': (context) => DataDiagnosaRawatJalanScreen(),
        '/data_kamar': (context) => DataKamarScreen(),
        '/data_obat': (context) => DataObatScreen(),
        
        

      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cover.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Hapus bagian teks yang ingin dihapus
            ],
          ),
        ),
      ),
    );
  }
}
