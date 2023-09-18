import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../core/appImages.dart';
import '../../../core/appcolors.dart';

class TasksView extends StatelessWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 20.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                 GestureDetector(
                onTap: ()
              {
              print("jj");
              Scaffold.of(context).openDrawer();
              },
              child: Image.asset(AppImages.drawerIcon)),
                  Column(
                    children: [
                       Text('Today',style: TextStyle(fontSize: 24.sp),),
                      SizedBox(height: 5.h,),
                      const Text('11/9/2023'),
                    ],),
                  SizedBox(width: 10.w,),
                  CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 4.0,
                    percent: 0.7,
                    center: const Text('9/20'),
                    progressColor: Colors.green,
                  ),
                   SizedBox(width: 5.w,),
                  CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 4.0,
                    percent: 0.7,
                    center: const Text('5/20'),
                    progressColor: Colors.orange,
                  ),
                  SizedBox(width: 5.w,),
                  CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 4.0,
                    percent: 0.7,
                    center: const Text('6/20'),
                    progressColor: Colors.pink,
                  ),



                ]),
            Expanded(
              child: ListView.builder(physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=> Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: CustomCard(name: categoriesName[index]),
                ),
                itemCount: categoriesName.length,),
            )


          ],
        ),
      ),
    ),);
  }
}
List<String>categoriesName=[
  'NEW',
  'PROCESSING',
  'NOT COMPLETED',
  'EXPIRED',
  'COMPLETED'
  
];
class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.name}) : super(key: key);
final String name;
  @override
  Widget build(BuildContext context) {
    return  Card(elevation:5 ,
      child: Container(width: 312.w,
        height: 150.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.grey[200],

            borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.grey)),
        child: Padding(
          padding:  EdgeInsets.only(left: 8.sp),
          child: Row(
            children: [
              const VerticalDivider(indent:35,endIndent: 23,
                  thickness: 3,color: AppColors.primaryColor),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                           Text(name,style: const TextStyle(fontSize: 21),),
                        const SizedBox(height: 5,),
                        Container(width: 300,color: Colors.grey.withOpacity(0.4),height: 2.0,)
                      ],
                    ),
                    Row(children: [
                     const  Text('Create a high -intensity interval....'),
                     const SizedBox(width: 40,),
                      IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.ellipsisVertical)),

                    ],),
                    const Text('Design a 20 minute HIIT workout routine .'),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      IconButton(padding: const EdgeInsets.all(0),
                          onPressed: (){}, icon: const Icon(Icons.access_time_outlined)),
                      const Text('starts 12/9/2023 -ends 16/9/2023')
                    ],)




                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
