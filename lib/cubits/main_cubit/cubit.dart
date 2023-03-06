import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/resources/helper/theme_shared.dart';
import 'package:todoapp/theme/appcolors.dart';
import 'package:todoapp/cubits/enums.dart';
import 'package:todoapp/cubits/main_cubit/state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(ChangeAppThemeState(false));

  static MainCubit get(context) => BlocProvider.of(context);
  bool appTheme=false;
  ViewType viewType=ViewType.list;

  getAppTheme() async{
    String cacheTheme = await ThemeHelper().getCachedTheme()??"light";
    if(cacheTheme =="light"){
      appTheme= false;
      AppColors.lightTheme();
    }else{
      appTheme=true;
      AppColors.dark();
    }
    appTheme=!appTheme;
    emit(ChangeAppThemeState(appTheme));
  }
  changeAppTheme() async {
    late String theme ;
    if (appTheme==false) {
      theme = "light";
      AppColors.lightTheme();
    } else {
      theme="dark";
      AppColors.dark();
    }
    await ThemeHelper().cacheTheme(theme);
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
