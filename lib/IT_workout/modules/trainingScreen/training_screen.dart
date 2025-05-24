import 'dart:async';

import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
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
  int timeDone=0;
  void countDown(){
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
      if(timeLeft!=0) {
        setState(() {
        timeLeft=timeLeft-1;
        timeDone++;
      });
      }
      else{
        // move to the next exercise by moving the index( i really cant decide how before see the api)
      }
    },
    );
  }
  Widget exerciseImage(){
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Lottie.asset("assets/lottie/Animation - 1747877646403.json"),
      ),
    );
  }
  Widget restart_pause(){
    return Row(
      children: [
        Expanded(
            child: makeMaterialButton(color: MyHexColors.redGradientColors[3], border: false)
        ),
        SizedBox(width: 10,),
        Expanded(
            child: makeMaterialButton(border: true)
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Exercise",),
        ),
        body:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(child: Text("exercise name ".toUpperCase(), style: Theme.of(context).textTheme.titleLarge,)),
              exerciseImage(),
              Text("$timeLeft",style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: restart_pause(),
              ),
              TextButton(onPressed: (){}, child: Text("Skip",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey),))


            ],
          ),
        ),


      ),
    );
  }
}
