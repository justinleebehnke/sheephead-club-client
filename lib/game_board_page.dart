import 'package:flutter/material.dart';
import 'package:sheephead_client/widgets/card_widget.dart';
import 'package:sheephead_client/widgets/player_widget.dart';
import 'package:sheephead_client/widgets/table_surface_widget.dart';

class GameBoard extends StatelessWidget {
  final List<PlayerWidget> playerWidgets;
  final List<String> cardsOnBoard;
  final bool isWaitingForPlayers;

  const GameBoard({
    super.key,
    required this.playerWidgets,
    required this.cardsOnBoard,
    required this.isWaitingForPlayers,
  });

  @override
  Widget build(BuildContext context) {
    Matrix4 matrix = Matrix4.identity();
    matrix.setEntry(3, 2, 0.001);
    matrix.rotateX(-0.5);
    return Scaffold(
      body: Stack(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: matrix,
            child: Transform.scale(
              scale: 1.5,
              child: Image.asset(
                'assets/dark-green.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            onPressed: () {
                              print(
                                  'User has chosen to leave after the current hand.');
                            },
                            child: const Text('Last hand'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topRight,
                          child: const Text('Hands played: 12'),
                        ),
                      )
                    ],
                  ),
                  TableTop(
                      playerWidgets: playerWidgets, cardsOnBoard: cardsOnBoard),
                  const Column(
                    children: [
                      Text('bottom'),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CardWidget('8_clubs'),
                            CardWidget('9_clubs'),
                            CardWidget('10_clubs'),
                            CardWidget('A_hearts'),
                            CardWidget('8_diamonds'),
                            CardWidget('9_spades'),
                          ]),
                      Text('Score: 12')
                    ],
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
