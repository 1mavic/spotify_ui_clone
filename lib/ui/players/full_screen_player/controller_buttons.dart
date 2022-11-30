part of './player_widget.dart';

class _ControllButtonsWidget extends StatefulWidget {
  const _ControllButtonsWidget({
    required this.onPlayPause,
    required this.onSwitch,
    required this.isPlaying,
  });
  final VoidCallback onPlayPause;
  final bool isPlaying;
  final void Function(int) onSwitch;

  @override
  State<_ControllButtonsWidget> createState() => _ControllButtonsWidgetState();
}

class _ControllButtonsWidgetState extends State<_ControllButtonsWidget> {
  bool _shuffle = false;
  bool _repeat = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _shuffle = !_shuffle;
            });
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                CupertinoIcons.shuffle,
                color: _shuffle ? Colors.greenAccent.shade400 : Colors.white,
              ),
              if (_shuffle)
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox.square(
                    dimension: 3,
                    child: ColoredBox(
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                ),
            ],
          ),
        ),
        InkWell(
          onTap: () => widget.onSwitch(-1),
          child: const Icon(
            Icons.skip_previous,
            size: 50,
          ),
        ),
        InkWell(
          onTap: widget.onPlayPause,
          child: Icon(
            widget.isPlaying
                ? Icons.pause_circle
                : Icons.play_circle_fill_outlined,
            size: 60,
          ),
        ),
        InkWell(
          onTap: () => widget.onSwitch(1),
          child: const Icon(
            Icons.skip_next,
            size: 50,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _repeat = !_repeat;
            });
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                CupertinoIcons.repeat,
                color: _repeat ? Colors.greenAccent.shade400 : Colors.white,
              ),
              if (_repeat)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox.square(
                    dimension: 3,
                    child: ColoredBox(
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
