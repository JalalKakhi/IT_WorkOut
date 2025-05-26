import 'package:IT_workout/IT_workout/modules/exercisesScreen/exercises_screen.dart';
import 'package:IT_workout/IT_workout/modules/trainingScreen/training_screen.dart';
import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:IT_workout/IT_workout/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:IT_workout/main.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});
  Widget buildDayButton(int day,context) {
    return InkWell(
     onTap: (){
       navigate(context, ExercisesScreen());
     },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          '$day',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildWeekRow(int weekIndex,context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "week $weekIndex",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: List.generate(7, (index) {
              if (index == 6) {
                return Column(
                  children: [
                    buildDayButton(index + 1,context),
                    Icon(Icons.emoji_events, size: 20, color: Colors.grey),
                  ],
                );
              } else {
                return buildDayButton(index+1, context);
              }
            }),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Level plan"),
        ),
        body: Column(
          children: [
        
            Padding(
              padding:   const EdgeInsets.all(16.0),
              child:  Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Row
                  (
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage:AssetImage('assets/images/coach image.jpg'),
                    ),
                     const SizedBox(width: 10),
                     Expanded(
                       child: Text(
                         "complete this plan to move to the next level , lets get in shape ",
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                       
                       ),
                     ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => buildWeekRow(1,context),
                  separatorBuilder: (context, index) => makeSeparatorLine(),
                  itemCount: 10
              )
            ),
          ],
        ),
      ),
    );
  }
}
