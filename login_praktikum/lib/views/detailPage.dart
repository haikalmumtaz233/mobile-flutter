import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_praktikum/models/tourism_place.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final TourismPlace place;
  const DetailScreen({super.key, required this.place});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.name),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.network(widget.place.imageUrls[0]),
          ),
          Text(widget.place.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text(widget.place.description),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchedUrl('https://spada.upnyk.ac.id');
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launchedUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
