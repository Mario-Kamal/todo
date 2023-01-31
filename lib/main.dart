import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todoapp/cubits/main_cubit/cubit.dart';
import 'package:todoapp/cubits/main_cubit/state.dart';
import 'package:todoapp/cubits/taskscubit/cubit.dart';
import 'package:todoapp/locator.dart';
import 'package:todoapp/screens/list_tasks/tasks_screen.dart';
import 'package:todoapp/screens/splash.dart';

void main() {
  Servicelocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) =>MainCubit()),
        BlocProvider(
          create: (BuildContext context) =>TasksCubit()..openDataBase())
      ],
      child: ScreenUtilInit(
          designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
      return BlocBuilder<MainCubit,MainState>(
        builder: (context,state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.blue,

            ),
            home: const  SplashScreen(),
          );
        }
      );
  }),
    );
}}
