
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskmanager/core/userDataModel.dart';
import 'package:taskmanager/screens/addnewuser/viewmodels/add_new_user_cubit.dart';

import '../../../core/appcolors.dart';
import '../../../core/appfont.dart';
import '../../login_screen/views/widgets/custom_text_form_field.dart';

class AddNewUserViewBody extends StatelessWidget {
  AddNewUserViewBody({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  dynamic  types;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 48.h),
        child: SingleChildScrollView(
          child: BlocBuilder<AddNewUserCubit, AddNewUserState>(
              builder: (context, state) {
            var cubit = BlocProvider.of<AddNewUserCubit>(context);
            final key = GlobalKey<FormState>();
            return Form(
                key: key,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Add New User!',
                        style: AppFont.text34,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'create a new user now  \n assign them tasks right away',
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
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter the name';
                          }
                        },
                        hintText: 'Email',
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter the name';
                          }
                        },
                        hintText: 'Phone',
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: passController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter the name';
                          }
                        },
                        hintText: 'Password',
                        inputType: TextInputType.emailAddress,
                      ),
                      Row(
                        children: [
                          Radio(activeColor: AppColors.primaryColor,
                              value: 0, groupValue: types, onChanged: (value){
                            types=value;
                          cubit.changeType(value);

                          }),
                          const Text('Admin'),
                          Radio(activeColor: AppColors.primaryColor,
                              value: 1, groupValue: types, onChanged: (value){
                                   types=value;
                            cubit.changeType(value);

                          }),
                          const Text('manager'),
                          Radio(activeColor: AppColors.primaryColor,
                              value: 2, groupValue: types, onChanged: (value)
                              {
                                types=value;
                            cubit.changeType(value);
                          }),
                          const Text('user'),
                        ],
                      )

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
                      ,
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 312.w,
                        height: 48.h,
                        child: ElevatedButton(
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                try {
                                  cubit.addNewUser(UserModel(
                                    userType: types,
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passController.text,
                                  ),context);
                                 // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('added successfully')));
                                } on Exception catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('there is an error')));

                                  // TODO
                                }
                                //  cubit.addDepartment(nameController.text);

                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('created successfully')));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor),
                            child: const Text('CREATE')),
                      )
                    ]));
          }),
        ));
  }
}
