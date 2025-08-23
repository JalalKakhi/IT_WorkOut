import 'package:IT_workout/IT_workout/layout/layout_screen.dart';
import 'package:IT_workout/IT_workout/modules/setting/settingCubit/setting_cubit.dart';
import 'package:IT_workout/IT_workout/modules/setting/settingCubit/setting_states.dart';
import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Bmi> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingStates>(
        builder: (context, state) {
          var cubit = SettingCubit.get(context);
          bool isMale = cubit.userModel?.data!.gender == "Male" ? true : false;
          int age = 18;
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 75,
              title: Text(
                'Colculate your bmi to track your progres',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.red),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Flushbar(
                                title: 'Home work out',
                                message:
                                    'you should change your gender from the setting sceen',
                                duration: const Duration(seconds: 3),
                                flushbarPosition: FlushbarPosition.BOTTOM,
                                flushbarStyle: FlushbarStyle.FLOATING,
                                reverseAnimationCurve: Curves.decelerate,
                                forwardAnimationCurve: Curves.elasticOut,
                                backgroundColor: Colors.yellow,
                                boxShadows: [
                                  BoxShadow(
                                    color: Colors.yellow,
                                    offset: Offset(0, 2),
                                  )
                                ],
                                isDismissible: false,
                                icon: Icon(
                                  Icons.error_outline,
                                  color: Colors.yellow,
                                ),
                                showProgressIndicator: true,
                              ).show(context);
                            });
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: isMale ? Colors.red : Colors.grey),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.male_outlined,
                                  color: Colors.black,
                                  size: 70,
                                ),
                                Text(
                                  'MALE',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Flushbar(
                                title: 'Home work out',
                                message:
                                    'you should change your gender from the setting sceen',
                                duration: const Duration(seconds: 3),
                                flushbarPosition: FlushbarPosition.BOTTOM,
                                flushbarStyle: FlushbarStyle.FLOATING,
                                reverseAnimationCurve: Curves.decelerate,
                                forwardAnimationCurve: Curves.elasticOut,
                                backgroundColor: Colors.yellow,
                                boxShadows: [
                                  BoxShadow(
                                    color: Colors.yellow,
                                    offset: Offset(0, 2),
                                  )
                                ],
                                isDismissible: false,
                                icon: Icon(
                                  Icons.error_outline,
                                  color: Colors.yellow,
                                ),
                                showProgressIndicator: true,
                              ).show(context);
                            });
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: !isMale ? Colors.red : Colors.grey),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.female_outlined,
                                  color: Colors.black,
                                  size: 70,
                                ),
                                Text(
                                  'FEMALE',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hight',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${cubit.userModel?.data!.tall ?? '150'}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              'cm',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Slider(
                          onChanged: (value) {
                            setState(() {
                              cubit.userModel?.data!.tall = value.toInt();
                            });
                          },
                          value: cubit.userModel!.data!.tall!.toDouble() ?? 150,
                          min: 100,
                          max: 220,
                          activeColor: Colors.red,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 190,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                '${cubit.userModel!.data!.Age ?? 18}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.black),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        Flushbar(
                                          title: 'Home work out',
                                          message:
                                              'you should change your birth day from the setting sceen',
                                          duration: const Duration(seconds: 3),
                                          flushbarPosition:
                                              FlushbarPosition.BOTTOM,
                                          flushbarStyle: FlushbarStyle.FLOATING,
                                          reverseAnimationCurve:
                                              Curves.decelerate,
                                          forwardAnimationCurve:
                                              Curves.elasticOut,
                                          backgroundColor: Colors.yellow,
                                          boxShadows: [
                                            BoxShadow(
                                              color: Colors.yellow,
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          isDismissible: false,
                                          icon: Icon(
                                            Icons.error_outline,
                                            color: Colors.yellow,
                                          ),
                                          showProgressIndicator: true,
                                        ).show(context);
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                    ),
                                    mini: true,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        Flushbar(
                                          title: 'Home work out',
                                          message:
                                              'you should change your birth day from the setting sceen',
                                          duration: const Duration(seconds: 3),
                                          flushbarPosition:
                                              FlushbarPosition.BOTTOM,
                                          flushbarStyle: FlushbarStyle.FLOATING,
                                          reverseAnimationCurve:
                                              Curves.decelerate,
                                          forwardAnimationCurve:
                                              Curves.elasticOut,
                                          backgroundColor: Colors.yellow,
                                          boxShadows: [
                                            BoxShadow(
                                              color: Colors.yellow,
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          isDismissible: false,
                                          icon: Icon(
                                            Icons.error_outline,
                                            color: Colors.yellow,
                                          ),
                                          showProgressIndicator: true,
                                        ).show(context);
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.red,
                                    ),
                                    mini: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          height: 190,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                '${cubit.userModel?.data!.weight ?? 60}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.black),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        cubit.userModel!.data!.weight =
                                            cubit.userModel!.data!.weight! -
                                                    1 ??
                                                60;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                    ),
                                    backgroundColor: Colors.black,
                                    mini: true,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        cubit.userModel!.data!.weight =
                                            cubit.userModel!.data!.weight! +
                                                    1 ??
                                                60;
                                      });
                                    },
                                    child: Icon(Icons.add, color: Colors.red),
                                    backgroundColor: Colors.black,
                                    mini: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ConditionalBuilder(
                      condition: state is LoadingBmiState,
                      builder: (BuildContext context) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red),
                          child: MaterialButton(
                            onPressed: () {
                              cubit.postBmi(data: {
                                "tall": cubit.userModel!.data!.tall! ?? 150,
                                "weight": cubit.userModel!.data!.weight! ?? 60
                              });
                              if (state is SuccessBmiState)
                                navigateAndReplace(
                                    context,
                                    LayoutScreen(
                                      screenIndex: 3,
                                    ));
                            },
                            child: Text('Colculate',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.grey,
                                    )),
                          ),
                        );
                      },
                      fallback: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
