import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/appcolors.dart';
import 'package:todoapp/cubits/taskscubit/cubit.dart';
import 'package:todoapp/model/task_model.dart';

Widget defaultText(text) => Text(text,
    style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor));
Widget mainSplashText(text,fontSize) => Text(text,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: Colors.white));
Widget svgSizedBox(height,width,image)=>SizedBox(
    height: height,
    width: width,
    child: SvgPicture.asset(
      "$image",
      fit: BoxFit.fill,
    ));
Widget gridItem(TaskModel? taskModel, ctx) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20.r),
    color: AppColors.contBackColor,
  ),
  height: 175.h,
  width: 165.w,
  padding: const EdgeInsets.all(20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        taskModel?.title ?? "",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp),
      ),
      SizedBox(
        height: 22.h,
      ),
      Text(taskModel?.task ?? "",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 16.sp)),
      const Spacer(),
      Row(
        children: [
          const Spacer(),
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


