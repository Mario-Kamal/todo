import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/appcolors.dart';
import 'package:todoapp/cubits/enums.dart';
import 'package:todoapp/cubits/main_cubit/state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(ChangeAppThemeState(false));

  static MainCubit get(context) => BlocProvider.of(context);
  bool appTheme=false;
  ViewType viewType=ViewType.list;
  changeapptheme() {
    if (appTheme==true) {
      AppColors.lightTheme();
    } else {
      AppColors.dark();
    }
    appTheme=!appTheme;
    emit(ChangeAppThemeState(appTheme));
  }

  changeViewType() {
    if (viewType == ViewType.grid) {
      viewType=ViewType.list;
      emit(ChangeViewTypeState(viewType));
    } else {
      viewType=ViewType.grid;
      emit(ChangeViewTypeState(viewType));
    }
  }
}
