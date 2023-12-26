import 'package:flutter/material.dart';
import 'package:sheephead_client/widgets/card_widget.dart';

enum StartingPosition { left, right, across, down }

class TrickWidget extends StatelessWidget {
  final StartingPosition startingPosition;
  final List<String> cardIds;

  const TrickWidget(
      {required key, required this.startingPosition, required this.cardIds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StartingPosition> positions = sliceAndRearrange(startingPosition);
    List<Widget> cards = _getCardWidgetsFromIds(cardIds);

    return SizedBox(
      width: 160,
      height: 200,
      child: Stack(
        children: cards
            .asMap()
            .map((int index, Widget card) {
              return MapEntry(index, _positionCard(card, positions[index]));
            })
            .values
            .toList(),
      ),
    );
  }

  List<StartingPosition> sliceAndRearrange(StartingPosition positionToSplit) {
    List<StartingPosition> positions = [
      StartingPosition.left,
      StartingPosition.across,
      StartingPosition.right,
      StartingPosition.down
    ];
    int splitIndex = positions.indexOf(positionToSplit);
    List<StartingPosition> firstHalf = positions.sublist(0, splitIndex);
    List<StartingPosition> secondHalf = positions.sublist(splitIndex);
    return secondHalf + firstHalf;
  }

  List<Widget> _getCardWidgetsFromIds(List<String> cardIds) {
    return cardIds.map((id) => CardWidget(id)).toList();
  }

  Widget _positionCard(Widget cardWidget, StartingPosition startingPosition) {
    const cardOffsetIncrement = 50.0;
    const double stackCenterX = 50.0;
    const double stackCenterY = 50.0;

    double dx = 0.0;
    double dy = 0.0;

    switch (startingPosition) {
      case StartingPosition.right:
        dx = stackCenterX + (cardOffsetIncrement);
        dy = stackCenterY;
        break;
      case StartingPosition.left:
        dx = stackCenterX - (cardOffsetIncrement);
        dy = stackCenterY;
        break;
      case StartingPosition.across:
        dx = stackCenterX;
        dy = stackCenterY - (cardOffsetIncrement);
        break;
      case StartingPosition.down:
        dx = stackCenterX;
        dy = stackCenterY + (cardOffsetIncrement);
        break;
    }

    return Positioned(
      left: dx,
      top: dy,
      child: cardWidget,
    );
  }
}
