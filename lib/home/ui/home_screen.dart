import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/entity/models/artist.dart';
import 'package:spotify_clone_ui/entity/models/playlist.dart';
import 'package:spotify_clone_ui/home/ui/widgets/ui_widget.dart';
import 'package:spotify_clone_ui/ui/cards/cards.dart';
import 'package:spotify_clone_ui/ui/cards/search_card.dart';
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
                  PrevieCardWidget(
                    size: cardSized,
                    preview: Artist(
                      artistId: 1,
                      name: 'Husky',
                      photoUrl: 'assets/images/artists/husky.png',
                    ),
                  ),
                  PrevieCardWidget(
                    size: cardSized,
                    preview: Playlist(
                      playlistId: 2,
                      artists: [
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
                      ],
                      name: 'test play list',
                      playlistCover: 'assets/images/artists/husky.png',
                      songs: [],
                    ),
                  ),
                  SuggestionListWidget(
                    cardSize: cardSized,
                    name: 'playlist name',
                    list: [
                      PrevieCardWidget(
                        size: cardSized,
                        preview: Playlist(
                          playlistId: 2,
                          artists: [
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
                          ],
                          name: 'test play list',
                          playlistCover: 'assets/images/artists/husky.png',
                          songs: [],
                        ),
                      ),
                      PrevieCardWidget(
                        size: cardSized,
                        preview: Playlist(
                          playlistId: 2,
                          artists: [
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
                          ],
                          name: 'test play list',
                          playlistCover: 'assets/images/artists/husky.png',
                          songs: [],
                        ),
                      ),
                      PrevieCardWidget(
                        size: cardSized,
                        preview: Playlist(
                          playlistId: 2,
                          artists: [
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
                          ],
                          name: 'test play list',
                          playlistCover: 'assets/images/artists/husky.png',
                          songs: [],
                        ),
                      ),
                      PrevieCardWidget(
                        size: cardSized,
                        preview: Playlist(
                          playlistId: 2,
                          artists: [
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
                          ],
                          name: 'test play list',
                          playlistCover: 'assets/images/artists/husky.png',
                          songs: [],
                        ),
                      ),
                    ],
                  ),
                  SuggestionListWidget(
                    cardSize: cardSized,
                    name: 'artists suggestions',
                    list: [
                      PrevieCardWidget(
                        size: cardSized,
                        preview: Artist(
                          artistId: 1,
                          name: 'Husky',
                          photoUrl: 'assets/images/artists/husky.png',
                        ),
                      ),
                      PrevieCardWidget(
                        size: cardSized,
                        preview: Artist(
                          artistId: 1,
                          name: 'Husky',
                          photoUrl: 'assets/images/artists/husky.png',
                        ),
                      ),
                      PrevieCardWidget(
                        size: cardSized,
                        preview: Artist(
                          artistId: 1,
                          name: 'Husky',
                          photoUrl: 'assets/images/artists/husky.png',
                        ),
                      ),
                      PrevieCardWidget(
                        size: cardSized,
                        preview: Artist(
                          artistId: 1,
                          name: 'Husky',
                          photoUrl: 'assets/images/artists/husky.png',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.extent(
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
                      ],
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     SearchCardWidget(
                  //       cardColor: Colors.red,
                  //       url: null,
                  //       name: 'Test',
                  //     ),
                  //     SearchCardWidget(
                  //       cardColor: Colors.blue,
                  //       url: null,
                  //       name: 'Test',
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
