import 'package:flutter/material.dart';
import 'package:magic_lifecounter/const.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.icon,
      required this.alignment,
      required this.actionCallback});

  final IconData icon;
  final Alignment alignment;
  final Function actionCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => actionCallback(),
      child: Ink(
          color: Colors.grey.shade800,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width / 2,
          child: Align(
            alignment: alignment,
            child: Icon(
              icon,
              size: kIncrementIconSize,
            ),
          )),
    );
  }
}
