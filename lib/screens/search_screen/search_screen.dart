import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/appColors.dart';
import 'package:todoapp/component/defaultappbar.dart';
import 'package:todoapp/component/taskitem.dart';
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
        appBar: DefaultAppbar(context, state,
            isback: true, searchcontroller: _search, onsubmit: (v) {
          TasksCubit.get(context).search(v);
        }, onchanged: (v) {
          TasksCubit.get(context).search(v);
        }),
        body: BlocBuilder<TasksCubit, TaskState>(
          builder: (context, st) {
            final taskslist = st.tasks
                .where((element) =>
                    element.title?.contains(st.searchvalue ?? '') ?? false)
                .toList();
            return st.searchvalue.isEmpty
                ? Center(
                    child: Text(
                      "search task",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor),
                    ),
                  )
                : taskslist.isEmpty
                    ? Center(
                        child: Text(
                          "No Results",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor),
                        ),
                      )
                    :  ListView.separated(
                            itemCount: taskslist.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                                top: 20.h, left: 20.w, right: 20.w),
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (context, index) =>
                                taskItem(taskslist[index], context));
          },
        ),
      ),
    );
  }
}
