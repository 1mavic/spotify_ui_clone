import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/entity/models/song.dart';
import 'package:spotify_clone_ui/home/ui/home_screen.dart';
import 'package:spotify_clone_ui/library/ui/user_library_screen.dart';
import 'package:spotify_clone_ui/search/ui/search_screen.dart';
import 'package:spotify_clone_ui/theme/app_theme.dart';
import 'package:spotify_clone_ui/ui/bottom_bar/app_bottom_bar.dart';
import 'package:spotify_clone_ui/ui/players/mini_player/mini_player.dart';

void main() {
  runApp(const MyApp());
}

/// MyApp Widget
class MyApp extends StatelessWidget {
  /// MyApp Widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ApplicationThemeData.theme,
      home: const MyHomePage(),
    );
  }
}

/// Home Page Widget with bottom bar and pages
class MyHomePage extends StatefulWidget {
  /// Home Page Widget with bottom bar and pages
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController tabController;
  bool _showPlayer = false;

  @override
  void initState() {
    super.initState();
    tabController = PageController();
  }

  void _changeTab(int newIndex) {
    setState(() {
      tabController.jumpToPage(newIndex - 1);
    });
  }

  final List<Widget> tabs = [
    const HomeScreen(),
    const SearchScreen(),
    const UserLibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            PageView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: tabs,
            ),
            Positioned(
              left: 5,
              right: 5,
              bottom: 90,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _showPlayer = !_showPlayer;
                  });
                },
                child: MiniPlayerWidget(
                  song: Song(
                    songId: 41,
                    name: 'Song name',
                    duration: const Duration(
                      minutes: 2,
                      seconds: 13,
                    ),
                  ),
                  color: Colors.brown,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AppBottomBarWidget(
                onTabChange: _changeTab,
              ),
            ),
            if (_showPlayer)
              AnimatedAlign(
                duration: const Duration(milliseconds: 400),
                alignment:
                    _showPlayer ? Alignment.center : Alignment.bottomCenter,
              ),
          ],
        ),
        // bottomNavigationBar: DecoratedBox(
        //   decoration: BoxDecoration(color: Colors.red.withOpacity(0.4)),
        //   child: BottomNavigationBar(
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.home),
        //         label: 'Home',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.business),
        //         label: 'Business',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.school),
        //         label: 'School',
        //       ),
        //     ],
        //     type: BottomNavigationBarType.fixed,
        //     currentIndex: _currentIndex,
        //     backgroundColor: Colors.transparent,
        //     unselectedItemColor: Colors.grey,
        //     selectedItemColor: Colors.white,
        //     onTap: _changeIndex,
        //   ),
        // ),
      ),
    );
  }
}
