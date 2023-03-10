import 'package:flutter/material.dart';

import 'button_model.dart';
class DialNums extends StatelessWidget {
  final DialNumModel model;
  final void Function()? onPressed;
  const DialNums({Key? key, required this.model, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
              child: Text(
                model.num,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Text(
              model.letters,
              style: TextStyle(fontSize: 8),
            )
          ]),
        ),
      ),
    );
  }
}