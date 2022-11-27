part of './app_bottom_bar.dart';

class _BottomNavButtonWidget extends StatelessWidget {
  const _BottomNavButtonWidget({
    required this.icon,
    required this.text,
    required this.selected,
    required this.onTap,
  });
  final IconData icon;
  final String text;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    const selectedColor = Colors.white;
    const notSelectedColor = Colors.grey;
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: selected ? selectedColor : notSelectedColor,
            size: 30,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: selected ? selectedColor : notSelectedColor,
          ),
        ),
      ],
    );
  }
}
