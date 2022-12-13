import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/entity/models/artist.dart';
import 'package:spotify_clone_ui/ui/cards/artist_small_card.dart';
import 'package:spotify_clone_ui/ui/cards/search_card.dart';

part './suggestion_widget.dart';
part './search_body.dart';

/// Search tab initial screen
class SearchScreen extends StatefulWidget {
  /// Search tab initial screen
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearch = false;

  void changeSearch() {
    setState(() {
      isSearch = !isSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: isSearch
            ? _SearchBodyWidget(
                searchTap: changeSearch,
              )
            : _BodySuggestionsWidget(
                searchTap: changeSearch,
              ),
      ),
    );
  }
}
