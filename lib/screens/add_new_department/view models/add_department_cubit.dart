import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:taskmanager/core/cacheHelper.dart';
import 'package:taskmanager/core/diohelper.dart';

part 'add_department_state.dart';

class AddDepartmentCubit extends Cubit<AddDepartmentState> {
  AddDepartmentCubit() : super(AddDepartmentInitial());
  addDepartment(name)async
  {
    try {
      await DioHelper.postData(
          options: Options(
              headers: {
              'Authorization':'Bearer${CacheHelper.getData(key: 'token')}'
         }),
         endPoint:'department/store' ,data:
         {
        'name':name,
      });
      print('done');
      emit(AddDepartmentSuccess());

    } on Exception catch (e) {
      // TODO
    }



  }
}
