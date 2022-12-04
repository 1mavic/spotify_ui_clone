import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:spotify_clone_ui/ui/user_widgets/user_avatar_widget.dart';

/// library tab main screen. with user playlists
class UserLibraryScreen extends StatelessWidget {
  /// library tab main screen. with user playlists
  const UserLibraryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const UserAvatarWidget(),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Моя медиатека',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.add,
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size(
            double.infinity,
            60,
          ),
          child: _UserLibrariBottomWidget(),
        ),
      ),
      body: const Center(),
    );
  }
}

class _UserLibrariBottomWidget extends StatefulWidget {
  const _UserLibrariBottomWidget();

  @override
  State<_UserLibrariBottomWidget> createState() =>
      __UserLibrariBottomWidgetState();
}

class __UserLibrariBottomWidgetState extends State<_UserLibrariBottomWidget> {
  final List<Widget> _list = [];
  int? picked = null;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final _chips = [
    _ChipItem(
      index: 0,
      text: 'Плейлисты',
      picked: false,
    ),
    _ChipItem(
      index: 1,
      text: 'Альбомы',
      picked: false,
    ),
    _ChipItem(
      index: 2,
      text: 'Исполнители',
      picked: false,
    ),
  ];

  void onPick(int index) {
    final currentIndex = picked;
    if (index == -1 && currentIndex != null) {
      _list
        ..removeAt(0)
        ..insertAll(
          0,
          [
            _AppBarBottomItemWidget(
              item: _chips[currentIndex].copyWith(picked: false),
              onPick: onPick,
            ),
          ],
        );
      setState(() {
        picked = null;
      });
      return;
    }
    if (picked == null) {
      picked = index;
      final firstToDelete = index == 0 ? 1 : 0;
      final secondToDelete = firstToDelete == 1 ? 2 : 0;
      _list
        ..removeAt(firstToDelete)
        // ..removeAt(secondToDelete)
        ..insert(
          0,
          _CancelWidet(() {
            onPick(-1);
          }),
        );

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _list.addAll([
      _AppBarBottomItemWidget(
        item: _chips[0],
        onPick: onPick,
      ),
      _AppBarBottomItemWidget(
        item: _chips[1],
        onPick: onPick,
      ),
      _AppBarBottomItemWidget(
        item: _chips[2],
        onPick: onPick,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: 3,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 2.5,
                ),
                child: _list[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ChipItem {
  _ChipItem({
    required this.index,
    required this.text,
    required this.picked,
  });
  final int index;
  final String text;
  final bool picked;

  _ChipItem copyWith({
    int? index,
    String? text,
    bool? picked,
  }) {
    return _ChipItem(
      index: index ?? this.index,
      text: text ?? this.text,
      picked: picked ?? this.picked,
    );
  }
}

class _AppBarBottomItemWidget extends StatelessWidget {
  const _AppBarBottomItemWidget({
    required this.item,
    required this.onPick,
  });
  final _ChipItem item;
  final void Function(int) onPick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPick(item.index);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            35,
          ),
          color:
              item.picked ? Colors.greenAccent.shade400 : Colors.grey.shade800,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          child: Text(
            item.text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}

class _CancelWidet extends StatelessWidget {
  const _CancelWidet(
    this.onCancel,
  );
  final VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCancel,
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
            ),
            child: const Center(
              child: Icon(
                CupertinoIcons.clear,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
