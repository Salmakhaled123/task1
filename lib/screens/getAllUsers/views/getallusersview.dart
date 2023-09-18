import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/core/appcolors.dart';
import 'package:taskmanager/core/approuter.dart';
import 'package:taskmanager/screens/getAllUsers/view%20models/get_all_users_cubit.dart';
import 'package:taskmanager/screens/updateuserDetails/views/updateuserDetailsView.dart';

class GetAllUsersView extends StatelessWidget {
  const GetAllUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('users'),
      ),
      body: BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<GetAllUsersCubit>(context);
          if (state is GetAllUsersSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: ListView.builder(
                itemCount: cubit.users.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: ListTile(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.updateUserDetails,
                            extra: cubit.users[index]);
                      },
                      tileColor: AppColors.primaryColor,
                      title: Text(
                        'name : ${cubit.users[index].name}',
                      ),
                      leading: const Icon(Icons.person),
                      trailing: Text(cubit.users[index].userType),
                      subtitle: Text('email :${cubit.users[index].email}')),
                ),
              ),
            );
          } else  {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
        },
      ),
    );
  }
}
