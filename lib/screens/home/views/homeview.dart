import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/screens/home/views/widgets/customDrawer.dart';
import 'package:taskmanager/screens/home/views/widgets/homeviewbody.dart';
import 'package:taskmanager/screens/login_screen/view_model/login_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: const CustomDrawer(),
      appBar: AppBar(
      actions:
    [
      BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          var cubit=BlocProvider.of<LoginCubit>(context);
          return IconButton(onPressed: ()
          {
               cubit.userLogOut();
               GoRouter.of(context).pop();
          }, icon: const Icon(Icons.logout_outlined));
        },
      )
    ],),
      body: const HomeViewBody(),);
  }
}

