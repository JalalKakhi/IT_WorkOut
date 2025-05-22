import 'dart:async';

import 'package:IT_workout/IT_workout/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState()..countDown();
}

class _TrainingScreenState extends State<TrainingScreen> {
  int timeLeft=30;
  void countDown(){
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
      if(timeLeft!=0)
      setState(() {
        timeLeft=timeLeft-1;
      });
    },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Lottie.asset("assets/lottie/Animation - 1747877646403.json"),

            ),
          ),
          Expanded(
            child: Container(
              child: CircularPercentIndicator(
                radius: 110.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 17.0,
                percent: 0.2,
                center: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.local_fire_department,size: 50,),
                    Text("$timeLeft",style: TextStyle(fontSize: 20),)
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: MyHexColors.grey,
                progressColor: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
