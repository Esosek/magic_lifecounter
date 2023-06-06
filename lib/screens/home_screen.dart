import 'package:flutter/material.dart';
import 'package:magic_lifecounter/components/player_display.dart';
import 'package:provider/provider.dart';
import 'package:magic_lifecounter/provider/player_data.dart';
import 'package:magic_lifecounter/provider/theme_toggle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerData>(
      builder: (context, playerData, child) {
        return Column(
          children: [
            Expanded(
                flex: 4,
                child: PlayerDisplay(
                  player: playerData.topPlayer,
                )),
            Expanded(
              flex: 1,
              child: Container(
                color: Provider.of<ThemeToggle>(context).isDarkTheme
                    ? Colors.grey.shade900
                    : Colors.blueAccent.shade100,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 5),
                      ),
                      onPressed: () => playerData.reset(),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        child: Text(
                          'Reset',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Theme'),
                        Consumer<ThemeToggle>(builder: (context, theme, child) {
                          return Switch(
                              value: theme.isDarkTheme,
                              activeColor: Colors.grey.shade300,
                              onChanged: (value) {
                                theme.toggleTheme();
                              });
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: PlayerDisplay(
                  player: playerData.bottomPlayer,
                ))
          ],
        );
      },
    );
  }
}
