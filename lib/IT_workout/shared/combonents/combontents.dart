import 'package:IT_workout/IT_workout/modules/trainingScreen/training_screen.dart';
import 'package:IT_workout/IT_workout/shared/style/colors.dart';
import 'package:flutter/material.dart';

Widget WorkoutShape (context) =>InkWell(
  onTap: (){
    navigate(context, TrainingScreen());
  },
  child: Container(
    width: double.infinity,
    height: MediaQuery.sizeOf(context).height/9,
    decoration: BoxDecoration(
        color: Colors.white
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width/5,
          height: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: MyHexColors.redGradientColors
            ),
            borderRadius:  BorderRadiusDirectional.circular(20),
          ),
          child: Image(
            image: AssetImage('assets/icons/muscles.png'),
          ),
        ),
        SizedBox(width: 15,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Abs Exercises'.toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height:10 ,),
              Text("20 min ^ 16 Exercise",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),),
            ],
          ),
        )
      ],
    ),
  ),
);

void navigate(context,Widget screen){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
}