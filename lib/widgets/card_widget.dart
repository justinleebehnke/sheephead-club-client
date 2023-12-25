import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String cardIdentifier;

  const CardWidget(this.cardIdentifier, {super.key});

  String getSuitSymbol() {
    final suit = cardIdentifier.substring(cardIdentifier.length - 1);
    switch (suit) {
      case 'C':
        return '♣';
      case 'D':
        return '♦';
      case 'H':
        return '♥';
      case 'S':
        return '♠';
      default:
        return '';
    }
  }

  String getRank() {
    return cardIdentifier.substring(0, cardIdentifier.length - 1);
  }

  Color getColor() {
    return getSuitSymbol() == '♣' || getSuitSymbol() == '♠'
        ? Colors.black
        : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 60,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getRank() + getSuitSymbol(),
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: getColor()),
            ),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
