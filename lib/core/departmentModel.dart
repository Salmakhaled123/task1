
class DepartmentDataModel{
  final int id;
  final String name;

  DepartmentDataModel({ required this.id, required this.name});
  factory DepartmentDataModel.fromJson(Map<String,dynamic>json)
  {
    return DepartmentDataModel(id: json['id'],
        name: json['name']);
  }
}