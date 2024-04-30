import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class TrapesiumPage extends StatefulWidget {
  const TrapesiumPage({super.key});

  @override
  State<TrapesiumPage> createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  double alas = 0.0;
  double tinggi = 0.0;
  double luasTrapesium = 0.0;
  double kelilingTrapesium = 0.0;
  double sisiAtas = 0.0;
  double sisiMiring1 = 0.0;
  double sisiMiring2 = 0.0;

  void hitungLuas() {
    if (alas == 0.0 || sisiAtas == 0.0 || tinggi == 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Isi semua nilai yang dibutuhkan!'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          action: SnackBarAction(label: 'Ok', onPressed: () {}),
        ),
      );
    } else {
      setState(() {
        luasTrapesium = 0.5 * (alas + sisiAtas) * tinggi;
      });
    }
  }

  void hitungKeliling() {
    if (alas == 0.0 ||
        sisiAtas == 0.0 ||
        sisiMiring1 == 0.0 ||
        sisiMiring2 == 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Isi semua nilai yang dibutuhkan!'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          action: SnackBarAction(label: 'Ok', onPressed: () {}),
        ),
      );
    } else {
      setState(() {
        kelilingTrapesium = alas + sisiAtas + sisiMiring1 + sisiMiring2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Trapesium",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              // Expanded untuk tetapkan agar memenuhi ruang kosong
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      "Aplikasi Penghitung Luas dan Keliling Trapesium",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Alas',
                          hintText: 'Masukkan Alas',
                          labelStyle: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
                        // Formatter yang berfungsi untuk menetapkan inputan dari userr
                        // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
                      ],
                      onChanged: (value) {
                        alas = double.tryParse(value) ?? 0;
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Sisi Atas',
                          hintText: 'Masukkan Sisi Atas',
                          labelStyle: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
                        // Formatter yang berfungsi untuk menetapkan inputan dari userr
                        // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
                      ],
                      onChanged: (value) {
                        sisiAtas = double.tryParse(value) ?? 0;
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Sisi Miring 1',
                          hintText: 'Masukkan Sisi Miring 1',
                          labelStyle: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
                        // Formatter yang berfungsi untuk menetapkan inputan dari userr
                        // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
                      ],
                      onChanged: (value) {
                        sisiMiring1 = double.tryParse(value) ?? 0;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Sisi Miring 2',
                          hintText: 'Masukkan Sisi Miring 2',
                          labelStyle: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
                        // Formatter yang berfungsi untuk menetapkan inputan dari userr
                        // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
                      ],
                      onChanged: (value) {
                        sisiMiring2 = double.tryParse(value) ?? 0;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Tinggi',
                          hintText: 'Masukkan Tinggi',
                          labelStyle: TextStyle(
                              fontSize: 15, color: Colors.grey.shade700),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
                        // Formatter yang berfungsi untuk menetapkan inputan dari userr
                        // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
                      ],
                      onChanged: (value) {
                        tinggi = double.tryParse(value) ?? 0;
                      },
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                hitungLuas();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(16),
                                backgroundColor: Colors.blue[700],
                                foregroundColor: Colors.white,
                              ),
                              child: Text(
                                'Hitung Luas',
                                style: GoogleFonts.poppins(fontSize: 24),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Luas Trapesium: $luasTrapesium',
                              style: GoogleFonts.poppins(fontSize: 20.0),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                hitungKeliling();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(16),
                                backgroundColor: Colors.blue[700],
                                foregroundColor: Colors.white,
                              ),
                              child: Text(
                                'Hitung Keliling',
                                style: GoogleFonts.poppins(fontSize: 24),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Keliling: $kelilingTrapesium',
                              style: GoogleFonts.poppins(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
