import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/appcolors.dart';
import 'package:todoapp/cubits/enums.dart';
import 'package:todoapp/cubits/main_cubit/state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState());

  static MainCubit get(context) => BlocProvider.of(context);

  changeapptheme() {
    if (state.appTheme == false) {
      AppColors.lightTheme();
    } else {
      AppColors.dark();
    }
    emit(state.copywith(appTheme: !state.appTheme));
  }

  changeViewType() {
    if (state.viewType == ViewType.grid) {
      emit(state.copywith(viewType: ViewType.list));
    } else {
      emit(state.copywith(viewType: ViewType.grid));
    }
  }
}
