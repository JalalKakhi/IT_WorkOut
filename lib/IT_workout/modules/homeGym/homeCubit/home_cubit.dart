import 'package:IT_workout/IT_workout/models/HomeScreenModels/get_categories_model.dart';
import 'package:IT_workout/IT_workout/models/HomeScreenModels/get_plan_model.dart';
import 'package:IT_workout/IT_workout/modules/homeGym/homeCubit/home_states.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Import the Plan model

class HomeCubit extends BaseCubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());
  GetPlanModel? getPlanModel;
  GetCategoriesModel? getCategoriesModel;

  static HomeCubit get(context) =>BlocProvider.of(context);

  Future<void> getPlan() async {
     fetchData(
      path: "/api/userPlan/getPlansByUserLevelID",
      header: {
        "Authorization": "Bearer $baseToken"
      },
      errorMessage: "Error in getting plan in home screen",
      successState: SuccessGetPlanState(),
      errorState: ErrorGetPlanState(),
      loadingState: LoadingGetPlanState(),
      fromJson: (json) {  return GetPlanModel.fromJson(json);},
       onSuccess: (model){


        getPlanModel = model;
        print("📦 MODEL AFTER PARSE: ${model.data?[0].name}");
       }
       // Pass the parsing function
    );


  }



  Future<void> getCategories() async {
    fetchData(
        path: "/api/category/getAllUserCategory",
        header: {
          "Authorization": 'Bearer $baseToken'
        },
        errorMessage: "Error in getting categories in home screen",
        successState: SuccessGetCategoriesState(),
        errorState: ErrorGetCategoriesState(),
        loadingState: LoadingGetCategoriesState(),
        fromJson: (json) {  return GetCategoriesModel.fromJson(json);},
        onSuccess: (model){


          getCategoriesModel = model;
          print("📦 MODEL AFTER PARSE: ${model.data?[0].name}");
        }
      // Pass the parsing function
    );


  }
}