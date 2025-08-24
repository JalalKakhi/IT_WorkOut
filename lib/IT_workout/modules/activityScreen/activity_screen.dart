import 'package:IT_workout/IT_workout/modules/activityScreen/activity_cubit.dart/activityCubit.dart';
import 'package:IT_workout/IT_workout/modules/activityScreen/activity_cubit.dart/activityState.dart';
import 'package:IT_workout/IT_workout/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActivityScreen extends StatelessWidget {
  Widget giveKcalIndicator({
    required int target_kcal,
    required int kcal,
  }) =>
      Container(
        child: new CircularPercentIndicator(
          radius: 110.0,
          animation: true,
          animationDuration: 1200,
          lineWidth: 17.0,
          percent: ((kcal ?? 0) / (target_kcal != 0 ? target_kcal : 1 ?? 1)),
          center: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.local_fire_department,
                size: 50,
              ),
              Text(
                "${kcal ?? '0'}/${target_kcal ?? '1'} KCAL",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: MyHexColors.grey,
          progressColor: Colors.red,
        ),
        height: 300,
      );
  Widget giveDailyGoalSection() => Column(
        children: [
          const Center(
              child: Text(
            "Daily Goal",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          // a row of work outs and minutes
          Container(
            color: MyHexColors.grey,
            padding: EdgeInsets.symmetric(vertical: 3),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "workouts",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text(
                  "|",
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "minuites",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<activityCubit, activityState>(
      builder: (BuildContext context, activityState state) {
        var cubit = activityCubit.get(context);
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
          child: ListView(
            children: [
              // kalories indicator
              giveKcalIndicator(
                  kcal:
                      cubit.userModel!.data!.total_calories_burned_in_day ?? 0,
                  target_kcal: cubit.userModel!.data!.target_calories ?? 1),
              // daily goal
              giveDailyGoalSection(),
              SizedBox(
                height: 10,
              ),
              //Bmi calculator
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        //height: MediaQuery.sizeOf(context).height/5,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.red,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BMI",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Center(
                              child: Text(
                                "0 kg / m2",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Very Severely Obese",
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.red),
                    child: const Center(
                      child: Text(
                        "check now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
      listener: (BuildContext context, activityState state) {},
    );
  }
}
