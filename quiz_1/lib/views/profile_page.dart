import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.8, // Lebar elemen tetap (sama untuk setiap card)
                child: Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Align text to the left
                    children: [
                      SizedBox(height: 10.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          'assets/images/haikal.jpg',
                          width: 120,
                          height: 120,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the left
                          children: [
                            Text(
                              'Nama : Muhammad Raditya Haikal Mumtaz',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'NIM  : 123210062',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Kelas  : Teknologi dan Pemrograman Mobile IF-A',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Hobby  : Bermain Game',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
