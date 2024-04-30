import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class DaysPage extends StatefulWidget {
  const DaysPage({super.key});

  @override
  State<DaysPage> createState() => _DaysPageState();
}

class _DaysPageState extends State<DaysPage> {
  int _input = 1;
  String _result = '';

  void _konversiHari() {
    if (_input >= 1 && _input <= 7) {
      switch (_input) {
        case 1:
          setState(() {
            _result = 'Senin';
          });
          break;
        case 2:
          setState(() {
            _result = 'Selasa';
          });
          break;
        case 3:
          setState(() {
            _result = 'Rabu';
          });
          break;
        case 4:
          setState(() {
            _result = 'Kamis';
          });
          break;
        case 5:
          setState(() {
            _result = 'Jumat';
          });
          break;
        case 6:
          setState(() {
            _result = 'Sabtu';
          });
          break;
        case 7:
          setState(() {
            _result = 'Minggu';
          });
          break;
      }
    } else {
      setState(() {
        _result = 'Input Angka 1-7!!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Konversi Hari",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Aplikasi Konversi Hari",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Hari',
                  hintText: 'Masukkan Angka Hari',
                  labelStyle:
                      TextStyle(fontSize: 20, color: Colors.grey.shade700),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[1-7]')),
                // Formatter yang berfungsi untuk menetapkan inputan dari userr
                // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
              ],
              onChanged: (value) {
                int? parsedValue = int.tryParse(value);
                if (parsedValue != null) {
                  setState(() {
                    _input = parsedValue;
                    _result = 'Klik Button';
                  });
                } else {
                  setState(() {
                    _result = 'Input Angka 1-7!!';
                  });
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _konversiHari();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Konversi Hari',
                style: GoogleFonts.poppins(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: $_result',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
