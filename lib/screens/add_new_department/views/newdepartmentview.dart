import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/core/appcolors.dart';
import 'package:taskmanager/core/appfont.dart';
import 'package:taskmanager/core/approuter.dart';
import 'package:taskmanager/screens/add_new_department/view%20models/add_department_cubit.dart';
import 'package:taskmanager/screens/login_screen/view_model/login_cubit.dart';
import '../../login_screen/views/widgets/custom_text_form_field.dart';


class AddDepartment extends StatelessWidget {
 const  AddDepartment({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();

    return Scaffold(
       body: Padding(
           padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 48.h),
           child: SingleChildScrollView(
             child: BlocBuilder<AddDepartmentCubit, AddDepartmentState>(builder: (context, state) {
               var cubit = BlocProvider.of<AddDepartmentCubit>(context);
               final key=GlobalKey<FormState>();
               return Form(
                   key: key,
                   child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         const Text(
                           'New Department',
                           style: AppFont.text34,
                         ),
                         SizedBox(
                           height: 20.h,
                         ),
                         Text(
                           textAlign: TextAlign.center,
                           'create a new department now  \n assign a manager to start the work',
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
                                   cubit.addDepartment(nameController.text);
                                   GoRouter.of(context).push(AppRouter.addNewUser);
                                            }
                               },
                               style: ElevatedButton.styleFrom(
                                   backgroundColor: AppColors.primaryColor),
                               child: const Text('CREATE')),
                         )
                       ]));
             }),
           )),
    );
  }
}
