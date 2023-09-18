import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/screens/getAllUsers/view%20models/get_all_users_cubit.dart';

import '../../../../core/appcolors.dart';
import '../../../../core/approuter.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Drawer(
        child: Column(children:
        [
          const   UserAccountsDrawerHeader(decoration: BoxDecoration(color: AppColors.primaryColor),
              accountName: Text('admin'), accountEmail: Text('admin@admin.com')),
          Column(children: [
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                onPressed: (){
                  GoRouter.of(context).push(AppRouter.addDepartment);
                }, child: const Text('add new department')),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                onPressed: (){
                  GoRouter.of(context).push(AppRouter.addNewUser);
                }, child: const Text('add new user')),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                onPressed: (){
                  GoRouter.of(context).push(AppRouter.getAllDepartments);
                }, child: const Text('get All Departments')),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                onPressed: (){
                  GoRouter.of(context).push(AppRouter.updateUserDetails);
                }, child: const Text('Update User Details')),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                onPressed: (){
              BlocProvider.of<GetAllUsersCubit>(context).getAllUsers();
                  GoRouter.of(context).push(AppRouter.getAllUsers);
                }, child: const Text('Get All Users')),



          ],

          )
        ]),),
    );
  }
}
