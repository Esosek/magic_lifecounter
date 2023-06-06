import 'package:flutter/material.dart';
import 'package:magic_lifecounter/components/action_button.dart';
import 'package:magic_lifecounter/models/player.dart';
import 'package:magic_lifecounter/models/player_data.dart';
import 'package:provider/provider.dart';

class PlayerDisplay extends StatelessWidget {
  const PlayerDisplay({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            ActionButton(
              icon: Icons.remove,
              alignment: Alignment.centerLeft,
              actionCallback: () {
                // damage player
                Provider.of<PlayerData>(context, listen: false)
                    .damagePlayer(player);
              },
            ),
            ActionButton(
              icon: Icons.add,
              alignment: Alignment.centerRight,
              actionCallback: () {
                // heal player
                Provider.of<PlayerData>(context, listen: false)
                    .healPlayer(player);
              },
            ),
          ],
        ),
        Center(
          child: Text(
            player.playerLife.toString(),
            style: const TextStyle(fontSize: 95, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
