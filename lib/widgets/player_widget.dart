import 'package:flutter/material.dart';

class PlayerWidget extends StatelessWidget {
  final String username;
  final int score;
  final bool isDealer;
  final bool isPicker;
  final bool isTheirTurn;
  final bool isChopped;

  PlayerWidget(
      {required this.username,
      required this.score,
      required this.isDealer,
      required this.isPicker,
      required this.isTheirTurn,
      required this.isChopped});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            username,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            'Score: $score',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              if (isDealer)
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: const Text(
                    'D',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (isPicker)
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: const Text(
                    'P',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (isChopped)
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: const Text(
                    'C',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
