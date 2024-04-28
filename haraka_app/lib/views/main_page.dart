import 'package:flutter/material.dart';
import 'package:haraka_app/components/haraka_appbar.dart';
import 'package:haraka_app/components/loading.dart';
import 'package:haraka_app/db/shared_prefrences.dart';
import 'package:haraka_app/utils/themes.dart';
import 'package:haraka_app/views/help_page.dart';
import 'package:haraka_app/views/home_page.dart';
import 'package:haraka_app/views/login_page.dart';
import 'package:haraka_app/views/stopwatch_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late bool _isLoading = false;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    DBHelper().setPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (_currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const StopwatchPage();
        case 2:
          return const HelpPage();
        default:
          return const HomePage();
      }
    }

    return Stack(
      children: [
        Scaffold(
          appBar: harakaAppBar(context,
              title: 'HaRaKa App',
              automaticImplyLeading: false,
              action: [
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: HarakaColors.red,
                  ),
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    await Future.delayed((const Duration(seconds: 2)), () {
                      setState(() {
                        _isLoading = false;
                      });
                    });
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: HarakaColors.primary,
            backgroundColor: Colors.white,
            elevation: 20,
            iconSize: 32,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: HarakaColors.grey,
            showSelectedLabels: true,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.watch),
                label: 'StopWatch',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help),
                label: 'Bantuan',
              ),
            ],
          ),
          body: body(),
        ),
        LoadingScreen(loading: _isLoading)
      ],
    );
  }
}
