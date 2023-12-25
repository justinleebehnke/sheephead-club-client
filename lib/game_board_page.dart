import 'package:flutter/material.dart';
import 'package:sheephead_client/widgets/card_widget.dart';
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
      body: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(color: Colors.blueGrey),
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
                  Container(
                      alignment: Alignment.topLeft, child: playerWidgets[1]),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: const Text('Hands played: 12'),
                    ),
                  )
                ],
              ),
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
              const Column(
                children: [
                  Text('bottom'),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CardWidget('8C'),
                    CardWidget('9C'),
                    CardWidget('TC'),
                    CardWidget('AC'),
                    CardWidget('8C'),
                    CardWidget('9C'),
                  ]),
                  Text('Score: 12')
                ],
              )
            ]),
      ),
    );
  }
}
