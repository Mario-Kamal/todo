import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
  }

  loading() {
    Timer(
      //السبلاش هتعقد قد ايه
      const Duration(seconds: 3),
      //ايه اللي بيحصل بعد مالوقت بيعدي
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const TasksScreen()),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffFF4444),
      ),
      child: Column(
        children: [
          Text(
            "My Tasks",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32.sp,
                color: Colors.white),
          ),
          Text("مهامي",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 32.sp,
                  color: Colors.white)),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
              height: 325.h,
              width: 340.w,
              child: SvgPicture.asset(
                "assets/1.svg",
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: 100.h,
          ),
          SizedBox(
              height: 50,
              width: 215.w,
              child: SvgPicture.asset(
                "assets/2.svg",
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: 100.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good",
                    style: TextStyle(
                        fontSize: 15.sp, color: Colors.white.withOpacity(0.5)),
                  ),
                  Text(
                    "Consistancy",
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset("assets/3.svg")
            ],
          )
        ],
      ),
    ));
  }
}
