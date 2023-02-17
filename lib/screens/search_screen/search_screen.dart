import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/appcolors.dart';
import 'package:todoapp/component/defaultappbar.dart';
import 'package:todoapp/component/taskitem.dart';
import 'package:todoapp/component/widgets.dart';
import 'package:todoapp/cubits/main_cubit/cubit.dart';
import 'package:todoapp/cubits/main_cubit/state.dart';
import 'package:todoapp/cubits/taskscubit/cubit.dart';
import 'package:todoapp/cubits/taskscubit/state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: defaultAppbar(context, state,
            isback: true, searchcontroller: _search, onsubmit: (v) {
          TasksCubit.get(context).search(v);
        }, onchanged: (v) {
          TasksCubit.get(context).search(v);
        }),
        body: BlocBuilder<TasksCubit, TaskState>(
          builder: (context, st) {
            final taskList = TasksCubit.get(context).searchTaskList();
            return st.searchValue.isEmpty
                ? Center(
                    child: defaultText("search task"),
                  )
                : taskList.isEmpty
                    ? Center(child: defaultText("No Results"))
                    : ListView.separated(
                        itemCount: taskList.length,
                        shrinkWrap: true,
                        padding:
                            EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) =>
                            taskItem(taskList[index], context));
          },
        ),
      ),
    );
  }
}
