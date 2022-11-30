part of './player_widget.dart';

class _AdditionalButtonsWidget extends StatelessWidget {
  const _AdditionalButtonsWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(
          Icons.speaker_group_outlined,
        ),
        Spacer(),
        Icon(
          Icons.ios_share_rounded,
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          CupertinoIcons.list_bullet_below_rectangle,
        ),
      ],
    );
  }
}
