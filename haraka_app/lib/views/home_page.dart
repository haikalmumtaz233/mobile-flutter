import 'package:flutter/material.dart';
import 'package:haraka_app/components/hover.dart';
import 'package:haraka_app/utils/themes.dart';
import 'package:haraka_app/views/member_page.dart';
import 'package:haraka_app/views/favorite_page.dart';
import 'package:haraka_app/views/prime_page.dart';
import 'package:haraka_app/views/recommend_page.dart';
import 'package:haraka_app/views/triangle_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Daftar Menu
  final List<Map<String, dynamic>> contents = [
    {
      'name': 'Anggota',
      'icon': Icons.person,
      'color': Colors.blue,
      'link': const MemberPage(),
    },
    {
      'name': 'Bilangan Prima',
      'icon': Icons.calculate,
      'color': HarakaColors.black,
      'link': const PrimePage(),
    },
    {
      'name': 'Segitiga',
      'icon': Icons.format_shapes,
      'color': HarakaColors.red,
      'link': const TrianglePage(),
    },
    {
      'name': 'Situs Rekomendasi',
      'icon': Icons.recommend,
      'color': Colors.green,
      'link': const RecommendPage(),
    },
    {
      'name': 'Favorite',
      'icon': Icons.favorite,
      'color': Colors.red,
      'link': const FavoritePage(),
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
                          color: HarakaColors.shadow.withOpacity(0.5),
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
                            style: HarakaFonts(context).boldInter(size: 16)),
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
