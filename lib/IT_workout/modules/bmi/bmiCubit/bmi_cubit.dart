import 'package:IT_workout/IT_workout/models/HomeScreenModels/post_get_user_model.dart';
import 'package:IT_workout/IT_workout/modules/bmi/bmiCubit/bmi_states.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends BaseCubit<BmiStates> {
  BmiCubit() : super(InitialBmiState());
  static BmiCubit get(context) => BlocProvider.of(context);

  PostGetUserModel? userModel;
  PostGetUserData? userModel1;
  Future<void> postBmi({
    required Map<String, dynamic> data,
  }) async {
    PostData(
        path: '/api/user/editBMI',
        errorMessage: "From bmi ",
        header: {"Authorization": "Bearer $baseToken"},
        successState: SuccessBmiState(),
        errorState: ErrorBmiState(),
        loadingState: LoadingBmiState(),
        fromJson: (fromJson) {
          return PostGetUserData.fromJson(fromJson);
        },
        onSuccess: (model) {
          userModel1 = model;
        },
        data: data);
  }

  Future<void> getBmi() async {
    fetchData(
        path: '/api/user/login',
        errorMessage: 'from Bmi ',
        header: {"Authorization": "Bearer $baseToken"},
        successState: SuccessBmiState(),
        errorState: ErrorBmiState(),
        loadingState: LoadingBmiState(),
        fromJson: (fromJson) {
          return PostGetUserModel.fromJson(fromJson);
        },
        onSuccess: (onSuccess) {
          userModel = onSuccess;
        });
  }
}
