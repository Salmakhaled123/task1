import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:taskmanager/core/cacheHelper.dart';
import 'package:taskmanager/core/diohelper.dart';
import 'package:taskmanager/core/loginmodel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final  formKey=GlobalKey<FormState>();
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp regexEmail = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
 Future  userLogin(String email,String password)async
  {
    emit(LoginLoading());
    try{
      Response data= await DioHelper.postData('/auth/login', email, password);
     LoginModel model= LoginModel.fromJson(data.data);
     CacheHelper.saveData(key: 'email', value: model.data.email);
      print(model.data.token);
     // FlutterSecureStorage().write(key: 'token', value: model.data.token);
      emit(LoginSuccess());

    }catch(error){

      print(error.toString());

      emit(LoginFailure());
    }


  }
 Future userLogOut()async
  {
    String token=CacheHelper.getData(key: 'token');

  // await DioHelper.postData( 'auth/logout',  email,);
   emit(LogoutSuccessfully());

  }
  bool isChecked=false;
 checked(value)
 {
   isChecked=value;
   emit(CheckedSuccessfully());
 }
}
