import 'package:flutter/material.dart';
import 'package:goals_app/widgets/goal_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 3,
              width: 3,
            );
          },
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: GoalCard(),
            );
          }
        )
      ),
    );
  }
}