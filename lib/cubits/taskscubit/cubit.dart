import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/cubits/enums.dart';
import 'package:todoapp/cubits/taskscubit/state.dart';
import 'package:todoapp/model/task_model.dart';
import 'package:todoapp/resources/helper/lang_shared.dart';

class TasksCubit extends Cubit<TaskState> {
  TasksCubit() : super(TaskState());

  static TasksCubit get(context) => BlocProvider.of(context);
  bool isEn = false;
  Locale locale = const Locale('en', '');

  openDataBase() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}tododb.db';
    openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, title TEXT, task TEXT)');
    }).then((db) {
      emit(state.copyWith(database: db));
      getFromDB();
    });
  }

  Future insertToDB(TaskModel taskModel) async {
    await state.database?.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO Test(title, task) VALUES("${taskModel.title}", "${taskModel.task}")');
      emit(state.copyWith());
      getFromDB();
    });
  }

  getFromDB() async {
    emit(state.copyWith(requestState: RequestState.loading));
    List<Map<String, dynamic>>? list =
        await state.database?.rawQuery('SELECT * FROM Test');
    emit(state.copyWith(
        tasks: list?.map<TaskModel>((e) => TaskModel.fromDB(e)).toList(),
        requestState: RequestState.success));
  }

  updateDB() {}

  deleteFromDB({int? id}) async {
    await state.database?.rawDelete('DELETE FROM Test WHERE id = ?', [id]);
    emit(state.copyWith());
    getFromDB();
  }

  search(searchValue) {
    emit(state.copyWith(
      searchValue: searchValue,
    ));
  }

  searchTaskList() {
    return state.tasks.where((element) =>
            element.title?.toLowerCase()
                .contains(state.searchValue.toLowerCase()) ?? false)
        .toList();
  }

  getAppLang() async {
    String cacheTheme = await LanguageHelper().getCachedLang() ?? "en";
    if (cacheTheme == "en") {
      isEn = false;
      locale = const Locale('en', '');
    } else {
      isEn = true;
      locale = const Locale('ar', '');
    }
    isEn = !isEn;
    emit(state.copyWith(locale: locale));
  }

  changeLanguage() async {
    late String lang;
    if (isEn == false) {
      lang = "en";
      locale = const Locale('en', '');
    } else {
      lang = "ar";
      locale = const Locale('ar', '');
    }
    await LanguageHelper().cacheLanguage(lang);
    isEn = !isEn;
    emit(state.copyWith(locale: locale));
  }
}
