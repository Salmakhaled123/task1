import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskmanager/core/cacheHelper.dart';
import 'package:taskmanager/core/diohelper.dart';
import 'package:taskmanager/screens/getDepartments/view%20models/get_all_departments_cubit.dart';
part 'update_department_state.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentState> {
  UpdateDepartmentCubit() : super(UpdateDepartmentInitial());
  updateDepartment({required int id,required String name,context})async
  {
    try{
    await  DioHelper.postData(endPoint: 'department/update/$id',
          data: {
            'name':name
          },
          options:Options(headers:
          {
            'Authorization':'Bearer${CacheHelper.getData(key: 'token')}'
          }));
    BlocProvider.of<GetAllDepartmentsCubit>(context).getAllDepartments();
    print('updated success');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('updated successfully')));
    emit(UpdateDepartmentSuccess());
    }catch(error){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong in update')));

    }
  }
}
