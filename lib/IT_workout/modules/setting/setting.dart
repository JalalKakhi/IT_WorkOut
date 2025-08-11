import 'package:IT_workout/IT_workout/modules/bmi/bmi.dart';
import 'package:IT_workout/IT_workout/modules/setting/settingCubit/setting_cubit.dart';
import 'package:IT_workout/IT_workout/modules/setting/settingCubit/setting_states.dart';
import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _ProfileGymState();
}

class _ProfileGymState extends State<Setting> {
            bool BMICal = false;
          int BMI = 0;
          int kcalGoal = 200;
          bool isMale = true;
          double hight = 180;
          int age = 18;
          int weight = 40;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit,SettingStates>(
        builder: (context, state) {
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'set your goals',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.red),
                    ),
                    Expanded(
                      child: Text(
                        'Kcal goal',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => _showEditDialog(context),
                        child: Text('$kcalGoal',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                mySeparated(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'BMI',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        navigate(context, Bmi());
                      },
                      child: Text(BMICal ? '???' : '${BMI}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey)),
                    ),
                  ],
                ),
                mySeparated(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Time reminder',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                    // TextButton(
                    //     onPressed: (){
                    //       Navigator.of(context).push(showPicker(
                    //         context: context,
                    //           value: _time,
                    //           is24HrFormat: true,
                    //           iosStylePicker: true,
                    //           minuteInterval:TimePickerInterval.FIVE ,
                    //           onChange: (Time time ){
                    //         setState(() {
                    //           _time = time;
                    //         });
                    //       }
                    //       ));
                    //     },
                    //     child: Text('${_time}',style: TextStyle(
                    //         color: Colors.grey,
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 16
                    //     ),
                    //     )
                    // )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Personal',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Change  your User name information',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.account_circle_outlined))
                  ],
                ),
                mySeparated(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Change password',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.change_circle_rounded))
                  ],
                ),
                mySeparated(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Note : if you face any problem just chat and explain your problem --> +9634564654',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.red,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            ),
          ));
        },
        listener: (context,state) {}
        );
  }

  void _showEditDialog(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: kcalGoal.toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Change Kcal",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.red),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "enter your kcal goal",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "exit",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                kcalGoal = int.tryParse(controller.text) ?? kcalGoal;
              });
              Navigator.pop(context);
            },
            child: Text(
              "save",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
