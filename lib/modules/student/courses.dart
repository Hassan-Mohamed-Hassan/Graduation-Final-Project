
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quickalert/quickalert.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:untitled15/modules/student/Bloc/cubit.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';
import 'package:untitled15/modules/student/getvideo.dart';
import 'package:untitled15/modules/student/show_video.dart';


import 'drawer.dart';
import '../../constants/constants.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>EducationCubit()..getCources()..getCourcesClass(),
      child: BlocConsumer<EducationCubit,EducationStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=EducationCubit.get(context);
          return Scaffold(
              appBar: AppBar(),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(profileData),
              ),
              body:SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child:cubit.cources!=null&&cubit.courseClassResponse!=null?  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DropdownButton<String>(
                          value: cubit.dropdownCourse,
                          onChanged: (String? newValue) {
                            cubit.dropdownCourse=newValue!;
                            cubit.isAllCourses=!cubit.isAllCourses;
                            cubit.refrch();
                          },
                          isExpanded: true,
                          iconSize: 40,
                          alignment: AlignmentDirectional.center,
                          items: <String>['All', 'Class'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: TextStyle(fontSize: 20,color: defaultColor),),
                            );
                          }).toList(),
                        ),
                      ),
                     cubit.isAllCourses? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder:(contex,index)=> Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              '${cubit.cources!.courses[index].image}',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${cubit.cources!.courses[index].name}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                  fontSize: 15,
                                ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${cubit.cources!.courses[index].createdAt!.createdAt}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:  TextStyle(fontSize: 12, height: 1.5),

                                ),
                                Spacer(),
                                Text(
                                  '${cubit.cources!.courses[index].createdAt!.createdAtDate!.year}/'
                                      '${cubit.cources!.courses[index].createdAt!.createdAtDate!.month}/'
                                      '${cubit.cources!.courses[index].createdAt!.createdAtDate!.day}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      height: 1.7,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating:double.parse('${cubit.cources!.courses[index].ratesSumRate!}')/double.parse('${cubit.cources!.courses[index].videosCount!}'),
                                  minRating: 1,
                                  itemSize: 30,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Spacer(),
                                Text(
                                  'Vidoes Count:  ${cubit.cources!.courses[index].videosCount} ',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:TextStyle(
                                      fontSize: 12,
                                      height: 1.7,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Description',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: secondColor),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                child:Text( '${cubit.cources!.courses[index].description}',)
                            ),
                            SizedBox(height: 10,),
                            MaterialButton(
                              color: secondColor,
                              onPressed: (){
                                if(cubit.cources!.courses[index].videosCount !=0)
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>GetVideo(cubit.cources!.courses[index].id)));
                                else{
                                  QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.info,
                                      text: 'Count of Video is Zero'

                                  );
                                }
                              }, child:Text('View Videos',
                              style: TextStyle(fontSize: 13, color: Colors.white),
                            ), ),
                            SizedBox(height: 15,),
                            Container(height: 2,width: double.infinity,color: secondColor,),
                            SizedBox(height: 15,),
                          ],
                        ),
                        itemCount:cubit.cources!.courses.length,
                      ):ListView.builder(
                       physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       itemBuilder:(contex,index)=> Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Image.network(
                             '${cubit.courseClassResponse!.courses[index].courseDetails.image}',
                             width: double.infinity,
                             height: 200,
                             fit: BoxFit.fill,
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Text(
                             '${cubit.courseClassResponse!.courses[index].courseDetails.name}',
                             maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                             style:TextStyle(
                                 fontSize: 15,

                             ),
                           ),
                           SizedBox(
                             height: 7,
                           ),
                           Row(
                             children: [
                               Text(
                                 '${cubit.courseClassResponse!.courses[index].courseDetails.createdAt!.createdAt}',
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                 style:  TextStyle(fontSize: 12, height: 1.5),

                               ),
                               Spacer(),
                               Text(
                                 '${cubit.courseClassResponse!.courses[index].courseDetails.createdAt.createdAtDate}',
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                 style: TextStyle(
                                     fontSize: 12,
                                     height: 1.7,
                                   ),

                               ),
                             ],
                           ),
                           SizedBox(
                             height: 7,
                           ),
                           Row(
                             children: [
                               RatingBar.builder(
                                 initialRating:double.parse('${cubit.courseClassResponse!.courses[index].ratesSumRate}')/double.parse('${cubit.courseClassResponse!.courses[index].videosCount}'),
                                 minRating: 1,
                                 itemSize: 30,
                                 direction: Axis.horizontal,
                                 allowHalfRating: true,
                                 itemCount: 5,
                                 itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                 itemBuilder: (context, _) => Icon(
                                   Icons.star,
                                   color: Colors.amber,
                                 ),
                                 onRatingUpdate: (rating) {
                                   print(rating);
                                 },
                               ),
                               Spacer(),
                               Text(
                                 'Vidoes Count:${cubit.courseClassResponse!.courses[index].videosCount} ',
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                 style:  TextStyle(
                                     fontSize: 12,
                                     height: 1.7,

                                 ),
                               ),
                             ],
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Text(
                             'Description',
                             maxLines: 1,
                             overflow: TextOverflow.ellipsis,
                             style:  TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.bold,
                                   color: secondColor),

                           ),
                           Container(
                               padding: EdgeInsets.all(10),
                               child:Text( '${cubit.courseClassResponse!.courses[index].courseDetails.description}',)
                           ),
                           SizedBox(height: 10,),
                           MaterialButton(
                             color: secondColor,
                             onPressed: (){
                               if(cubit.courseClassResponse!.courses[index].videosCount!=0)
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>GetVideo(cubit.courseClassResponse!.courses[index].courseDetails.id)));
                               else{
                                 QuickAlert.show(
                                     context: context,
                                     type: QuickAlertType.info,
                                     text: 'Count of Video is Zero'

                                 );
                               } }, child:Text('View Videos',
                             style: TextStyle(fontSize: 13, color: Colors.white),

                           ), ),
                           SizedBox(height: 15,),
                           Container(height: 2,width: double.infinity,color: secondColor,),
                           SizedBox(height: 15,),
                         ],
                       ),
                       itemCount:cubit.courseClassResponse!.courses.length,
                     ),
                    ],
                  ):Center(child: CircularProgressIndicator(),),
                ),
              )

          );
        },
      ),
    );

  }
}
