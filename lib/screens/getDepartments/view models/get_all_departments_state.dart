part of 'get_all_departments_cubit.dart';

@immutable
abstract class GetAllDepartmentsState {}

class GetAllDepartmentsInitial extends GetAllDepartmentsState {}
class GetAllDepartmentsSuccess extends GetAllDepartmentsState {}
class GetAllDepartmentsLoading extends GetAllDepartmentsState {}
class GetAllDepartmentsFailure extends GetAllDepartmentsState {}
