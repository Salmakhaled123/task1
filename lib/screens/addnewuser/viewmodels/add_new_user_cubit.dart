import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:taskmanager/core/cacheHelper.dart';
import 'package:taskmanager/core/diohelper.dart';
import '../../../core/userDataModel.dart';
part 'add_new_user_state.dart';

class AddNewUserCubit extends Cubit<AddNewUserState> {
  AddNewUserCubit() : super(AddNewUserInitial());
  dynamic type;
  changeType(value)
  {
    if(value==RadioButton.admin || value==RadioButton.user ||value==RadioButton.user)
      {
        emit(ChangedSuccess());

      }
  }
 Future addNewUser(UserModel model)async
  {
    try{
     await DioHelper.postData(endPoint: 'user/store',data: {
        'name':model.name,
        'email':model.email,
        'phone':model.phone,
        'password':model.password,
        'user_type':'2'
      },
         options: Options(headers: {
        'Authorization':'Bearer${CacheHelper.getData(key: 'token')}'
      }));
      print('add new user success');
      emit(AddNewUserSuccess());
    }catch(error){
      print(error.toString());
    }
  }
}
enum RadioButton {admin,manager,user }

