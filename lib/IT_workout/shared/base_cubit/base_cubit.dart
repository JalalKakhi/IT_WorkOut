import 'package:IT_workout/IT_workout/shared/networking/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T> extends Cubit<T> {
  BaseCubit(T initialState) :super(initialState);


  Future<void> fetchData<R>({
    required String path,
    required String errorMessage,
    Map<String, dynamic>? query,
    Map<String, dynamic>? header,
    required T successState,
    required T errorState,
    required T loadingState,
    required R Function(dynamic json) fromJson,
    required void Function(R data) onSuccess,
  }) async {
    emit(loadingState);
    await DioHelper.getData(
        path: path,
        query: query,
        header: header
    ).then((response)
    {
      print("RAW RESPONSE: ${response.data}");
      if (response.data != null && response.data!["data "] != null) {
        final model = fromJson(response.data);
        onSuccess(model);
        print(response.data);
        emit(successState);
      } else {
        throw("the data is null ");
      }
    }
    ).catchError((error)
    {
      print('$errorMessage: ${error.toString()}');
      emit(errorState);
    }
    );
  }



  Future<void> PostData<R>({
    required String path,
    required String errorMessage,
    Map<String, dynamic>? query,
    Map<String, dynamic>? header,
    required Map<String, dynamic> data,
    required T successState,
    required T errorState,
    required T loadingState,
    required R Function(dynamic json) fromJson,
    required void Function(R data) onSuccess,
  }) async {
    emit(loadingState);
    await DioHelper.postData(
        path: path,
        query: query,
        data: data,
        header: header

    ).then((response)
    {
      print("RAW RESPONSE POST: ${response.data}");
      if (response.data != null && response.data!["data "] != null) {
        final model = fromJson(response.data);
        onSuccess(model);
        print(response.data);
        emit(successState);
      } else {
        throw("the data is null ");
      }
    }
    ).catchError((error)
    {
      print('$errorMessage: ${error.toString()}');
      emit(errorState);
    }
    );
  }

}
