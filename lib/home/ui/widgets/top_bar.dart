import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Widget on top of home Screen, with setting buttons
class TopBarWidget extends StatelessWidget {
  /// Widget on top of home Screen, with setting buttons
  const TopBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 3,
            child: Text(
              'Good evening',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.history,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.gear_big,
            ),
          ),
        ],
      ),
    );
  }
}
