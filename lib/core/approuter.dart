import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/core/updateDepartmentModel.dart';
import 'package:taskmanager/screens/add_new_department/views/newdepartmentview.dart';
import 'package:taskmanager/screens/addnewuser/views/addnewuser.dart';
import 'package:taskmanager/screens/getDepartments/views/getAllDepartmentsView.dart';
import 'package:taskmanager/screens/home/views/homeview.dart';
import 'package:taskmanager/screens/login_screen/views/login_view.dart';
import 'package:taskmanager/screens/update_department/views/updateDepartmentView.dart';
import 'package:taskmanager/screens/updateuserDetails/views/updateuserDetailsView.dart';

class AppRouter{
  static String home='/home';

  static String updateDepartment='/updateDepartment';
  static String updateUserDetails='/updateUserDetails';
  static String addNewUser='/newUser';
  static String getAllDepartments='/departments';
  static String addDepartment='/addDepartment';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },

      ),
      GoRoute(
        path:home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },

      ),
      GoRoute(
        path:addDepartment,
        builder: (BuildContext context, GoRouterState state) {
          return const AddDepartment();
        },

      ),
      GoRoute(
        path:addNewUser,
        builder: (BuildContext context, GoRouterState state) {
          return const AddNewUserView();
        },

      ),
      GoRoute(
        path:getAllDepartments,
        builder: (BuildContext context, GoRouterState state) {
          return const GetAllDepartmentsView();
        },

      ),
      GoRoute(
        path: updateDepartment,
        builder: (BuildContext context, GoRouterState state) {
          return  UpdateDepartmentView();
        },

      ),

      GoRoute(
        path:updateUserDetails,
        builder: (BuildContext context, GoRouterState state) {
          return   UpdateUserDetailsView();
        },

      ),
    ],
  );
}