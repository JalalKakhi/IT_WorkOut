import 'package:IT_workout/IT_workout/models/baseModel/base_model.dart';
import 'package:IT_workout/IT_workout/shared/networking/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T> extends Cubit<T>{
  BaseCubit(T initialState):super(initialState);


  void fetchData({
    required String path,
    required String errorMessage,
    Map<String,dynamic>? query,
    required T successState,
    required T errorState,
    required T loadingState,
    BaseModel? model,

})async{
    emit(loadingState);
    await DioHelper.getData(
        path: path,
        query: query
    ).then((response){
      if(model!=null){
        model.formJason(response);
      }
      print(response.data);
      emit(successState);
    }).catchError((error){
      print('${errorMessage}:${error.toString()}');
      emit(errorState);

    });

  }
}