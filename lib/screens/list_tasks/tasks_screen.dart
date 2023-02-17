import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/appcolors.dart';

import 'package:todoapp/component/component.dart';
import 'package:todoapp/component/defaultappbar.dart';
import 'package:todoapp/component/taskitem.dart';
import 'package:todoapp/component/widgets.dart';
import 'package:todoapp/cubits/enums.dart';
import 'package:todoapp/cubits/main_cubit/cubit.dart';
import 'package:todoapp/cubits/main_cubit/state.dart';
import 'package:todoapp/cubits/taskscubit/cubit.dart';
import 'package:todoapp/cubits/taskscubit/state.dart';
import 'package:todoapp/screens/grid_tasks/grid_tasks_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: defaultAppbar(context, state),
        body: BlocBuilder<TasksCubit, TaskState>(
          builder: (context, st) => st.tasks.isEmpty
              ? Center(
                  child: defaultText("Please add some tasks"),
                )
              : st.requestState == RequestState.error
                  ? const Center(child: Text('error'))
                  : ((state.viewType == ViewType.list)
                      ? ListView(
                          padding: EdgeInsets.only(
                              top: 50.h, left: 20.w, right: 20.w),
                          children: [
                            defaultText("Whats on your mind?"),
                            SizedBox(
                              height: 40.h,
                            ),
                            ListView.separated(
                                itemCount: st.tasks.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemBuilder: (context, index) =>
                                    taskItem(st.tasks[index], context)),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        )
                      : const GridTasksScreen()),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColors.floatingColor,
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              context: context,
              builder: (BuildContext context) {
                return ShowBottomModalSheet();
              },
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.bottomNavColor,
          currentIndex: 0,
          selectedItemColor: AppColors.bottomSelectedItemColor,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
          unselectedItemColor: AppColors.bottomUnselectedIconColor,
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: AppColors.bottomUnselectedIconColor),
          elevation: 0,
          onTap: (n) {
            if (n == 1) {
              MainCubit.get(context).changeapptheme();
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 28.r,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                state.appTheme
                    ? Icons.nightlight_outlined
                    : Icons.light_mode_outlined,
                size: 25.r,
              ),
              label: state.appTheme ? "Night Light" : "Day Light",
            ),
          ],
        ),
      ),
    );
  }
}
