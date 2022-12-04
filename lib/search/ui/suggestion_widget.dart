part of 'search_screen.dart';

class _BodySuggestionsWidget extends StatelessWidget {
  const _BodySuggestionsWidget({
    required this.searchTap,
  });
  final VoidCallback searchTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
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
            ),
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.black,
              titleSpacing: 0,
              toolbarHeight: 80,
              title: GestureDetector(
                onTap: searchTap,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      6,
                    ),
                  ),
                  width: double.infinity,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.search,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'What do you want to hear?',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.black,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverGrid.extent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.3 / 1,
              children: _testCards,
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 110,
              ),
            )
          ],
        ),
      ),
    );
  }
}

const _testCards = [
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
  )
];
