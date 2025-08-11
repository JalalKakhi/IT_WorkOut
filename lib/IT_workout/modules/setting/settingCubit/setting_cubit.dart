import 'package:IT_workout/IT_workout/modules/setting/settingCubit/setting_states.dart';
import 'package:IT_workout/IT_workout/shared/base_cubit/base_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends BaseCubit<SettingStates> {
  SettingCubit() : super(InitialStatu());
  static SettingCubit get(context) => BlocProvider.of(context);

  Future<void> getSetting() async {
    fetchData(
        path: '',
        errorMessage: 'from setting ',
        successState: SuccessSettingStatu(),
        errorState: ErrorSettingStatu(),
        loadingState: LoadingSettingStatu(),
        fromJson: (fromJson) {},
        onSuccess: (onSuccess) {});
  }
}
