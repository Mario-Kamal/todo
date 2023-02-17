import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/component/widgets.dart';
import 'package:todoapp/const.dart';
import 'package:todoapp/cubits/main_cubit/cubit.dart';
import 'package:todoapp/cubits/main_cubit/state.dart';
import 'package:todoapp/cubits/taskscubit/cubit.dart';
import 'package:todoapp/cubits/taskscubit/state.dart';

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
              defaultText(whatIsOnYourMind),
              SizedBox(
                height: 40.h,
              ),
              BlocBuilder<TasksCubit, TaskState>(
                  builder: (context, state) => GridView.builder(
                        itemBuilder: (context, index) =>
                            gridItem(state.tasks[index], context),
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

}
