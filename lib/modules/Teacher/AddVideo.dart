import 'dart:io';

import 'package:untitled15/modules/Teacher/Bloc/Cubit.dart';
import 'package:untitled15/modules/Teacher/Bloc/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:video_player/video_player.dart';

import '../../constants/Comonent.dart';
import '../../constants/constants.dart';

class AddVideo extends StatelessWidget {
  final int id;
  AddVideo({required this.id});
  var name=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context)=>CubitTeacher(),
        child: BlocConsumer<CubitTeacher,TeacherStates>(
          listener: (context,state){
            if(state is AddVideoCourseSuccessState){

              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Add Successful Course',
              );
            }
            if(state is AddVideoCourseErrorState){
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'error Invalid',
              );
            }
          },
          builder: (context,state){
            var cubit=CubitTeacher.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('Video Course'),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          BuiltTextField(
                              label: 'Name Video',
                              type: TextInputType.text,
                              controller: name,
                              prefix: Icons.title,
                              validate: (value){
                                if(value.isEmpty){
                                  return 'Please Enter Name';
                                }null;
                              }
                          ),
                          SizedBox(height: 10,),
                          if(cubit.VideoData!=null)
                            cubit.player.value.isInitialized?
                                AspectRatio(
                                    aspectRatio: cubit.player.value.aspectRatio,
                                  child: VideoPlayer(cubit.player),
                                ):Container()
                          else Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Click To Upload video',style: TextStyle(color:Colors.grey,fontSize: 14),),
                              SizedBox(width: 8,),
                              TextButton(
                                  onPressed: (){
                                    cubit.getVideo();
                                  },
                                  child: Text('Get Video')
                              ),
                            ],
                          ),

                          SizedBox(height: 20,),
                          Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: secondColor,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: MaterialButton(

                              onPressed: (){

                              cubit.AddVideo(
                                  name:name.text,
                                  id: id,
                                  videoFile:cubit.VideoData!
                              );

                            },
                              child: Text('Add Video ',style: TextStyle(color: Colors.white,fontSize: 20),),),
                          )



                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },

        )
    );
  }
}
