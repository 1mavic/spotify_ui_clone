part of './player_widget.dart';

class _LyricsWidget extends StatelessWidget {
  const _LyricsWidget({
    required this.text,
    required this.color,
    required this.onFullScreen,
  });
  final String text;
  final Color color;
  final void Function(BuildContext) onFullScreen;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            4,
          ),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    'Lyrics',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => onFullScreen(context),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                          0.8,
                        ),
                        borderRadius: BorderRadius.circular(
                          45,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          8,
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'MORE',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                CupertinoIcons.fullscreen,
                                size: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: TextWidget(
                  color: color,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(
                      45,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.ios_share_rounded,
                          size: 15,
                        ),
                        Text(
                          'SHARE',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget with song lyrics with scroll
class TextWidget extends StatelessWidget {
  /// Widget with song lyrics with scroll
  const TextWidget({
    super.key,
    required this.color,
  });

  /// background color
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Text(
            lyrics,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Color.lerp(
                    color,
                    Colors.black,
                    0.6,
                  ),
                ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber.withOpacity(0.1),
                    Colors.amber,
                  ],
                  stops: const [
                    0.6,
                    1,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber.withOpacity(0.1),
                    Colors.amber,
                  ],
                  stops: const [
                    0,
                    0.4,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// test song lyrics
const lyrics = '''
I follow the Moskva down to Gorky Park
Listening to the wind of change
An August summer night, soldiers passing by
Listening to the wind of change
(*Whistling*)

The world is closing in
And did you ever think
That we could be so close like brothers?
The future's in the air, I can feel it everywhere
Blowing with the wind of change
[Chorus]
Take me to the magic of the moment
On a glory night
Where the children of tomorrow dream away (Dream away)
In the wind of change
Hmm

Walking down the street
And distant memories are buried in the past forever
I follow the Moskva and down to Gorky Park
Listening to the wind of change

Take me (Take me) to the magic of the moment
On a glory night (A glory night)
Where the children of tomorrow share their dreams (share their dreams)
With you and me (You and me)

Take me (Take me) to the magic of the moment
On a glory night (A glory night)
Where the children of tomorrow dream away (Dream away)
In the wind of change (The wind of change)

The wind of change blows straight into the face of time
Like a storm wind that will ring the freedom bell
For peace of mind
Let your balalaika sing what my guitar wants to say (say)''';
