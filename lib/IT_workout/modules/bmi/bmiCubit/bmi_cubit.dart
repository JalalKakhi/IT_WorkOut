import 'package:IT_workout/IT_workout/modules/bmi/bmiCubit/bmi_states.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends BaseCubit<BmiStates> {
  BmiCubit() : super(InitialBmiStatu());

  static BmiCubit get(context) => BlocProvider.of(context);

  Future<void> getBmi() async{
    fetchData(
      path: '',
       errorMessage: "From bmi ",
        successState: SuccesBmiStatu(),
         errorState: ErrorBmiStatu(),
          loadingState: LoadingBmiStatu(),
           fromJson: (fromJson){},
            onSuccess:(model){} );
  }
}
