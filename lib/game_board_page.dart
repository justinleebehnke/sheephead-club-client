import 'package:flutter/material.dart';
import 'package:sheephead_client/widgets/player_widget.dart';
import 'package:sheephead_client/widgets/trick_widget.dart';

class GameBoard extends StatelessWidget {
  final List<PlayerWidget> playerWidgets;
  final List<String> cardsOnBoard;
  final bool isWaitingForPlayers;

  GameBoard({
    required this.playerWidgets,
    required this.cardsOnBoard,
    required this.isWaitingForPlayers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        decoration: const BoxDecoration(color: Colors.amber),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Positioned(
                  bottom: 20, // Adjust the position as needed
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        print(
                            'User has chosen to leave after the current hand.');
                      },
                      child: Text('Leave'),
                    ),
                  ),
                ),
                playerWidgets[1],
                const SizedBox(width: 130.0)
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                playerWidgets[0],
                TrickWidget(
                    key: key,
                    startingPosition: StartingPosition.left,
                    cardIds: cardsOnBoard),
                playerWidgets[2],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
