import 'package:flutter/material.dart';

void main() {
  runApp(LuasSegitigaApp());
}

class LuasSegitigaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luas Segitiga',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LuasSegitigaHomePage(),
    );
  }
}

class LuasSegitigaHomePage extends StatefulWidget {
  @override
  _LuasSegitigaHomePageState createState() => _LuasSegitigaHomePageState();
}

class _LuasSegitigaHomePageState extends State {
  double alas = 0.0;
  double tinggi = 0.0;
  double luas = 0.0;

  void hitungLuas() {
    setState(() {
      luas = 0.5 * alas * tinggi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Luas Segitiga'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Masukkan alas:',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    alas = double.tryParse(value) ?? 0.0;
                    hitungLuas();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan alas segitiga',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Masukkan tinggi:',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    tinggi = double.tryParse(value) ?? 0.0;
                    hitungLuas();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan tinggi segitiga',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Luas Segitiga: $luas',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
