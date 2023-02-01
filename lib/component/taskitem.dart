import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todoapp/appColors.dart';
import 'package:todoapp/cubits/taskscubit/cubit.dart';
import 'package:todoapp/model/task_model.dart';

Widget taskItem(TaskModel? taskModel, ctx) => Container(
      decoration: BoxDecoration(
          color: AppColors.contBackColor,
          borderRadius: BorderRadius.circular(20)),
      height: 100.h,
      width: 320.w,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
        child: Row(
          children: [
            Icon(
              Icons.check_box_outlined,
              color: Colors.white,
              size: 25.sp,
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              children: [
                Text(
                  taskModel?.title ?? '',
                  style: TextStyle(
                      color: HexColor(
                        "#FFFFFF",
                      ),
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(taskModel?.task ?? '',
                    style: TextStyle(
                        color: HexColor(
                          "#FFFFFF",
                        ),
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp)),
              ],
            ),
            const Spacer(),
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
        ),
      ),
    );
