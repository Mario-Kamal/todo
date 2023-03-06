import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/app_localization.dart';

import 'package:todoapp/cubits/main_cubit/cubit.dart';
import 'package:todoapp/cubits/main_cubit/state.dart';
import 'package:todoapp/cubits/taskscubit/cubit.dart';
import 'package:todoapp/cubits/taskscubit/state.dart';
import 'package:todoapp/screens/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todoapp/theme/text_thme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => MainCubit()..getAppTheme()),
        BlocProvider(
            create: (BuildContext context) => TasksCubit()..openDataBase()..getAppLang())
      ],
      child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return BlocBuilder<MainCubit, MainState>(builder: (context, state) {
              return BlocBuilder<TasksCubit,TaskState>(
                builder: (context,state) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      AppLocalization.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      Locale('en',),
                      Locale('ar',),
                    ],
                    locale: TasksCubit.get(context).locale,
                    theme: ThemeData(
                      textTheme: appTextTheme,
                      useMaterial3: true,
                    ),
                    home: const SplashScreen(),
                  );
                }
              );
            });
          }),
    );
  }
}
