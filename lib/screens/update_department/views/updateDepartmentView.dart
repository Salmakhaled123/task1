import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/core/approuter.dart';
import 'package:taskmanager/core/updateDepartmentModel.dart';
import 'package:taskmanager/screens/getDepartments/view%20models/get_all_departments_cubit.dart';
import 'package:taskmanager/screens/getDepartments/views/getAllDepartmentsView.dart';
import 'package:taskmanager/screens/update_department/view_models/update_department_cubit.dart';

import '../../../core/appcolors.dart';
import '../../../core/appfont.dart';
import '../../login_screen/views/widgets/custom_text_form_field.dart';

class UpdateDepartmentView extends StatelessWidget {
  UpdateDepartmentView({Key? key,  this.name,  this.id,  }) : super(key: key);
   final String? name;
   final int ?id;
  TextEditingController nameController = TextEditingController();
  TextEditingController assignedController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text=name!;
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 48.h),
          child: SingleChildScrollView(
            child: BlocBuilder<UpdateDepartmentCubit, UpdateDepartmentState>(
                builder: (context, state) {
              var cubit = BlocProvider.of<UpdateDepartmentCubit>(context);
              final key = GlobalKey<FormState>();

              return Form(
                  key: key,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Update Department!',
                          style: AppFont.text34,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Update department details and\n assign new  a manager to continue work',
                          style: AppFont.text16
                              .copyWith(color: const Color(0xff7C808A)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the name';
                            }
                          },
                          hintText: 'Name',
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          controller: assignedController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the name';
                            }
                          },
                          hintText: 'Assigned Manager',
                          inputType: TextInputType.emailAddress,
                        ),
                        // CustomTextFormField(
                        //     hintText: 'Assigned manager',
                        //     validator: (value) {
                        //       if (value!.isEmpty) {
                        //         return 'please enter assigned manager';
                        //       } else {
                        //         // if (!cubit.regex.hasMatch(value))
                        //         // {
                        //         //   ScaffoldMessenger.of(context).showSnackBar(
                        //         //       const SnackBar(
                        //         //           content: Text(
                        //         //               'password must contain capital letter and special characters')));
                        //         //   return 'please enter valid password';
                        //         // }
                        //       }
                        //     },
                        //     inputType: TextInputType.visiblePassword,
                        //     controller: cubit.passController),
                        SizedBox(
                          height: 20.h,
                        ),

                        SizedBox(
                          width: 312.w,
                          height: 48.h,
                          child: ElevatedButton(
                              onPressed: () {
                                if (key.currentState!.validate()) {
                                  cubit.updateDepartment(context: context,
                                      id: id!, name: nameController.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Updated Successfully'),
                                    ),
                                  );

                                GoRouter.of(context).push(AppRouter.getAllDepartments);
                                  // cubit.addDepartment(nameController.text);
                                  // GoRouter.of(context).push(AppRouter.addNewUser);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor),
                              child: const Text('UPDATE')),
                        )
                      ]));
            }),
          )),
    );
  }
}
