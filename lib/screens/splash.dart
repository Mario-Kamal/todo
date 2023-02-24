import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/theme/appcolors.dart';
import 'package:todoapp/component/widgets.dart';
import 'package:todoapp/resources/const.dart';
import 'package:todoapp/screens/list_tasks/tasks_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
    loading();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
    super.dispose();
  }

  loading() {
    Timer(
      //Time taken
      const Duration(seconds: 3),
      //What will be done after splash
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) =>  const TasksScreen()),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.splashScreenColor,
      ),
      child: Column(
        children: [
          Text(myTasksSplash,style: Theme.of(context).textTheme.bodyLarge,),
          Text(myTasksArSplash,style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(
            height: 50.h,
          ),
          svgSizedBox(325.h, 340.w, mainSplashImage),
          SizedBox(
            height: 100.h,
          ),
          svgSizedBox(50.h, 215.w, lineSplashImage),
          SizedBox(
            height: 100.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(goodSplash,style: Theme.of(context).textTheme.bodyMedium,),
                  Text(consistencySplash,style: Theme.of(context).textTheme.bodyMedium,)
                ],
              ),
              const Spacer(),
              SvgPicture.asset(cupSplashIcon)
            ],
          )
        ],
      ),
    ));
  }
}
