import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class KubusPage extends StatefulWidget {
  const KubusPage({super.key});

  @override
  State<KubusPage> createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  double sisi = 0.0;
  double volumeKubus = 0.0;
  double kelilingKubus = 0.0;

  void hitungVolumeKubus() {
    setState(() {
      volumeKubus = sisi * sisi * sisi;
    });
  }

  void hitungKelilingKubus() {
    setState(() {
      kelilingKubus = 12 * sisi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Aplikasi Kubus",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Aplikasi Penghitung Volume dan Keliling Kubus",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Sisi',
                      hintText: 'Masukkan Sisi Kubus',
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade700),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
                    // Formatter yang berfungsi untuk menetapkan inputan dari userr
                    // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
                  ],
                  onChanged: (value) {
                    sisi = double.tryParse(value) ?? 0;
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        hitungVolumeKubus();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        'Hitung Volume',
                        style: GoogleFonts.poppins(fontSize: 22),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Volume Kubus: $volumeKubus',
                      style: GoogleFonts.poppins(fontSize: 18.0),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        hitungKelilingKubus();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        'Hitung Keliling',
                        style: GoogleFonts.poppins(fontSize: 22),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Keliling Kubus: $kelilingKubus',
                      style: GoogleFonts.poppins(fontSize: 18.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
