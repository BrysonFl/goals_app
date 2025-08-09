import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({ super.key });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello world'),
              ],
            )
          ],
        )
      ),
      onTap: () => print('Hello world'),
    );
  }
}