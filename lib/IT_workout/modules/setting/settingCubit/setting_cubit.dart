import 'package:IT_workout/IT_workout/models/HomeScreenModels/post_get_user_model.dart';
import 'package:IT_workout/IT_workout/modules/setting/settingCubit/setting_states.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends BaseCubit<SettingStates> {
  SettingCubit() : super(InitialState());
  static SettingCubit get(context) => BlocProvider.of(context);
  PostGetUserData? userModel;
  Future<void> getSetting() async {
    fetchData(
        path: '',
        errorMessage: 'from setting ',
        successState: SuccessSettingState(),
        errorState: ErrorSettingState(),
        loadingState: LoadingSettingState(),
        fromJson: (fromJson) {},
        onSuccess: (onSuccess) {});
  }
    Future<void> postCalories({
    required Map <String,dynamic> data,
  }) async {
    PostData(
        path: '/api/user/updateTargetCalories',
        errorMessage: 'form PostSetting',
        header: {"Authorization": "Bearer $baseToken"},
        data: data,
        successState: SuccessSettingState(),
        errorState: ErrorSettingState(),
        loadingState: LoadingSettingState(),
        fromJson: (fromjson) {
          return PostGetUserData.fromJson(fromjson);
        },
        onSuccess: (model) {
          userModel = model;
        });
  }
}

