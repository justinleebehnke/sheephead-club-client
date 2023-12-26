import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String cardIdentifier;

  const CardWidget(this.cardIdentifier, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/cards/$cardIdentifier.png",
      width: 60,
      height: 90,
    );
  }
}
