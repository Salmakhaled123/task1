part of 'updateuserdetailsCubit.dart';

@immutable
abstract class UpdateUserDetailsState {}

class UpdateUserDetailsInitial extends UpdateUserDetailsState {}
class ChangedSuccessfully extends UpdateUserDetailsState{}
class UpdatedSuccessfully extends UpdateUserDetailsState{}
class UpdateFailed extends UpdateUserDetailsState{}