import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheephead_client/game_board_page.dart';
import 'package:sheephead_client/widgets/player_widget.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sheephead.Club',
        home: GameBoard(
          cardsOnBoard: const [
            'J_diamonds',
            'Q_clubs',
            '10_diamonds',
          ],
          playerWidgets: [
            PlayerWidget(
                username: 'left',
                score: 0,
                isDealer: true,
                isPicker: true,
                isTheirTurn: true,
                isChopped: true),
            PlayerWidget(
                username: 'across',
                score: 0,
                isDealer: true,
                isPicker: true,
                isTheirTurn: true,
                isChopped: true),
            PlayerWidget(
                username: 'right',
                score: 0,
                isDealer: true,
                isPicker: true,
                isTheirTurn: true,
                isChopped: true),
          ],
          isWaitingForPlayers: false,
        ));
  }
}
