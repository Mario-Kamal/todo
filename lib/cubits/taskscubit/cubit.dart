import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/cubits/enums.dart';
import 'package:todoapp/cubits/taskscubit/state.dart';
import 'package:todoapp/model/task_model.dart';

class TasksCubit extends Cubit<TaskState> {
  TasksCubit() : super(TaskState());

  static TasksCubit get(context) => BlocProvider.of(context);

  openDataBase() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}tododb.db';
    openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, title TEXT, task TEXT)');
    }).then((db) {
      emit(state.copywith(database: db));
      getFromDB();
    });
  }

  Future insertToDB(TaskModel taskModel) async {
    await state.database?.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO Test(title, task) VALUES("${taskModel.title}", "${taskModel.task}")');
      emit(state.copywith());
      getFromDB();
    });
  }

  getFromDB() async {
    emit(state.copywith(requestState: RequestState.loading));
    List<Map<String, dynamic>>? list =
        await state.database?.rawQuery('SELECT * FROM Test');
    emit(state.copywith(
        tasks: list?.map<TaskModel>((e) => TaskModel.fromDB(e)).toList(),
        requestState: RequestState.success));
  }

  updateDB() {}

  deleteFromDB({int? id}) async {
    await state.database?.rawDelete('DELETE FROM Test WHERE id = ?', [id]);
    emit(state.copywith());
    getFromDB();
  }

  search(searchvalue) {
    emit(state.copywith(
      searchvalue: searchvalue,
    ));
  }
}
