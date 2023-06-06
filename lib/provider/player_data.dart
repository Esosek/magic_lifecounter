import 'package:flutter/material.dart';
import 'package:magic_lifecounter/models/player.dart';

class PlayerData extends ChangeNotifier {
  final Player _topPlayer = Player();
  final Player _bottomPlayer = Player();

  Player get topPlayer => _topPlayer;
  Player get bottomPlayer => _bottomPlayer;

  void damagePlayer(Player player) {
    player.damage();
    notifyListeners();
  }

  void healPlayer(Player player) {
    player.heal();
    notifyListeners();
  }

  void reset() {
    _topPlayer.reset();
    _bottomPlayer.reset();
    notifyListeners();
  }
}
