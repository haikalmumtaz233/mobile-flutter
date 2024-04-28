import 'dart:convert';

import 'package:haraka_app/components/flushbar.dart';
import 'package:haraka_app/components/haraka_appbar.dart';
import 'package:haraka_app/db/local.dart';
import 'package:haraka_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  final List<Map<String, dynamic>> linkRekomendations = [
    {
      'id': 1,
      'name': 'Flutter',
      'link': 'https://flutter.dev/',
      'image':
          'https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png',
      'description':
          'Google\'s UI toolkit for building natively compiled applications for mobile, web, and desktop.',
    },
    {
      'id': 2,
      'name': 'Dart',
      'link': 'https://dart.dev/',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Dart_programming_language_logo.svg/2560px-Dart_programming_language_logo.svg.png',
      'description':
          'Dart is a general-purpose, object-oriented programming language used to develop web, mobile, server, and desktop applications.'
    },
    {
      'id': 3,
      'name': 'React',
      'link': 'https://react.dev/',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/1200px-React-icon.svg.png',
      'description':
          'React is a JavaScript library for building user interfaces. It lets you create reusable components that encapsulate data and logic.'
    },
    {
      'id': 4,
      'name': 'Tailwind',
      'link': 'https://tailwindcss.com/',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tailwind_CSS_Logo.svg/1024px-Tailwind_CSS_Logo.svg.png',
      'description':
          'Tailwind CSS is a utility-first CSS framework for rapidly building modern websites.'
    },
    {
      'id': 5,
      'name': 'Python',
      'link': 'https://www.python.org/',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1869px-Python-logo-notext.svg.png',
      'description':
          'Python is a general-purpose, high-level programming language known for its readability and ease of use.'
    },
    {
      'id': 6,
      'name': 'TensorFlow',
      'link': 'https://www.tensorflow.org/',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Tensorflow_logo.svg/1200px-Tensorflow_logo.svg.png',
      'description':
          'TensorFlow is an open-source software library for numerical computation using data flow graphs.'
    },
    {
      'id': 7,
      'name': 'Arduino',
      'link': 'https://www.arduino.cc/',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Arduino_Logo.svg/2560px-Arduino_Logo.svg.png',
      'description':
          'Arduino is an open-source electronics platform based on easy-to-use hardware and software.'
    },
    {
      'id': 8,
      'name': 'C++',
      'link': 'https://cplusplus.com/',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/3/32/C%2B%2B_logo.png',
      'description':
          'C++ is a general-purpose, imperative programming language known for its performance and efficiency.'
    },
  ];

  _launchURL(dynamic url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<dynamic> items = [];

  Future<void> _loadItems() async {
    final source = SaveToLocalDb.getString('favorite');
    List<dynamic> itemsDb = source == null ? [] : jsonDecode(source);
    if (itemsDb.isNotEmpty) {
      setState(() {
        items = itemsDb;
      });
    }
  }

  @override
  void initState() {
    _loadItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: harakaAppBar(context, title: 'Situs Rekomendasi', leading: true),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom yang diinginkan
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: linkRekomendations.length,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  _launchURL(Uri.parse(linkRekomendations[index]['link']));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.network(
                          linkRekomendations[index]['image'],
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('${linkRekomendations[index]['description']}',
                          style: HarakaFonts(context).regularInter(size: 12)),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(linkRekomendations[index]['name'],
                              style: HarakaFonts(context).boldInter(size: 16)),
                          IconButton(
                            onPressed: () {
                              if (items.every((item) =>
                                  item['id'] !=
                                  linkRekomendations[index]['id'])) {
                                setState(() {
                                  items.add(linkRekomendations[index]);
                                });
                                SaveToLocalDb.setString(
                                    'favorite', jsonEncode(items));
                                alert(context,
                                    icon: Icons.check,
                                    color: Colors.green,
                                    text:
                                        'Situs ${linkRekomendations[index]['name']} berhasil ditambahkan ke favorite');
                              } else {
                                items.removeWhere((item) =>
                                    item['id'] ==
                                    linkRekomendations[index]['id']);
                                alert(context,
                                    icon: Icons.delete,
                                    color: Colors.red,
                                    text:
                                        'Situs ${linkRekomendations[index]['name']} berhasil di hapus dari favorite');
                                SaveToLocalDb.setString(
                                    'favorite', jsonEncode(items));
                                setState(() {
                                  _loadItems();
                                });
                              }
                            },
                            icon: Icon(
                                items.every((item) =>
                                        item['id'] !=
                                        linkRekomendations[index]['id'])
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color: Colors.red),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
