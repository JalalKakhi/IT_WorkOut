import 'package:IT_workout/IT_workout/modules/bmi/bmi.dart';
import 'package:IT_workout/IT_workout/modules/change_password.dart/changePassword.dart';
import 'package:IT_workout/IT_workout/modules/change_username.dart/changeUsername.dart';
import 'package:IT_workout/IT_workout/modules/data_time_picker.dart/data_time_picker_screen.dart';
import 'package:IT_workout/IT_workout/modules/date_picker.dart/date_picker_screen.dart';
import 'package:IT_workout/IT_workout/modules/setting/settingCubit/setting_cubit.dart';
import 'package:IT_workout/IT_workout/modules/setting/settingCubit/setting_states.dart';
import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
          final levels = ['Biggner', 'Intermadite', 'Advanced'];
          cubit = SettingCubit.get(context);
          return ConditionalBuilder(
            condition: state is LoadingSettingState,
            builder: (BuildContext context) {
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
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Kcal goal',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                        ),
                        GestureDetector(
                            onTap: () => showEditKcal(context),
                            child: Text(
                                '${cubit.userModel?.data!.target_calories ?? '0'}',
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                        ),
                        DatePickerScreen(
                          controller: cubit.dobController!,
                          label: 'Date of Birth',
                          hintText: cubit.userModel!.data!.date_of_birth! ??
                              'YYYY-MM-DD',
                          onTap: () =>
                              _selectDate(context, cubit.dobController),
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
                                value: cubit.userModel!.data!.gender ?? 'Male',
                                items: gender.map(changeGender).toList(),
                                onChanged: (value) => setState(() {
                                      cubit.userModel!.data!.gender = value;
                                      cubit.postGender(data: {
                                        'gender':
                                            cubit.userModel!.data!.gender ??
                                                value
                                      });
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
                            'Your level',
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
                                value: cubit.transIdToLevelName(
                                    cubit.userModel!.data!.level_id ?? 1),
                                items: levels.map(changeLevel).toList(),
                                onChanged: (value) => setState(() {
                                      cubit.userModel!.data!.level_id =
                                          cubit.transLevelNameToId(
                                              value ?? 'Biggner');
                                      cubit.postLevel(data: {
                                        'level_id':
                                            cubit.userModel!.data!.level_id ??
                                                cubit.transLevelNameToId(
                                                    value ?? 'Biggner')
                                      });
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
                          child: Text('${cubit.userModel?.data!.BMI ?? '0'}',
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
                        DataTimePickerScreen(
                          onTimeSelected: (timeFromUser) {
                            cubit.postReminder(data: {
                              'reminder': timeFromUser ??
                                  cubit.userModel!.data!.reminder ??
                                  '05:00:00'
                            });
                            cubit.userModel!.data!.reminder = timeFromUser ??
                                cubit.userModel!.data!.reminder ??
                                '05:00:00';
                          },
                          initialTimeString:
                              cubit.userModel!.data!.reminder ?? '05:00:00',
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
                    SizedBox(
                      height: 20,
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
            fallback: (BuildContext context) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
        listener: (context, state) {});
  }

  void showEditKcal(BuildContext context) {
    TextEditingController controller = TextEditingController(
        text: cubit.userModel!.data!.target_calories.toString());
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
                cubit.userModel!.data!.target_calories =
                    int.tryParse(controller.text) ??
                        cubit.userModel!.data!.target_calories;
                cubit.postCalories(data: {
                  'target_calories': cubit.userModel!.data!.target_calories ??
                      int.tryParse(controller.text)
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
  DropdownMenuItem<String> changeLevel(String level) => DropdownMenuItem(
      value: level,
      child: Text(
        level,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.grey),
      ));
  Future<void> _selectDate(BuildContext context, _dobController) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.red.shade700,
              surface: Colors.black,
            ),
            dialogBackgroundColor: Colors.black.withOpacity(0.9),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.year}-${picked.month}-${picked.day}";
        cubit.userModel!.data!.date_of_birth = _dobController;
        cubit.postBirthday(data: {
          'date_of_birth': _dobController.text ??
              cubit.userModel!.data!.date_of_birth ??
              '${picked.year}-${picked.month}-${picked.day}'
        });
      });
    }
  }
}
