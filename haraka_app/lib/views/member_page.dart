import 'package:flutter/material.dart';
import 'package:haraka_app/components/haraka_appbar.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  MemberPageState createState() => MemberPageState();
}

class MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: harakaAppBar(context, title: 'Daftar Anggota', leading: true),
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
                          children: [
                            Text(
                              'Nama : Muhammad Raditya Haikal Mumtaz',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'NIM  : 123210062',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
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
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          'assets/images/nayaka.jpg',
                          width: 120,
                          height: 120,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Nama : Nayaka Rafif Sutaprawira',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'NIM  : 123210158',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
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
              SizedBox(height: 20), // Add space
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          'assets/images/hamid.jpg',
                          width: 120,
                          height: 120,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Nama : Sholahulhaq Nur Hamid',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'NIM  : 123210151',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
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
