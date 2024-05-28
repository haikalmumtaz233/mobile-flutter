import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_galaxy/views/notification_page.dart';

class SaranPage extends StatelessWidget {
  const SaranPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          'Game Galaxy',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPage()),
              );
            },
            icon: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saran Dan Kesan Mata Kuliah Teknologi Pemrograman Mobile",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                _buildFeedbackItem("1. ",
                    "Untuk ujian setidaknya diperbolehkan untuk membawa cheatsheet 1 lembar HVS atau bahkan open book"),
                _buildFeedbackItem("2. ",
                    "Untuk pengerjaan waktu kuis bisa diperpanjang lagi"),
                // Add more feedback items here as needed
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackItem(String number, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(number),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
