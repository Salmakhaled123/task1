part of 'get_all_users_cubit.dart';

@immutable
abstract class GetAllUsersState {}

class GetAllUsersInitial extends GetAllUsersState {}
class GetAllUsersSuccess extends GetAllUsersState {}
class GetAllUsersLoading extends GetAllUsersState {}
class GetAllUsersFailure extends GetAllUsersState {}

