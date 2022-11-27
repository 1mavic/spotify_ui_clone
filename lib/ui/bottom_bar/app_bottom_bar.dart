import 'package:flutter/material.dart';

part './bottom_button.dart';

/// application nested navigation bottom bar
class AppBottomBarWidget extends StatefulWidget {
  /// application nested navigation bottom bar
  const AppBottomBarWidget({
    super.key,
    required this.onTabChange,
  });

  /// Callback on tab icon tap. Returns new index of picked tab.
  final void Function(int) onTabChange;

  @override
  State<AppBottomBarWidget> createState() => _AppBottomBarWidgetState();
}

class _AppBottomBarWidgetState extends State<AppBottomBarWidget> {
  int _currentIndex = 1;
  void _changeTab(int newTab) {
    if (newTab == _currentIndex) {
      return;
    }
    setState(() {
      _currentIndex = newTab;
    });
    widget.onTabChange(newTab);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 86,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.85),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavButtonWidget(
              icon: Icons.home,
              text: 'home',
              selected: _currentIndex == 1,
              onTap: () => _changeTab(1),
            ),
            _BottomNavButtonWidget(
              icon: Icons.search,
              text: 'search',
              selected: _currentIndex == 2,
              onTap: () => _changeTab(2),
            ),
            _BottomNavButtonWidget(
              icon: Icons.stacked_bar_chart,
              text: 'library',
              selected: _currentIndex == 3,
              onTap: () => _changeTab(3),
            ),
          ],
        ),
      ),
    );
  }
}
