import 'package:flutter/material.dart';
import 'package:sheephead_client/widgets/player_widget.dart';
import 'package:sheephead_client/widgets/trick_widget.dart';

class TableTop extends StatelessWidget {
  final List<PlayerWidget> playerWidgets;
  final List<String> cardsOnBoard;

  const TableTop({
    super.key,
    required this.playerWidgets,
    required this.cardsOnBoard,
  });

  @override
  Widget build(BuildContext context) {
    Matrix4 matrix = Matrix4.identity();
    matrix.setEntry(3, 2, 0.001);
    matrix.rotateX(-0.65);
    return Transform(
      alignment: Alignment.center,
      transform: matrix,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  alignment: Alignment.topCenter,
                  child: playerWidgets[1]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 1),
              playerWidgets[0],
              TrickWidget(
                  key: key,
                  startingPosition: StartingPosition.left,
                  cardIds: cardsOnBoard),
              playerWidgets[2],
              const SizedBox(width: 1),
            ],
          )
        ],
      ),
    );
  }
}
