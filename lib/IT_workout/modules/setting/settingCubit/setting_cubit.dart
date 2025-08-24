import 'package:IT_workout/IT_workout/models/HomeScreenModels/post_get_user_model.dart';
import 'package:IT_workout/IT_workout/modules/setting/settingCubit/setting_states.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends BaseCubit<SettingStates> {
  SettingCubit() : super(InitialState());
  static SettingCubit get(context) => BlocProvider.of(context);
  String? userMassage;
  PostGetUserModel? userModel;
  TextEditingController? dobController;
  Future<void> getSetting() async {
    fetchData(
        path: '/api/user/getUserInfo',
        header: {"Authorization": "Bearer $baseToken"},
        errorMessage: 'from get setting in setting cubit ',
        successState: SuccessSettingState(),
        errorState: ErrorSettingState(),
        loadingState: LoadingSettingState(),
        fromJson: (fromjson) {
          return PostGetUserModel.fromJson(fromjson);
        },
        onSuccess: (onSuccess) {
          userModel = onSuccess;
        });
  }

  Future<void> postCalories({
    required Map<String, dynamic> data,
  }) async {
    PostData(
        path: '/api/user/updateTargetCalories',
        errorMessage: 'form Post calories in setting cubit',
        header: {"Authorization": "Bearer $baseToken"},
        data: data,
        successState: SuccessSettingState(),
        errorState: ErrorSettingState(),
        loadingState: LoadingSettingState(),
        fromJson: (fromjson) {
          return PostGetUserModel.fromJson(fromjson);
        },
        onSuccess: (model) {
          userMassage = model.message;
          print(userMassage);
        });
  }

  Future<void> postBmi({
    required Map<String, dynamic> data,
  }) async {
    PostData(
        path: '/api/user/editBMI',
        errorMessage: "From post bmi in setting cubit ",
        header: {"Authorization": "Bearer $baseToken"},
        successState: SuccessBmiState(),
        errorState: ErrorBmiState(),
        loadingState: LoadingBmiState(),
        fromJson: (fromJson) {
          return PostGetUserModel.fromJson(fromJson);
        },
        onSuccess: (model) {
          userMassage = model.message;
          print(userMassage);
        },
        data: data);
  }

  Future<void> postLevel({
    required Map<String, dynamic> data,
  }) async {
    PostData(
        path: '/api/user/editBMI',
        errorMessage: "From post level in setting cubit ",
        header: {"Authorization": "Bearer $baseToken"},
        successState: SuccessBmiState(),
        errorState: ErrorBmiState(),
        loadingState: LoadingBmiState(),
        fromJson: (fromJson) {
          return PostGetUserModel.fromJson(fromJson);
        },
        onSuccess: (model) {
          userMassage = model.message;
          print(userMassage);
        },
        data: data);
  }

  Future<void> postGender({
    required Map<String, dynamic> data,
  }) async {
    PostData(
        path: '/api/user/updateGender',
        errorMessage: "From post Gender in setting cubit ",
        header: {"Authorization": "Bearer $baseToken"},
        successState: SuccessBmiState(),
        errorState: ErrorBmiState(),
        loadingState: LoadingBmiState(),
        fromJson: (fromJson) {
          return PostGetUserModel.fromJson(fromJson);
        },
        onSuccess: (model) {
          userMassage = model.message;
          print(userMassage);
        },
        data: data);
  }

  Future<void> postBirthday({
    required Map<String, dynamic> data,
  }) async {
    PostData(
        path: '/api/user/editBirthDate',
        errorMessage: "From post birthday in setting cubit",
        header: {"Authorization": "Bearer $baseToken"},
        successState: SuccessBmiState(),
        errorState: ErrorBmiState(),
        loadingState: LoadingBmiState(),
        fromJson: (fromJson) {
          return PostGetUserModel.fromJson(fromJson);
        },
        onSuccess: (model) {
          userMassage = model.message;
          print(userMassage);
        },
        data: data);
  }

  Future<void> postReminder({
    required Map<String, dynamic> data,
  }) async {
    PostData(
        path: '/api/user/editReminder',
        errorMessage: "From post reminder in setting cubit",
        header: {"Authorization": "Bearer $baseToken"},
        successState: SuccessBmiState(),
        errorState: ErrorBmiState(),
        loadingState: LoadingBmiState(),
        fromJson: (fromJson) {
          return PostGetUserModel.fromJson(fromJson);
        },
        onSuccess: (model) {
          userMassage = model.message;
          print(userMassage);
        },
        data: data);
  }

  String? transIdToLevelName(int level_id) {
    if (level_id == 1) return 'Biggner';
    if (level_id == 2) return 'Intermadite';
    if (level_id == 3) return 'Advanced';

    return null;
  }

  int? transLevelNameToId(String level_name) {
    if (level_name == 'Biggner') return 1;
    if (level_name == 'Intermadite') return 2;
    if (level_name == 'Advanced') return 3;

    return null;
  }
}
