import 'package:flutter/material.dart';

/// widget with user avatar
class UserAvatarWidget extends StatelessWidget {
  /// widget with user avatar
  const UserAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.greenAccent.shade400,
            ),
            child: Center(
              child: Text(
                'A',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
