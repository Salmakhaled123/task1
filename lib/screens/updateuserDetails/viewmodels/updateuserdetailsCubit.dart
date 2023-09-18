import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:taskmanager/core/allusersmodel.dart';
import 'package:taskmanager/core/approuter.dart';
import 'package:taskmanager/core/cacheHelper.dart';
import 'package:taskmanager/core/diohelper.dart';

part 'update_user_details_state.dart';

class UpdateUserDetailsCubit extends Cubit<UpdateUserDetailsState> {
  UpdateUserDetailsCubit() : super(UpdateUserDetailsInitial());
  changeType(value)
  {
    if(value==0 || value==1 ||value==2)
    {
      emit(ChangedSuccessfully());

    }
  }
  updateUserDetails(AllUserModel model,context)async
  {
   try {
     Response response= await DioHelper.postData(options: Options(headers: {
       'Authorization':'Bearer${CacheHelper.getData(key: 'token')}'
     }),
         endPoint: 'user/update/${model.id}',data:
     {
        'name':model.name,
        'email':model.email,
        'phone':model.phone,
        'user_type':model.userType,
         'user_status':model.userStatus
      });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.data['message'])));
     print(response.data['message']);
     emit(UpdatedSuccessfully());
   } on Exception catch (e)
   {
     emit(UpdateFailed());
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong in update')));

     print(e.toString());
     // TODO
   }
  }
}
