import 'package:IT_workout/IT_workout/modules/trainingScreen/training_screen.dart';
import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:IT_workout/IT_workout/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';





class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  Widget _headBox(context,String bigTitle,String smallTitle){
    return Container(
      height: MediaQuery.of(context).size.height*1/10,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyHexColors.grey,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Text(bigTitle,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),

          Text(smallTitle,style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),)
        ],
      ),
    );
  }

  Widget _exerciseItem(context,String image, String name, String reps ){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.circle,color: MyHexColors.grey,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: MediaQuery.sizeOf(context).height*1.2/10,
              child: Lottie.asset(image)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(name,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),

              Text(reps,style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),)
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Day 1"),
        ),
        body:Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // head
                  Row(
                    children: [
                      Expanded(
                        child: _headBox(context, "7 mins", "duration")
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: _headBox(context, "11", "exercises")
                      )
                    ],
                  ),
                  //title
                  SizedBox(height: 10,),
                  Text("Exercises",style: Theme.of(context).textTheme.titleLarge,),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder:(context, index) =>  _exerciseItem(context,"assets/lottie/Animation - 1747877646403.json","sit ups", "20 reps"),
                        separatorBuilder:(context, index) => makeSeparatorLine() ,
                        itemCount: 10
                    ),
                  )
                  //list of exercises
              
                ],
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: makeMaterialButton(
                    border: false,
                    name: "start",
                    color: MyHexColors.redGradientColors[3],
                    width: double.infinity,
                    onPressed: (){
                      navigate(context, TrainingScreen());
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
