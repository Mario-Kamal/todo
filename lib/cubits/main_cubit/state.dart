import 'package:todoapp/cubits/enums.dart';

abstract class MainState {
  final bool appTheme;
  final ViewType viewType;

  MainState({this.appTheme=false, this.viewType=ViewType.list});

}

class ChangeAppThemeState extends MainState{
  final bool appThemes;

  ChangeAppThemeState(this.appThemes):super(appTheme: appThemes);
}
class ChangeViewTypeState extends MainState{
  final ViewType viewTypes;
  ChangeViewTypeState(this.viewTypes):super(viewType: viewTypes);
}


