import 'package:flutter/material.dart';
import 'package:taskmanager/screens/getDepartments/views/widgets/getDepartmentsViewbody.dart';
class GetAllDepartmentsView extends StatelessWidget {
  const GetAllDepartmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: GetAllDepartmentsViewBody()),);
  }
}
