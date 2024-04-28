import 'package:flutter/material.dart';
import 'package:haraka_app/components/haraka_appbar.dart';
import 'package:haraka_app/utils/themes.dart';
import 'package:flutter/services.dart';

class TrianglePage extends StatefulWidget {
  const TrianglePage({Key? key}) : super(key: key);

  @override
  _TrianglePageState createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
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
      appBar:
          harakaAppBar(context, title: 'Penghitung Segitiga', leading: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Masukkan alas:',
                style: HarakaFonts(context).semiBoldInter(size: 18)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
                  // Formatter yang berfungsi untuk menetapkan inputan dari userr
                  // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
                ],
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
            Text('Masukkan tinggi:',
                style: HarakaFonts(context).semiBoldInter(size: 18)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
                  // Formatter yang berfungsi untuk menetapkan inputan dari userr
                  // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
                ],
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
              style: HarakaFonts(context).regularInter(size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
