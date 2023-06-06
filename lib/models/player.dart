class Player {
  final int _initialLife = 20;
  late int _playerLife = _initialLife;

  int get playerLife => _playerLife;

  void heal() => _playerLife++;
  void damage() => _playerLife--;
  void reset() => _playerLife = _initialLife;
}
