part of './player_widget.dart';

class _TimerWidget extends StatefulWidget {
  const _TimerWidget({
    required this.songDuration,
    required this.onSongEnd,
    required this.isPLayng,
  });
  final Duration songDuration;
  final VoidCallback onSongEnd;
  final bool isPLayng;
  @override
  State<_TimerWidget> createState() => __TimerWidgetState();
}

class __TimerWidgetState extends State<_TimerWidget>
    with SingleTickerProviderStateMixin {
  Duration _currentDuration = Duration.zero;
  late AnimationController _controller;
  late Animation<double> _animation;
  late Stopwatch _timer;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.songDuration)
          ..addListener(() {
            setState(() {});
            if (!mounted) {
              return;
            }
            if (_controller.status == AnimationStatus.completed) {
              widget.onSongEnd();
            }
          });
    final curve = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _animation = Tween<double>(begin: 0, end: 1).animate(curve);
    _timer = Stopwatch()..start();
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant _TimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPLayng != widget.isPLayng) {
      if (widget.isPLayng) {
        _controller.forward();
        _timer.start();
      } else {
        _controller.stop();
        _timer.start();
      }
    }
    if (oldWidget.songDuration != widget.songDuration) {
      _controller
        ..reset()
        ..duration = widget.songDuration;
      _timer.reset();
      if (widget.isPLayng) {
        _controller.forward();
        _timer.start();
      }
    }
  }

  @override
  void dispose() {
    _timer.stop();
    _controller.dispose();
    super.dispose();
  }

  String getTimeString(Duration duration) {
    final seconds = (duration.inSeconds - (duration.inMinutes * 60))
        .toString()
        .padLeft(2, '0');
    return '${duration.inMinutes}:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    _currentDuration = _timer.elapsed;
    return Column(
      children: [
        SizedBox(
          height: 8,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 2,
                  width: double.infinity,
                  child: ColoredBox(
                    color: Colors.white.withOpacity(
                      0.5,
                    ),
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        // log(_animation.value.toString());
                        return FractionallySizedBox(
                          widthFactor: _animation.value,
                          alignment: Alignment.centerLeft,
                          child: const ColoredBox(
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final align = (_animation.value - 0.5) * 2;
                  return SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment(
                        align,
                        0,
                      ),
                      child: child,
                    ),
                  );
                },
                child: const SizedBox(
                  height: 8,
                  width: 8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getTimeString(_currentDuration),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              getTimeString(
                Duration(
                  seconds: widget.songDuration.inSeconds -
                      _currentDuration.inSeconds,
                ),
              ),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
