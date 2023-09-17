part of 'add_new_user_cubit.dart';

@immutable
abstract class AddNewUserState {}

class AddNewUserInitial extends AddNewUserState {}
class AddNewUserSuccess extends AddNewUserState {}
class ChangedSuccess extends AddNewUserState{}