import 'package:sqflite/sqlite_api.dart';
import 'package:todoapp/cubits/enums.dart';
import 'package:todoapp/model/task_model.dart';

class TaskState {
  Database? database;
  List<TaskModel> tasks;
  RequestState requestState;
  ViewType viewType;
  String searchvalue;
  TaskState(
      {this.database,
      this.tasks = const [],
      this.requestState = RequestState.init,
      this.viewType = ViewType.list,this.searchvalue=''});

  TaskState copywith(
          {Database? database,
          List<TaskModel>? tasks,
          RequestState? requestState,
          ViewType? viewType, String? searchvalue}) =>
      TaskState(
          database: database ?? this.database,
          tasks: tasks ?? this.tasks,
          requestState: requestState ?? this.requestState,
          viewType: viewType ?? this.viewType,searchvalue: searchvalue??this.searchvalue);
}
