import 'package:flutter/material.dart';
import 'package:taskmanager/screens/addnewuser/views/addnewuserViewBody.dart';
class AddNewUserView extends StatelessWidget {
  const AddNewUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: AddNewUserViewBody(),);
  }
}
