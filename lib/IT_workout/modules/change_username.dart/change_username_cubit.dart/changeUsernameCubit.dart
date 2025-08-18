import 'package:IT_workout/IT_workout/models/HomeScreenModels/post_get_user_model.dart';
import 'package:IT_workout/IT_workout/modules/change_password.dart/change_password_cubit.dart/changePasswordState.dart';
import 'package:IT_workout/IT_workout/modules/change_username.dart/change_username_cubit.dart/changeUsernameState.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Changeusernamecubit extends BaseCubit<Changeusernamestate> {
  Changeusernamecubit() : super(initialChangeUsernameState());
  static Changeusernamecubit get(context) => BlocProvider.of(context);

  PostGetUserModel? userModel  ;
  var UsernameControlar = TextEditingController();
  var confirmUsernameControlar = TextEditingController(); 

  Future<void> postusername({
    required Map<String, dynamic> data,
  }) async {
    PostData(
        path: '/api/user/editUserName',
        errorMessage: 'form Postusername',
        data: data,
        header: {"Authorization": "Bearer $baseToken"},
        successState: SuccessChangeUsernameState(),
        errorState: ErrorChangeUsernameState(),
        loadingState: LoadingChangeUsernameState(),
        fromJson: (fromjson) {
          return PostGetUserModel.fromJson(fromjson);
        },
        onSuccess: (model) {
          userModel = model;
        });
  }
}
