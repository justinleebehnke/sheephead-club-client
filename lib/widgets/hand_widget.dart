import 'package:flutter/material.dart';
import 'package:sheephead_client/widgets/card_widget.dart';

class PlayerHand extends StatefulWidget {
  final List<String> cardIdentifiers;

  const PlayerHand({Key? key, required this.cardIdentifiers}) : super(key: key);

  @override
  PlayerHandState createState() => PlayerHandState();
}

class PlayerHandState extends State<PlayerHand> {
  void _handleDragCompletion(String cardId) {
    print(cardId);
    setState(() {
      widget.cardIdentifiers.remove(cardId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Bottom'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.cardIdentifiers.map((cardId) {
            return Draggable<String>(
              data: cardId,
              feedback: Material(
                color: Colors.transparent,
                elevation: 4.0,
                child: CardWidget(cardId),
              ),
              childWhenDragging: Opacity(
                opacity: 0.5,
                child: CardWidget(cardId),
              ),
              onDragCompleted: () => _handleDragCompletion(cardId),
              child: CardWidget(cardId),
            );
          }).toList(),
        ),
        const Text('Score: 12')
      ],
    );
  }
}
