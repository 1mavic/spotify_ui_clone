import 'package:flutter/material.dart';

/// list of suggestions artist, albums and playlists
class SuggestionListWidget extends StatelessWidget {
  /// list of suggestions artist, albums and playlists
  const SuggestionListWidget({
    super.key,
    required this.cardSize,
    required this.name,
    required this.list,
  });

  /// name of suggestion list
  final String? name;

  /// size of individual card
  final double cardSize;

  /// list of suggestions widgets
  final List<Widget> list;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            name ?? '',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: cardSize + 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            itemBuilder: (BuildContext context, int index) => list[index],
            separatorBuilder: (_, __) => const SizedBox(
              width: 10,
            ),
            itemCount: list.length,
          ),
        )
      ],
    );
  }
}
