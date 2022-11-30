part of './mini_player.dart';

class _MiniProgressBarWidget extends StatefulWidget {
  const _MiniProgressBarWidget({
    required this.songDuration,
    required this.onSongEnd,
    required this.isPlaing,
  });
  final Duration songDuration;
  final VoidCallback onSongEnd;
  final bool isPlaing;
  @override
  State<_MiniProgressBarWidget> createState() => __MiniProgressBarWidgetState();
}

class __MiniProgressBarWidgetState extends State<_MiniProgressBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.songDuration)
          ..addListener(() {
            setState(() {});
          });
    final curve = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _animation = Tween<double>(begin: 0, end: 1).animate(curve);
  }

  @override
  void didUpdateWidget(covariant _MiniProgressBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPlaing != widget.isPlaing) {
      if (widget.isPlaing) {
        play();
      } else {
        stop();
      }
    }
  }

  void play() {
    _controller.forward();
  }

  void stop() {
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2,
      color: Colors.white.withOpacity(0.6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: _animation.value,
          child: Container(
            color: Colors.white,
            height: 2,
          ),
        ),
      ),
    );
  }
}
