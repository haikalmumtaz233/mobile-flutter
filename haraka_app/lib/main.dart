import 'package:flutter/material.dart';
import 'package:haraka_app/utils/themes.dart';
import 'package:haraka_app/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HaRaKa App',
      theme: ThemeData(
        fontFamily: 'InterRegular',
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: HarakaColors.primary,
        focusColor: HarakaColors.primary,
        dividerColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
