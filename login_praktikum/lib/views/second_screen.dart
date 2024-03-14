import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_praktikum/views/detailPage.dart';
import '../models/tourism_place.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(place: place)));
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.network(place.imageUrls[0]),
                  ),
                  Text(place.name),
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}
