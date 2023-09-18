import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskmanager/core/appcolors.dart';
import 'package:taskmanager/core/approuter.dart';
import 'package:taskmanager/core/cacheHelper.dart';
import 'package:taskmanager/core/diohelper.dart';
import 'package:taskmanager/screens/add_new_department/view%20models/add_department_cubit.dart';
import 'package:taskmanager/screens/addnewuser/viewmodels/add_new_user_cubit.dart';
import 'package:taskmanager/screens/getDepartments/view%20models/get_all_departments_cubit.dart';
import 'package:taskmanager/screens/login_screen/view_model/login_cubit.dart';
import 'package:taskmanager/screens/update_department/view_models/update_department_cubit.dart';
import 'package:taskmanager/screens/updateuserDetails/viewmodels/updateuserdetailsCubit.dart';
import 'package:taskmanager/screens/updateuserDetails/views/updateuserDetailsView.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const TaskManager());
}

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> UpdateUserDetailsCubit()),
      BlocProvider(create: (context)=>UpdateDepartmentCubit()),
      BlocProvider(create: (context)=> GetAllDepartmentsCubit()..getAllDepartments()),

      BlocProvider(create: (context)=>LoginCubit()),
      BlocProvider(create: (context)=>AddDepartmentCubit()),
      BlocProvider(create: (context)=>AddNewUserCubit(),
      ),

    ],
      child: ScreenUtilInit(designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return  MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          );
        },

      ),
    );
  }
}
