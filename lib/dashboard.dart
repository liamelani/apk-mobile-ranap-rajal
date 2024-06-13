import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Lia Melani',
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  'lia@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Data Dokter'),
                onTap: () {
                  Navigator.pushNamed(context, '/data_dokter');
                },
              ),
              ExpansionTile(
                leading: Icon(Icons.people),
                title: Text('Data Pasien'),
                children: <Widget>[
                  ListTile(
                    title: Text('Rawat Inap'),
                    onTap: () {
                      Navigator.pushNamed(context, '/data_pasien_rawat_inap');
                    },
                  ),
                  ListTile(
                    title: Text('Rawat Jalan'),
                    onTap: () {
                      Navigator.pushNamed(context, '/data_pasien_rawat_jalan');
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.local_hospital),
                title: Text('Data diagnosa'),
                children: <Widget>[
                  ListTile(
                    title: Text('Rawat Inap'),
                    onTap: () {
                      Navigator.pushNamed(context, '/data_diagnosa_rawat_inap');
                    },
                  ),
                  ListTile(
                    title: Text('Rawat Jalan'),
                    onTap: () {
                      Navigator.pushNamed(context, '/data_diagnosa_rawat_jalan');
                    },
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.local_hospital),
                title: Text('Data Kamar'),
                onTap: () {
                  Navigator.pushNamed(context, '/data_kamar');
                },
              ),
              ListTile(
                leading: Icon(Icons.local_pharmacy),
                title: Text('Data Obat'),
                onTap: () {
                  Navigator.pushNamed(context, '/data_obat');
                },
              ),
               
              Divider(
                color: Colors.white,
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade800],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.dashboard,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                "Welcome to",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                "Your Dashboard",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
