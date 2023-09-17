import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/core/appcolors.dart';
import 'package:taskmanager/core/appfont.dart';
import 'package:taskmanager/screens/getDepartments/view%20models/get_all_departments_cubit.dart';
import 'package:taskmanager/screens/update_department/views/updateDepartmentView.dart';

class GetAllDepartmentsViewBody extends StatelessWidget {
  const GetAllDepartmentsViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDepartmentsCubit, GetAllDepartmentsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<GetAllDepartmentsCubit>(context);
        if (state is GetAllDepartmentsSuccess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cubit.departments.length,
              itemBuilder: (context, index) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                 UpdateDepartmentView(name: cubit.departments[index].name, id: cubit.departments[index].id)), );

                          },
                          child: Card(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                cubit.departments[index].name,
                                style: AppFont.text34,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ));
        } else if (state is GetAllDepartmentsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
