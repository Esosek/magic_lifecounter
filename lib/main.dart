import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'models/player_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => PlayerData(),
          child: const Scaffold(
            body: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
