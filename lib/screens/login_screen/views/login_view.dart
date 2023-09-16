import 'package:flutter/material.dart';
import 'package:taskmanager/screens/login_screen/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
