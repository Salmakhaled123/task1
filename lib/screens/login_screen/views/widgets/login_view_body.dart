import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/core/appcolors.dart';
import 'package:taskmanager/core/appfont.dart';
import 'package:taskmanager/core/approuter.dart';
import 'package:taskmanager/core/loginmodel.dart';
import 'package:taskmanager/screens/login_screen/view_model/login_cubit.dart';

import 'custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 48.h),
        child: SingleChildScrollView(
          child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
            var cubit = BlocProvider.of<LoginCubit>(context);
            return Form(
                key: cubit.formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome Back!',
                        style: AppFont.text34,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Login to access your assigned tasks \n and personal overview.',
                        style: AppFont.text16
                            .copyWith(color: const Color(0xff7C808A)),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: cubit.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your email';
                          } else {
                            if (!cubit.regexEmail.hasMatch(value)) {
                              return 'please enter valid email';
                            }
                          }
                        },
                        hintText: 'Email',
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                          hintText: 'Password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            } else {
                              // if (!cubit.regex.hasMatch(value))
                              // {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //           content: Text(
                              //               'password must contain capital letter and special characters')));
                              //   return 'please enter valid password';
                              // }
                            }
                          },
                          inputType: TextInputType.visiblePassword,
                          controller: cubit.passController),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: cubit.isChecked,
                              onChanged: (value) {
                                cubit.checked(value);
                              }),
                          const Text('Keep me logged in')
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 312.w,
                        height: 48.h,
                        child: ElevatedButton(
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                               cubit.userLogin(cubit.emailController.text,
                                    cubit.passController.text);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Login Successfully')));
                                GoRouter.of(context).push(AppRouter.home);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor),
                            child: const Text('LOGIN')),
                      )
                    ]));
          }),
        ));
  }
}
