
import 'package:IT_workout/IT_workout/models/HomeScreenModels/post_get_user_model.dart';
import 'package:IT_workout/IT_workout/modules/activityScreen/activity_cubit.dart/activityState.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class activityCubit extends BaseCubit<activityState> {
  activityCubit() : super(initialActivityState());
  static activityCubit get(context) => BlocProvider.of(context);
  PostGetUserModel? userModel;
  Future<void> getactivity() async {
    fetchData(
        path: '/api/user/login',
        header: {"Authorization": "Bearer $baseToken"},
        errorMessage: 'from activity ',
        successState: SuccessActivityState(),
        errorState: ErrorActivityState(),
        loadingState: LoadingActivityState(),
        fromJson: (fromjson) {
          return PostGetUserModel.fromJson(fromjson);
        },
        onSuccess: (onSuccess) {
          userModel = onSuccess;
        });
  }
}
