import 'package:IT_workout/IT_workout/models/HomeScreenModels/get_plan_model.dart';
import 'package:IT_workout/IT_workout/modules/homeGym/homeCubit/home_states.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Import the Plan model

class HomeCubit extends BaseCubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());
  GetPlanModel? getPlanModel;

  static HomeCubit get(context) =>BlocProvider.of(context);

  Future<void> getPlan() async {
     fetchData(
      path: "/api/plan/getPlan",

      errorMessage: "Error in getting plan in home screen",
      successState: SuccessGetPlanState(),
      errorState: ErrorGetPlanState(),
      loadingState: LoadingGetPlanState(),
      fromJson: (json) {  return GetPlanModel.fromJson(json);},
       onSuccess: (model){
         print("📦 MODEL AFTER PARSE: ${model.data?.name}");

        getPlanModel = model;
       }
       // Pass the parsing function
    );


  }
}