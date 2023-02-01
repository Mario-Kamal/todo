import 'package:todoapp/cubits/enums.dart';

class MainState {
  final bool appTheme;
  ViewType viewType;

  MainState({this.appTheme = true, this.viewType = ViewType.list});

  MainState copywith({bool? appTheme, ViewType? viewType}) => MainState(
      appTheme: appTheme ?? this.appTheme, viewType: viewType ?? this.viewType);
}
