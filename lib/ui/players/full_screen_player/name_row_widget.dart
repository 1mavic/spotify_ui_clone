part of './player_widget.dart';

class _NameRowWidget extends StatelessWidget {
  const _NameRowWidget({
    required this.songName,
    required this.artist,
  });
  final String songName;
  final String artist;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 20),
              ),
              Text(
                artist,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: Colors.greenAccent.shade400,
          ),
        ),
      ],
    );
  }
}
