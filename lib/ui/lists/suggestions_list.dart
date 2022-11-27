import 'package:flutter/material.dart';

class SuggestionListWidget extends StatelessWidget {
  const SuggestionListWidget({
    Key? key,
    required this.cardSize,
    required this.name,
    required this.list,
  }) : super(key: key);
  final String? name;
  final double cardSize;
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
