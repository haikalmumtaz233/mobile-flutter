import 'package:haraka_app/utils/themes.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Untuk Menggunakan Aplikasi ini',
                    style: HarakaFonts(context).semiBoldInter(size: 18)),
                const SizedBox(height: 10),
                Text('1. Ketika dihalaman login masukan username dan password',
                    style: HarakaFonts(context).regularInter(size: 13)),
                const SizedBox(height: 10),
                Text(
                    '2. Terdapat 5 Menu pada halaman Home (Anggota, Prima, Segitiga, Situs Rekomendasi, Favorite)',
                    style: HarakaFonts(context).regularInter(size: 13)),
                const SizedBox(height: 10),
                Text(
                    '3. Terdapat 3 Menu pada Bottom Navigation Bar (Home, StopWatch, Bantuan)',
                    style: HarakaFonts(context).regularInter(size: 13)),
                const SizedBox(height: 10),
                Text(
                    '4. Menu Home menampilkan 5 menu utama pada aplikasi yang dapat dipilih pada Bottom Navigation Bar',
                    style: HarakaFonts(context).regularInter(size: 13)),
                const SizedBox(height: 10),
                Text(
                    '5. Menu StopWatch berisikan fitur yang dapat digunakan sebagai alat StopWatch yang dapat dipilih pada Bottom Navigation Bar',
                    style: HarakaFonts(context).regularInter(size: 13)),
                const SizedBox(height: 10),
                Text(
                    '6. Menu Bantuan menampilkan panduan penggunaan aplikasi yang dapat dipilih pada Bottom Navigation Bar',
                    style: HarakaFonts(context).regularInter(size: 13)),
                const SizedBox(height: 10),
                Text(
                    '7. Menu Anggota berisi data data angota yang mengerjakan aplikasi ini',
                    style: HarakaFonts(context).regularInter(size: 13)),
                const SizedBox(height: 10),
                Text('8. Menu Prima merupakan menu menampilkan bilangan prima',
                    style: HarakaFonts(context).regularInter(size: 13)),
                const SizedBox(height: 10),
                Text(
                    '9. Menu Segitiga merupakan menu yang memiliki fitur untuk penghitung luas dan keliling segitiga',
                    style: HarakaFonts(context).regularInter(size: 13)),
                Text(
                    '10. Menu Situs Rekomendasi merupakan menu yang menampilkan situs-situs bermanfaat dari rekomendasi anggota',
                    style: HarakaFonts(context).regularInter(size: 13)),
                Text(
                    '11. Menu Favorite merupakan menu yang menampilkan situs yang telah diberi checkmark favorite pada menu Situs Rekomendasi',
                    style: HarakaFonts(context).regularInter(size: 13)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
