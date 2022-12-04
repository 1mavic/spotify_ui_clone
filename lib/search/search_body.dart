part of 'search_screen.dart';

class _SearchBodyWidget extends StatelessWidget {
  const _SearchBodyWidget({
    required this.searchTap,
  });

  final VoidCallback searchTap;
  @override
  Widget build(BuildContext context) {
    final searchHistory = _searchHistory;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: CupertinoSearchTextField(
          backgroundColor: Colors.grey.shade900,
          itemColor: Colors.white,
          suffixIcon: const Icon(
            CupertinoIcons.clear_thick,
          ),
          borderRadius: BorderRadius.circular(
            6,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          InkWell(
            onTap: searchTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
              ),
              child: Center(
                child: Text(
                  'Отмена',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ).copyWith(
          top: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'История поиска',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
              ),
              ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    SmallArtistCardWidget(
                      artist: searchHistory[index],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 18,
                      width: 18,
                      child: IconButton(
                        splashRadius: 18,
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          CupertinoIcons.xmark,
                          color: Colors.grey.shade500,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                ),
                itemCount: searchHistory.length,
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          35,
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                        child: Text(
                          'Очистить историю поиска',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final _searchHistory = [
  Artist(
    artistId: 1,
    name: 'Husky',
    photoUrl: 'assets/images/artists/husky.png',
  ),
  Artist(
    artistId: 1,
    name: 'Husky',
    photoUrl: 'assets/images/artists/husky.png',
  )
];
