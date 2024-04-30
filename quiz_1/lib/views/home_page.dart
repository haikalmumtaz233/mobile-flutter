import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_1/components/hover.dart';
import 'package:quiz_1/views/days_page.dart';
import 'package:quiz_1/views/kubus_page.dart';
import 'package:quiz_1/views/trapesium_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Daftar Menu
  final List<Map<String, dynamic>> contents = [
    {
      'name': 'Trapesium',
      'icon': Icons.shape_line,
      'color': Colors.blue,
      'link': const TrapesiumPage(),
    },
    {
      'name': 'Konversi Hari',
      'icon': Icons.calculate,
      'color': Colors.black,
      'link': const DaysPage(),
    },
    {
      'name': 'Kubus',
      'icon': Icons.view_in_ar_outlined,
      'color': Colors.red,
      'link': const KubusPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: contents
              .map(
                (data) => Hover(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => data['link']));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 3,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 1),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          data['icon'],
                          size: 32,
                          color: data['color'],
                        ),
                        const SizedBox(height: 10),
                        Text(data['name'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
