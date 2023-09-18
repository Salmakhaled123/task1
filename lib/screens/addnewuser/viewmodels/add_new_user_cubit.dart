import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taskmanager/core/cacheHelper.dart';
import 'package:taskmanager/core/diohelper.dart';
import '../../../core/userDataModel.dart';
part 'add_new_user_state.dart';

class AddNewUserCubit extends Cubit<AddNewUserState> {
  AddNewUserCubit() : super(AddNewUserInitial());
  //dynamic type;
  changeType(value)
  {
    if(value==0 || value==1 ||value==2)
      {
        emit(ChangedSuccess());

      }
  }
 Future addNewUser(UserModel model,context)async
  {

    try{
      Response data= await DioHelper.postData(endPoint: 'user/store',data: {
        'name':model.name,
        'email':model.email,
        'phone':model.phone,
        'password':model.password,
        'user_type':model.userType.toString()
      },
         options: Options(headers: {
        'Authorization':'Bearer${CacheHelper.getData(key: 'token')}'
      }));
      print('add new user success');
      print(data.data['message']);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('added successfully')));

      emit(AddNewUserSuccess());
    }catch(error){

      print(error.toString());

    }
  }
}


