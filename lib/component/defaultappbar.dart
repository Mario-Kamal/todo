import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/app_localization.dart';
import 'package:todoapp/theme/appcolors.dart';
import 'package:todoapp/component/widgets.dart';
import 'package:todoapp/cubits/enums.dart';
import 'package:todoapp/cubits/main_cubit/cubit.dart';
import 'package:todoapp/cubits/taskscubit/cubit.dart';
import 'package:todoapp/resources/translate_keys.dart';
import 'package:todoapp/screens/search_screen/search_screen.dart';

PreferredSizeWidget defaultAppbar(context, state,
        {bool isback = false,
        TextEditingController? searchcontroller,
        onsubmit,
        onchanged}) =>
    AppBar(
      toolbarHeight: 75.h,
      leading: Container(),
      backgroundColor: AppColors.mainColor,
      leadingWidth: 0,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.0.h, horizontal: 5.w),
        child: Row(
          children: [
            TextButton(onPressed: (){
              TasksCubit.get(context).changeLanguage();
            }, child: TasksCubit.get(context).isEn?defaultText("En"):defaultText("Ar")),
            IconButton(
                onPressed: () {
                  if (isback) {
                    Navigator.pop(context);
                  } else {
                    MainCubit.get(context).changeViewType();
                  }
                },
                icon: Icon(
                  isback
                      ? Icons.arrow_back_ios_new_rounded
                      : state.viewType == ViewType.grid
                          ? Icons.menu
                          : Icons.grid_view_sharp,
                  color: AppColors.iconColor,
                  size: 30.r,
                )),
            if (searchcontroller == null)
              SizedBox(
                width: 70.w,
              ),
            if (searchcontroller != null)
              Expanded(
                  child: TextFormField(
                onFieldSubmitted: onsubmit,
                onChanged: onchanged,
                style: TextStyle(color: AppColors.textColor),
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                controller: searchcontroller,
                decoration: InputDecoration(
                  hintText: 'search',
                  filled: true,
                  fillColor: AppColors.mainColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: AppColors.appBarColor)),
                  hintStyle: TextStyle(
                    color: AppColors.textColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.appBarColor),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(width: 1, color: AppColors.appBarColor),
                  ),
                  enabled: true,

                  // labelText: labelText,
                ),
              )),
            if (searchcontroller == null)
              Text(
                AppLocalization.of(context).getTranslatedValues(TranslateKeys.myTasks),
                style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textColor),
              ),
            if (searchcontroller == null) const Spacer(),
            if (searchcontroller == null)
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  icon: Icon(Icons.search,
                      size: 25.sp, color: AppColors.appBarIconColor))
          ],
        ),
      ),
    );
