import 'package:flutter/material.dart';
import 'package:sheephead_client/game_board_page.dart';
import 'package:sheephead_client/widgets/player_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sheephead.Club',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color.fromARGB(255, 8, 166, 245),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.pinkAccent, // Previously known as 'accentColor'
          ),
          fontFamily: 'Montserrat',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyMedium: TextStyle(
                fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            filled: true,
            fillColor: Colors.grey[100],
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueGrey[700],
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey[700]),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ),
        home: GameBoard(
          cardsOnBoard: const ['JD', 'QC', 'TD', 'AS'],
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
