import 'package:IT_workout/IT_workout/layout/layout_screen.dart';
import 'package:IT_workout/IT_workout/modules/change_password.dart/change_password_cubit.dart/changePasswordCubit.dart';
import 'package:IT_workout/IT_workout/modules/change_password.dart/change_password_cubit.dart/changePasswordState.dart';
import 'package:IT_workout/IT_workout/shared/combonents/combontents.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Changepassword extends StatelessWidget {
  const Changepassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Changepasswordcubit, Changepasswordstate>(
        builder: (context, state) {
          var cubit = Changepasswordcubit.get(context);
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
                        Text('Change your password',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey)),
                        SizedBox(
                          height: 20.0,
                        ),
                        defultTextFormField(
                            controlar: cubit.PasswordControlar,
                            textInputType: TextInputType.visiblePassword,
                            labelText: ' password',
                            preIcon: Icon(Icons.lock_clock_outlined),
                            sufIcon: !cubit.isobsucer
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            suf_function: () {
                              cubit.isobsucer = !cubit.isobsucer;
                            },
                            validate: (String? value) {
                              if (value == null || value.isEmpty) {
                                return ' password field must be not empty';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        defultTextFormField(
                            controlar: cubit.confirmPasswordControlar,
                            textInputType: TextInputType.visiblePassword,
                            labelText: 'confirmPassword',
                            preIcon: Icon(Icons.confirmation_num_rounded),
                            sufIcon: !cubit.isobsucer
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            suf_function: () {
                              cubit.isobsucer = !cubit.isobsucer;
                            },
                            validate: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm Password field must be not empty';
                              }
                              if (cubit.confirmPasswordControlar !=
                                  cubit.PasswordControlar) {
                                return 'The confirm password doesnt match with the password field';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: state is LoadingChangePasswordState,
                          builder: (BuildContext context) {
                            return defultButtom(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.postPassword(data: {
                                      'password': cubit.confirmPasswordControlar
                                    });
                                  }
                                  if (cubit.userModel != null) {
                                    Flushbar(
                                      title: 'Home work out',
                                      message: cubit.userModel!.message,
                                      duration: const Duration(seconds: 3),
                                      flushbarPosition: FlushbarPosition.BOTTOM,
                                      flushbarStyle: FlushbarStyle.FLOATING,
                                      reverseAnimationCurve: Curves.decelerate,
                                      forwardAnimationCurve: Curves.elasticOut,
                                      backgroundColor:
                                          state is ErrorChangePasswordState
                                              ? Colors.red
                                              : Colors.green,
                                      boxShadows: [
                                        BoxShadow(
                                          color:
                                              state is ErrorChangePasswordState
                                                  ? Colors.red
                                                  : Colors.green,
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      isDismissible: false,
                                      icon: Icon(
                                        state is ErrorChangePasswordState
                                            ? Icons.check
                                            : Icons.abc_sharp,
                                        color: state is ErrorChangePasswordState
                                            ? Colors.red
                                            : Colors.green,
                                      ),
                                      // mainButton: ,
                                      progressIndicatorBackgroundColor:
                                          state is SuccessChangePasswordState
                                              ? Colors.green
                                              : null,
                                      showProgressIndicator: true,
                                    ).show(context);
                                  }

                                  if (State is SuccessChangePasswordState)
                                    navigateAndReplace(
                                        context,
                                        LayoutScreen(
                                          screenIndex: 3,
                                        ));
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
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
          ;
        },
        listener: (context, state) {});
  }
}
