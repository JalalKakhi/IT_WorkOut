import 'package:IT_workout/IT_workout/models/HomeScreenModels/get_activity_model.dart';
import 'package:IT_workout/IT_workout/models/HomeScreenModels/post_get_user_model.dart';
import 'package:IT_workout/IT_workout/modules/activityScreen/activity_cubit.dart/activityState.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class activityCubit extends BaseCubit<activityState> {
  activityCubit() : super(initialActivityState());
  static activityCubit get(context) => BlocProvider.of(context);
  GetActivityModel? userModel;
  Future<void> getactivity() async {
    fetchData(
        path: '/api/user/getActivityData',
        header: {"Authorization": "Bearer $baseToken"},
        errorMessage: 'from get activity in activity cubit ',
        successState: SuccessActivityState(),
        errorState: ErrorActivityState(),
        loadingState: LoadingActivityState(),
        fromJson: (fromjson) {
          return GetActivityModel.fromJson(fromjson);
        },
        onSuccess: (onSuccess) {
          userModel = onSuccess;
        });
  }
}
