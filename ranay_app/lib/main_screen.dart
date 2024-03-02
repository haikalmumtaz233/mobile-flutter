import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ranay_app/calculator_page.dart';
import 'package:ranay_app/even_odd_page.dart';
import 'package:ranay_app/about_page.dart';
import 'package:ranay_app/login_page.dart';

class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen>{
  int _currentIndex = 0;
  final List<Widget> _pages = [CalculatorPage(), EvenOddPage(), AboutPage()]; // List untuk setiap halaman

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              'HaRaKa App',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                icon: new Icon(Icons.logout), color: Colors.white),
          ],
          backgroundColor: Colors.blue,
        ),
        body: _pages[_currentIndex], // body akan mengikuti var currentIndex (0)
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              activeIcon: Icon(
                Icons.calculate,
                color: Colors.blue,
              ),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.numbers_outlined),
              activeIcon: Icon(
                Icons.numbers,
                color: Colors.blue,
              ),
              label: 'Even Odd',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              label: 'About',
            ),
          ],
          onTap: (index) { // Membuat bottom navigation bar bisa berpindah halaman
            setState(() {
              _currentIndex = index;
            });
          }
        ),
    );
  }
}