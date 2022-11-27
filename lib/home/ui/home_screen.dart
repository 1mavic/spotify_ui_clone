import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/home/ui/widgets/ui_widget.dart';
import 'package:spotify_clone_ui/ui/cards/cards.dart';
import 'package:spotify_clone_ui/ui/lists/suggestions_list.dart';

/// Screen of home tab. Contains artist and playlist lists
class HomeScreen extends StatelessWidget {
  /// Screen of home tab. Contains artist and playlist lists
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardSized = (MediaQuery.of(context).size.width - 30) / 2.3;
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const TopBarWidget(),
            Container(
              height: 1500,
              width: double.infinity,
              color: Colors.grey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SingerCardWidget(
                    size: cardSized,
                    name: 'HuskyHuskyHuskyHuskyHusky',
                    imageUrl: 'assets/images/artists/husky.png',
                    onTap: () {
                      log('artist tap');
                    },
                  ),
                  PlayListCardWidget(
                    size: cardSized,
                    names: const [
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
                  SuggestionListWidget(
                    cardSize: cardSized,
                    name: "playlist name",
                    list: [
                      PlayListCardWidget(
                        size: cardSized,
                        names: const [
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
                      PlayListCardWidget(
                        size: cardSized,
                        names: const [
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
                      PlayListCardWidget(
                        size: cardSized,
                        names: const [
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
                      PlayListCardWidget(
                        size: cardSized,
                        names: const [
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
                  SuggestionListWidget(
                    cardSize: cardSized,
                    name: "playlist name",
                    list: [
                      PlayListCardWidget(
                        size: cardSized,
                        names: const [
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
                      PlayListCardWidget(
                        size: cardSized,
                        names: const [
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
                      PlayListCardWidget(
                        size: cardSized,
                        names: const [
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
                      PlayListCardWidget(
                        size: cardSized,
                        names: const [
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
