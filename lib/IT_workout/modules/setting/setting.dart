import 'package:IT_workout/IT_workout/modules/bmi/bmi.dart';
import 'package:IT_workout/IT_workout/modules/change_password.dart/changePassword.dart';
import 'package:IT_workout/IT_workout/modules/change_username.dart/changeUsername.dart';
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
  late SettingCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingStates>(
        builder: (context, state) {
          final gender = ['Male', 'Female'];
          cubit = SettingCubit.get(context);
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set your work out informations ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
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
                        onTap: () => showEditKcal(context),
                        child: Text('${cubit.userModel?.target_calories}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey))),
                  ],
                ),
                SizedBox(height: 10),
                mySeparated(),
                SizedBox(
                  height: 10,
                ),
                                Row(
                  children: [
                    Expanded(
                      child: Text(
                        ' Your birthday',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => showEditKcal(context),
                        child: Text('${cubit.userModel?.target_calories}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey))),
                  ],
                ),
              SizedBox(height: 10), 
                mySeparated(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Your gender',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 4)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: cubit.userModel!.gender,
                            items: gender.map(changeGender).toList(),
                            onChanged: (value) => setState(() {
                                  cubit.userModel!.gender = value;
                                  
                                })),
                      ),
                    ),
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
                      child: Text('${cubit.userModel?.BMI}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
                mySeparated(),
                SizedBox(
                  height: 20,
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
                        onPressed: () {
                          navigate(context, Changeusername());
                        },
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
                        onPressed: () {
                          navigate(context, Changepassword());
                        },
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
        listener: (context, state) {});
  }

  void showEditKcal(BuildContext context) {
    TextEditingController controller = TextEditingController(
        text: cubit.userModel!.target_calories.toString());
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
                cubit.userModel!.target_calories =
                    double.tryParse(controller.text) ??
                        cubit.userModel!.target_calories;
                cubit.postCalories(data: {
                  'target_calories': cubit.userModel!.target_calories
                });
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

  DropdownMenuItem<String> changeGender(String gender) => DropdownMenuItem(
      value: gender,
      child: Text(
        gender,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.grey),
      ));
}
