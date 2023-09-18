import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/core/appImages.dart';
import 'package:taskmanager/core/appcolors.dart';
import 'package:taskmanager/core/appfont.dart';
import 'package:taskmanager/core/approuter.dart';
class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(backgroundColor: Color(0xffF3FAF9
    ),
      drawer: Drawer(),
      body:SafeArea(child: CustomAppBarView()) ,


    );
  }
}
class CustomAppBarView extends StatelessWidget {
  const CustomAppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // TabController tabController=TabController(length: 2, vsync:this );
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
           InkWell(onTap: (){
    print('sss');
    Scaffold.of(context).openDrawer();
    print("ff");
    },

        child: Image.asset(AppImages.drawerIcon)),
                Column(
                  children: [
                    const Text('Today',style: TextStyle(fontSize: 24),),
                    SizedBox(height: 5.h,),
                    const Text('11/9/2023'),
                  ],),
                const Spacer(),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),),
                  child: Column(children: [
                    const  Text('employee',style: AppFont.text14,),
                    SizedBox(height: 5.h,),
                    const   Text('department',style: AppFont.text14,),
                    SizedBox(height: 5.h,),
                    const  Text('task',style: AppFont.text14,),
                  ],),
                ),
                SizedBox(width: 5.w,),
                Container(height: 30.h,width: 30.w,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Icon(Icons.add),),
              ],
          ),
          Row(
            children: [
              IconButton(onPressed: (){},
                  icon: const Icon(Icons.person,)),
              const Text('Users'),
              const SizedBox(width: 20,),
              IconButton(onPressed: (){
                GoRouter.of(context).push(AppRouter.tasksView);
              },
                  icon: const Icon(Icons.task,)),
              const Text('Tasks'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 5),
            child: Row(
              children: [
                Container(height: 1.0,color: Colors.grey, width: 50.0),
                SizedBox(width: 3.w,),
                const Text('Department Name',),
                SizedBox(width: 3.w,),
                InkWell(child: Image.asset(AppImages.editIcon),onTap: (){},)

              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 4,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(width: 15.w,
                    height: 80.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 8.sp),
                      child: Row(
                        children: [
                          const VerticalDivider(indent: 10,endIndent: 10,
                              thickness: 1.55,color: AppColors.primaryColor),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                           const  Text('Employee Name'),
                             SizedBox(height: 7.h,),
                           const  Text('Admin'),
                            Row(children: [
                              Icon(Icons.email_outlined),
                              Text('user email'),

                            ],),
                          Row(children:const  [
                            Icon(Icons.phone),
                            Text('user phone'),

                          ]),



                          ]),
                        ],
                      ),
                    ),
                  );
                }),
          ),
           Row(
             children: [
               Container(height: 1.0,color: Colors.grey, width: 50.0),
               SizedBox(width: 3.w,),
               const Text('Department Name',),
               SizedBox(width: 3.w,),
               InkWell(child: Image.asset(AppImages.editIcon),onTap: (){},)
             ],
           ),
          SizedBox(height: 5.h,),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 4,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(width: 15.w,
                    height: 80.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 8.sp),
                      child: Row(
                        children: [
                          const VerticalDivider(endIndent: 10,indent: 10,
                              thickness: 1.55,color: AppColors.primaryColor),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const  Text('Employee Name'),
                                SizedBox(height: 7.h,),
                                const  Text('Admin'),
                                Row(children: [
                                  Icon(Icons.email_outlined),
                                  Text('user email'),

                                ],),
                                Row(children:const  [
                                  Icon(Icons.phone),
                                  Text('user phone'),

                                ]),



                              ]),
                        ],
                      ),
                    ),
                  );
                }),
          ),


        ],
      ));



  }
}

