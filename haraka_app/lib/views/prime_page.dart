import 'package:flutter/material.dart';
import 'package:haraka_app/components/haraka_appbar.dart';
import 'package:haraka_app/utils/themes.dart';
import 'package:flutter/services.dart';

class PrimePage extends StatefulWidget {
  const PrimePage({Key? key}) : super(key: key);

  @override
  _PrimePageState createState() => _PrimePageState();
}

class _PrimePageState extends State<PrimePage> {
  int number = 0;
  bool isPrime = false;

  void checkPrime(int num) {
    if (num <= 1) {
      isPrime = false;
      return;
    }
    isPrime = true;
    for (int i = 2; i <= num / 2; i++) {
      if (num % i == 0) {
        isPrime = false;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: harakaAppBar(context, title: 'Bilangan Prima', leading: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Masukkan bilangan:',
                style: HarakaFonts(context).semiBoldInter(size: 20)),
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
                    number = int.tryParse(value) ?? 0;
                    checkPrime(number);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan bulat',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Bilangan $number ${isPrime ? 'adalah' : 'bukan'} bilangan prima',
              style: HarakaFonts(context).regularInter(size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
