import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? iconColor;
  final String? title;
  final bool isSelected;
  final void Function()? onPressed;
  final IconData icon;
  const RoundButton(
      {Key? key,
        this.isSelected = false,
        this.title,
        required this.icon,
        this.onPressed,
        this.buttonColor,
        this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          elevation: 0,
          color: isSelected?Colors.black54:buttonColor??Colors.white,
          onPressed: onPressed,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              icon,
              color: isSelected?Colors.white:iconColor??Colors.black54,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        if (title != null) Text(title!),
      ],
    );
  }
}