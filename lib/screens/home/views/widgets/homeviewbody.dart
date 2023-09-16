import 'package:flutter/material.dart';
import 'package:taskmanager/core/appfont.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('HomeView',style:AppFont.text34,),);
  }
}
