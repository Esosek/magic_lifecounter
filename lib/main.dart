import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'provider/player_data.dart';
import 'provider/theme_toggle.dart';
import 'provider/custom_timer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeToggle()),
        Provider<CustomTimer>(create: (context) => CustomTimer()),
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: Provider.of<ThemeToggle>(context).isDarkTheme
              ? ThemeData.dark()
              : ThemeData.light(),
          home: SafeArea(
            child: ChangeNotifierProvider(
              create: (context) => PlayerData(),
              child: const Scaffold(
                body: HomeScreen(),
              ),
            ),
          ),
        );
      },
    );
  }
}
