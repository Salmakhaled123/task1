import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:taskmanager/core/departmentModel.dart';
import 'package:taskmanager/core/diohelper.dart';

part 'get_all_departments_state.dart';

class GetAllDepartmentsCubit extends Cubit<GetAllDepartmentsState> {
  GetAllDepartmentsCubit() : super(GetAllDepartmentsInitial());
  List<DepartmentDataModel>departments=[];
 Future getAllDepartments()async
  {
    departments=[];
    emit(GetAllDepartmentsLoading());
  try {
    Response  data=await  DioHelper.getData(endPoint: 'department/index');
    data.data['data'].forEach((item){
      departments.add(DepartmentDataModel.fromJson(item));
    });
    emit(GetAllDepartmentsSuccess());
  } on Exception catch (e) {
    print(e.toString());
    emit(GetAllDepartmentsFailure());
    // TODO
  }

  }
}
