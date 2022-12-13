import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/entity/models/album.dart';
import 'package:spotify_clone_ui/ui/image_widget/app_image.dart';

part './name_row_widget.dart';
part './timer_widget.dart';
part './controller_buttons.dart';
part './additional_buttons.dart';
part './lyrics_widget.dart';

/// full screen player widget
class PLayerWidget extends StatefulWidget {
  /// full screen player widget
  const PLayerWidget({
    super.key,
    required this.color,
    required this.album,
  });

  /// album to play in playlist
  final Album album;

  /// mini player color
  final Color color;

  @override
  State<PLayerWidget> createState() => _PLayerWidgetState();
}

class _PLayerWidgetState extends State<PLayerWidget>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  late AnimationController _animationController;
  late Animation<double> _animation;

  final color = Colors.amber;
  int _currentSong = 0;
  bool isPlaying = true;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  Future<void> _showOverlay(
    BuildContext context,
    String songName,
    String artistName,
    Color color,
  ) async {
    final overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;
    final topSize = 56 + MediaQuery.of(context).viewPadding.top;
    final renderObject = context.findRenderObject() as RenderBox?;
    final size = renderObject?.size;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                SizeTransition(
                  sizeFactor: _animation,
                  child: Container(
                    height: topSize,
                    color: color,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: IconButton(
                            onPressed: () {
                              _animationController.reverse();
                            },
                            icon: const Icon(
                              Icons.chevron_left_outlined,
                            ),
                          ),
                        ),
                        const Text(
                          'songName\nartistName',
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.flag_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Positioned(
                      left: 10 - 10 * _animation.value,
                      right: 10 - 10 * _animation.value,
                      top: topSize +
                          (1 - _animation.value) * ((size?.height ?? 0) + 30),
                      child: Container(
                        height: MediaQuery.of(context).size.height - topSize,
                        color: color,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        alignment: Alignment.center,
                        child: child,
                      ),
                    );
                  },
                  child: TextWidget(color: color),
                ),
              ],
            ),
          ),
        );
      },
    );
    _animationController.addListener(() {
      overlayState?.setState(() {});
      if (_animationController.isDismissed) {
        overlayEntry?.remove();
        overlayEntry = null;
      }
    });
    overlayState!.insert(overlayEntry!);
    unawaited(_animationController.forward());
  }

  @override
  Widget build(BuildContext context) {
    final covers = List.generate(
      widget.album.songs.length,
      (int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: AspectRatio(
          aspectRatio: 1,
          child: AppImageWidget(
            imageUrl: widget.album.cover,
          ),
        ),
      ),
    );
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              widget.color,
              Colors.black,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const RotatedBox(
                      quarterTurns: -1,
                      child: Icon(Icons.chevron_left_rounded),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.album.name,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width - 40,
                child: PageView(
                  controller: _controller,
                  children: covers,
                  onPageChanged: (value) {
                    setState(() {
                      _currentSong = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: _NameRowWidget(
                  songName: widget.album.songs[_currentSong].name,
                  artist: 'artist',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: _TimerWidget(
                  songDuration: widget.album.songs[_currentSong].duration,
                  isPLayng: isPlaying,
                  onSongEnd: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                    // _controller.jumpToPage(_currentSong + 1);
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: _ControllButtonsWidget(
                  onPlayPause: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  isPlaying: isPlaying,
                  onSwitch: (val) {
                    if (val > 0) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                      // _controller.jumpToPage(_currentSong + 1);
                      setState(() {});
                    } else {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                      // _controller.jumpToPage(_currentSong + 1);
                      setState(() {});
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: _AdditionalButtonsWidget(),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ).copyWith(
                  bottom: MediaQuery.of(context).viewPadding.bottom + 10,
                ),
                child: _LyricsWidget(
                  text: '',
                  color: color,
                  onFullScreen: (ctx) => _showOverlay(
                    ctx,
                    widget.album.songs[_currentSong].name,
                    'artist',
                    color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
