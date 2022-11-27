import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/home/ui/widgets/ui_widget.dart';
import 'package:spotify_clone_ui/ui/cards/cards.dart';

/// Screen of home tab. Contains artist and playlist lists
class HomeScreen extends StatelessWidget {
  /// Screen of home tab. Contains artist and playlist lists
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const TopBarWidget(),
            Container(
              height: 1000,
              width: double.infinity,
              color: Colors.grey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SingerCardWidget(
                    size: 200,
                    name: 'HuskyHuskyHuskyHuskyHusky',
                    imageUrl: 'assets/images/artists/husky.png',
                    onTap: () {
                      log('artist tap');
                    },
                  ),
                  PlayListCardWidget(
                    size: 200,
                    names: const [
                      'Husky',
                      'Husky',
                      'Husky',
                      'Husky',
                      'Husky',
                      'Husky',
                      'Husky',
                      'Husky',
                      'Husky',
                      'Husky',
                      'Husky',
                      'Husky',
                    ],
                    imageUrl: 'assets/images/artists/husky.png',
                    onTap: () {
                      log('artist tap');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
