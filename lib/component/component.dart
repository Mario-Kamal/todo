import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/cubits/taskscubit/cubit.dart';
import 'package:todoapp/model/task_model.dart';

class ShowBottomModalSheet extends StatelessWidget {
  ShowBottomModalSheet({Key? key}) : super(key: key);
  final TextEditingController _title = TextEditingController();
  final TextEditingController _task = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Divider(
                thickness: 10.0,
                height: 10.0.h,
                indent: 150.0,
                endIndent: 150.0,
              )),
              SizedBox(
                width: 310.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Text("Todo Title",style: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.w400),),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextFormField(
                      controller: _title,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Todo title.....',
                        labelText: 'Todo Title',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your task ";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text("Task",style: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.w400),),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextFormField(
                      controller: _task,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Write anything in your mind ',
                        labelText: 'Task',
                      ),
                      validator: (value) {
                         if (value!.isEmpty) {
                          return "Please enter your task ";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 57.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xff9D1212),),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                  ),
                    onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      TasksCubit.get(context)
                          .insertToDB(TaskModel(title: _title.text, task: _task.text))
                          .then((value) => Navigator.pop(context));
                    }
                    },
                    child: Center(child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.w400),),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
