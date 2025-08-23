import 'package:IT_workout/IT_workout/models/HomeScreenModels/post_get_user_model.dart';
import 'package:IT_workout/IT_workout/modules/change_password.dart/change_password_cubit.dart/changePasswordState.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Changepasswordcubit extends BaseCubit<Changepasswordstate> {
  Changepasswordcubit() : super(initialChangePasswordState());
  static Changepasswordcubit get(context) => BlocProvider.of(context);

  String? userMessage;
  var PasswordControlar = TextEditingController();
  var confirmPasswordControlar = TextEditingController();
  bool isobsucer = true;

  Future<void> postPassword({
    required Map<String, dynamic> data,
  }) async {
    PostData(
        path: '/api/user/editPassword',
        errorMessage: 'form Post Password in change password cubit',
        header: {"Authorization": "Bearer $baseToken"},
        data: data,
        successState: SuccessChangePasswordState(),
        errorState: ErrorChangePasswordState(),
        loadingState: LoadingChangePasswordState(),
        fromJson: (fromjson) {
          return PostGetUserModel.fromJson(fromjson);
        },
        onSuccess: (model) {
          userMessage = model.message;
        });
  }

  // Future<void> getUser() async {
  //   fetchData(
  //       path: '/api/user/login',
  //       errorMessage: 'from password ',
  //       successState: SuccessChangePasswordState(),
  //       errorState: ErrorChangePasswordState(),
  //       loadingState: LoadingChangePasswordState(),
  //       fromJson: (fromJson) {
  //         return PostGetUserModel.fromJson(fromJson);
  //       },
  //       onSuccess: (onSuccess) {
  //         userModel = onSuccess;
  //       });
  // }
}
