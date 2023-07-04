import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/Teacher/AddVideo.dart';
import 'package:untitled15/modules/Teacher/Bloc/Cubit.dart';
import 'package:untitled15/modules/Teacher/Bloc/States.dart';
import 'package:untitled15/modules/Teacher/ViewVideo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:better_player/better_player.dart';

class ShowCourseScreen extends StatelessWidget{
final int id;
ShowCourseScreen({required this.id});

Widget build(BuildContext context) {
  return BlocProvider(
    create: (context)=>CubitTeacher()..GetCourseID(id:id),

    child: BlocConsumer<CubitTeacher,TeacherStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=CubitTeacher.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text('View Course'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
            body: ConditionalBuilder(
                condition: state is! GetCourseByIdLoadingState,
                builder: (context)=>Padding(
                  padding: EdgeInsets.all(10),

                  child: ListView(
                    children: [
                      SizedBox(
                        height: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(height:200,child: Image.network('${cubit.courseByIDModel!.course![0].image}',fit: BoxFit.fill,)),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text('${cubit.courseByIDModel!.course![0].name}',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text('${cubit.courseByIDModel!.course![0].teacher!.name}'),
                                  SizedBox(height: 10,),
                                  Text('${cubit.courseByIDModel!.course![0].videosSumLength} minutes'),
                                  SizedBox(height: 10,),
                                  Text('${cubit.courseByIDModel!.course![0].createdAt!.createdAt}'),
                                  SizedBox(height: 10,),
                                  Text('${cubit.courseByIDModel!.course![0].createdAt!.createdAtDate}'),
                                  SizedBox(height: 10,),
                                  RatingBar.builder(
                                    itemBuilder: (context,i)=>Icon(Icons.star,color: Colors.amber,),
                                    onRatingUpdate: (index){

                                    },
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 5),
                                    initialRating: cubit.courseByIDModel!.course![0].ratesCount!.toDouble(),
                                    itemSize: 15,
                                    direction: Axis.horizontal,
                                    minRating: cubit.courseByIDModel!.course![0].ratesCount!.toDouble(),
                                    maxRating: 5,

                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text('Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('${cubit.courseByIDModel!.course![0].description}'),
                      SizedBox(height: 20,),
                      Text('Videos (${cubit.courseByIDModel!.course![0].videos!.length})',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      BuiltContainerButton(
                          function: (){
                            navigatePush(context:context,widget: AddVideo(id: cubit.courseByIDModel!.course![0].id!));
                          },
                          icon: Icons.add,
                          text: 'Add Video'
                      ),
                      SizedBox(height: 10,),
                      cubit.courseByIDModel!.course![0].videos!.length !=0 ?
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index)=>Container(
                            height: 160,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [


                                Card(
                                  elevation: 20,
                                  child: Container(
                                    height: 200,
                                    color: secondColor,
                                    child: MaterialButton(onPressed: (){
                                      print('http://192.168.43.200:8000/storage/files/teacherUploads/${cubit.courseByIDModel!.course![0].videos![index].video!}');
                                      print('///////////////');
                                      navigatePush(context:context,widget: ViewVideo(url:cubit.courseByIDModel!.course![0].videos![index].video!));
                                      cubit.ChangeVideoPlayer(cubit.courseByIDModel!.course![0].videos![index].video!);
                                    },
                                        child: Text('Show Video',style: TextStyle(color: Colors.white),)),
                                  ),
                                ),

                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${cubit.courseByIDModel!.course![0].videos![index].name}'),
                                    SizedBox(height: 15,),
                                    Text('${cubit.courseByIDModel!.course![0].videos![index].length} minutes'),
                                    SizedBox(height: 15,),
                                    Text('${cubit.courseByIDModel!.course![0].videos![index].createdAt}'),
                                    SizedBox(height: 15,),
                                    Text('${cubit.courseByIDModel!.course![0].createdAt!.createdAtDate}'),
                                    SizedBox(height: 15,),
                                    RatingBar.builder(
                                      itemBuilder: (context,i)=>Icon(Icons.star,color: Colors.amber,size: 16,),
                                      onRatingUpdate: (index){
                                      },
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 5),
                                      initialRating: cubit.courseByIDModel!.course![0].ratesCount!.toDouble(),
                                      itemSize: 15,
                                      direction: Axis.horizontal,
                                      minRating: cubit.courseByIDModel!.course![0].ratesCount!.toDouble(),
                                      maxRating: 5,

                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),
                           separatorBuilder: (context,index)=>SizedBox(height: 20,),
                          itemCount: cubit.courseByIDModel!.course![0].videos!.length
                      ):Container(),




                    ],
                  ),
                ),
                fallback: (context)=> Center(child: CircularProgressIndicator())
            )
        );
      },

    ),
  );
}
Widget BuiltContainerButton(
    {
      required  Function function,
      required IconData? icon,
      required String text
    }
    ){
  return InkWell(
    onTap: (){
      function();
    } ,
    child: Container(
      height: 40,
      color: secondColor,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: Colors.white,),
          SizedBox(width:5 ,),
          Text(text,style:TextStyle(color: Colors.white) ,)
        ],
      ),
    ),
  );
}

}
