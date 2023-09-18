import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../core/allusersmodel.dart';
import '../../../core/diohelper.dart';
import '../../../core/userDataModel.dart';

part 'get_all_users_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit() : super(GetAllUsersInitial());
  List<AllUserModel>users=[];
  Future getAllUsers()async
  {
    users=[];
    emit(GetAllUsersLoading());
    try {
      Response  data=await  DioHelper.getData(endPoint: 'user/index');
      data.data['data'].forEach((item){
        users.add(AllUserModel.fromJson(item));
      });
      emit(GetAllUsersSuccess());

    } on Exception catch (e) {
      emit(GetAllUsersFailure());
      print(e.toString());
      // TODO
    }

  }
}
