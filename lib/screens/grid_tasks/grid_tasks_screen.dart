import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todoapp/appColors.dart';
import 'package:todoapp/cubits/main_cubit/cubit.dart';
import 'package:todoapp/cubits/main_cubit/state.dart';
import 'package:todoapp/cubits/taskscubit/cubit.dart';
import 'package:todoapp/cubits/taskscubit/state.dart';
import 'package:todoapp/model/task_model.dart';

class GridTasksScreen extends StatelessWidget {
  const GridTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) => Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Whats on your mind?",
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 40.h,
              ),
              BlocBuilder<TasksCubit, TaskState>(
                  builder: (context, state) => GridView.builder(
                        itemBuilder: (context, index) =>
                            _gridItem(state.tasks[index], context),
                        itemCount: state.tasks.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 22.0.w,
                          mainAxisSpacing: 22.0.h,
                        ),
                      ))
            ],
          )),
    );
  }

  Widget _gridItem(TaskModel? taskModel, ctx) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.contBackColor,
        ),
        height: 175.h,
        width: 165.w,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskModel?.title ?? "",
              style: TextStyle(
                  color: HexColor(
                    "#FFFFFF",
                  ),
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp),
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(taskModel?.task ?? "",
                style: TextStyle(
                    color: HexColor(
                      "#FFFFFF",
                    ),
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp)),
            Spacer(),
            Row(
              children: [
                Spacer(),
                Icon(
                  Icons.check_box_outlined,
                  color: Colors.white,
                  size: 25.sp,
                ),
                SizedBox(
                  width: 15.w,
                ),
                IconButton(
                  onPressed: () {
                    TasksCubit.get(ctx).deleteFromDB(id: taskModel?.id);
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                )
              ],
            )
          ],
        ),
      );
}
