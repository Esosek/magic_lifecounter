import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magic_lifecounter/components/action_button.dart';
import 'package:magic_lifecounter/models/player.dart';
import 'package:magic_lifecounter/provider/player_data.dart';
import 'package:magic_lifecounter/provider/custom_timer.dart';
import 'package:provider/provider.dart';

class PlayerDisplay extends StatelessWidget {
  const PlayerDisplay({
    super.key,
    required this.player,
  });

  final Player player;
  final int holdWaitDurationStep = 250;

  @override
  Widget build(BuildContext context) {
    return Consumer2<PlayerData, CustomTimer>(
        builder: (context, playerData, customTimer, child) {
      return Stack(
        children: [
          Row(
            children: [
              ActionButton(
                icon: Icons.remove,
                alignment: Alignment.centerLeft,
                actionCallback: () {
                  // damage player
                  playerData.damagePlayer(player);
                },
                onHoldStartCallback: () {
                  customTimer.setTimer(
                    Timer.periodic(Duration(milliseconds: holdWaitDurationStep),
                        (timer) {
                      playerData.damagePlayer(player);
                    }),
                  );
                },
                onHoldEndCallback: () {
                  customTimer.cancel();
                },
              ),
              ActionButton(
                icon: Icons.add,
                alignment: Alignment.centerRight,
                actionCallback: () {
                  // heal player
                  playerData.healPlayer(player);
                },
                onHoldStartCallback: () {
                  customTimer.setTimer(
                    Timer.periodic(Duration(milliseconds: holdWaitDurationStep),
                        (timer) {
                      playerData.healPlayer(player);
                    }),
                  );
                },
                onHoldEndCallback: () {
                  customTimer.cancel();
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
    });
  }
}
