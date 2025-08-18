import 'package:IT_workout/IT_workout/layout/layout_screen.dart';
import 'package:IT_workout/IT_workout/modules/change_username.dart/change_username_cubit.dart/changeUsernameCubit.dart';
import 'package:IT_workout/IT_workout/modules/change_username.dart/change_username_cubit.dart/changeUsernameState.dart';
import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Changeusername extends StatelessWidget {
  const Changeusername({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        builder: (context, state) {
          var cubit = Changeusernamecubit.get(context);
          var formKey = GlobalKey<FormState>();
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     Text('Change your username',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey)),
                        SizedBox(
                          height: 20.0,
                        ),
                        defultTextFormField(
                            controlar: cubit.UsernameControlar,
                            textInputType: TextInputType.name,
                            labelText: 'Username',
                            preIcon:
                                Icon(Icons.supervised_user_circle_outlined),
                            validate: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Username field must be not empty';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        defultTextFormField(
                            controlar: cubit.confirmUsernameControlar,
                            textInputType: TextInputType.name,
                            labelText: 'Confirm username',
                            preIcon: Icon(Icons.confirmation_num_outlined),
                            validate: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm username field must be not empty';
                              }
                             if (cubit.confirmUsernameControlar != cubit.UsernameControlar) {
                                return 'Confirm username field must be the same of the user name field';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: state is LoadingChangeUsernameState,
                          builder: (BuildContext context) {
                            return defultButtom(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.postusername(data: {
                                      'name': cubit.confirmUsernameControlar
                                    },
                                     
                                     );
                                  }
                                  if(State is SuccessChangeUsernameState)
                                navigateAndReplace(context, LayoutScreen());
                                },
                                text: 'UPDATE',
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey),
                                color: Colors.red);
                          },
                          fallback: (BuildContext context) {
                           return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                        SizedBox(height: 15.0,),
                          
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
