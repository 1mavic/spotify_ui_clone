import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/ui/cards/search_card.dart';

/// Search tab initial screen
class SearchScreen extends StatelessWidget {
  /// Search tab initial screen
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Поиск',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Icon(
                    Icons.camera_alt_outlined,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    6,
                  ),
                ),
                width: double.infinity,
                height: 40,
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.extent(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.3 / 1,
                children: const [
                  SearchCardWidget(
                    cardColor: Colors.red,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test ',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.blue,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.amber,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test ',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.purple,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.orange,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test ',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.blue,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.green,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test ',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.greenAccent,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.grey,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test ',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.blueGrey,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.indigo,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test ',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.pink,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.lightGreen,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test ',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.cyan,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.deepOrangeAccent,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test ',
                  ),
                  SearchCardWidget(
                    cardColor: Colors.blue,
                    photo: 'assets/images/artists/husky.png',
                    name: 'Test',
                  ),
                ],
              ),
              const SizedBox(
                height: 110,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
