import 'package:flutter/material.dart';
import 'package:magic_lifecounter/const.dart';
import 'package:provider/provider.dart';
import 'package:magic_lifecounter/provider/theme_toggle.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.icon,
      required this.alignment,
      required this.actionCallback,
      required this.onHoldStartCallback,
      required this.onHoldEndCallback});

  final IconData icon;
  final Alignment alignment;
  final Function actionCallback;
  final Function onHoldStartCallback;
  final Function onHoldEndCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => actionCallback(),
      onTapDown: (value) => onHoldStartCallback(),
      onTapUp: (value) => onHoldEndCallback(),
      child: Ink(
          color: Provider.of<ThemeToggle>(context).isDarkTheme
              ? Colors.grey.shade800
              : Colors.white,
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
