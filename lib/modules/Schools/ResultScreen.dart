import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/Schools/Bloc/Cubit.dart';
import 'package:untitled15/modules/Schools/Bloc/States.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../constants/constants.dart';
import 'DrawerSchool.dart';

class ResultScreen extends StatelessWidget  {
  var name=TextEditingController();
  var StudentId=TextEditingController();
  var FinalDegree=TextEditingController();
  var StudentDegree=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SchoolCubit()..GetSubject()..GetRoom()..StatusAnnounced(status: 'not_announced'),

      child: BlocConsumer<SchoolCubit,SchoolStates>(
        listener: (context,state){
          if(state is GetResultSchoolSuccessState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text:'Added Successful Result',
            );


          }
          if(state is GetResultSchoolErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text:'Error Invalid',
            );

          }
        },
        builder: (context,state){
          var cubit=SchoolCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text('Results'),
            ),
              drawer: Drawer(
            backgroundColor: defaultColor,
            width: MediaQuery.of(context).size.width *0.55 ,
            child: DrawerItem(profileData),
          ),
            body:  ConditionalBuilder(
                condition: state is! GetStudentRoomLoadingState && state is! GetAnnouncedLoadingState && state is! GetSubjectLoadingState,
                builder: (context)=>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        //   color: Colors.grey[300],
                        child: FormHelper.dropDownWidgetWithLabel(
                          context,
                          'Choose status',
                          'Choose status',
                          cubit.status,
                          listStatus,
                              (value){
                            cubit.status=value;
                            cubit.StatusAnnounced(status: value);
                          },
                              (onValidate){
                            if(onValidate ==null)
                              return 'please enter Name Status';
                          },
                          optionValue: "id",
                          optionLabel: "name",
                          // hintColor: Colors.white,
                          textColor: Colors.black,
                          //  borderColor: color,


                        ) ,
                      ),
                       SizedBox(height: 10,),
                      Container(
                        height: 40,
                        color: defaultColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(child: Text('Room ',maxLines: 1,style: TextStyle(color: Colors.white),)),
                              Expanded(child: Text('Subject ',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.white),)),
                              Expanded(child: Text('Status ',maxLines:1,style: TextStyle(color: Colors.white),)),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                      if(cubit.status=='announced')
                       ConditionalBuilder(
                           condition: state is! GetAnnouncedLoadingState,
                           builder: (context)=> Expanded(
                             child: ListView.separated(
                                 itemBuilder: (context,index)=>Row(
                                   children: [
                                     Expanded(
                                       child: Text(
                                           '${cubit.getAnnouncedModel!.rooms![index].room!.name}',
                                         maxLines: 2,overflow: TextOverflow.ellipsis,

                                       ),
                                     ),
                                     Expanded(
                                       child: Text(
                                           '${cubit.getAnnouncedModel!.rooms![index].name}'
                                       ),
                                     ),
                                     Expanded(
                                       child: Text(
                                           'announced'
                                       ),
                                     ),

                                   ],
                                 ),
                                 separatorBuilder: (context,index)=>SizedBox(height: 10,),
                                 itemCount: cubit.getAnnouncedModel!.rooms!.length
                             ),
                           ),

                           fallback:(context)=> Center(child: CircularProgressIndicator())
                       ),
                      if(cubit.status=='not_announced')
                        ConditionalBuilder(
                            condition: state is! GetAnnouncedLoadingState,
                            builder: (context)=> Expanded(
                              child: ListView.separated(
                                  itemBuilder: (context,index)=>Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                            '${cubit.getNotAnnouncedModel!.rooms![index].name}',
                                          maxLines: 2,overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                            ''
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                            'Not_Announced'
                                        ),
                                      ),

                                    ],
                                  ),
                                  separatorBuilder: (context,index)=>SizedBox(height: 10,),
                                  itemCount: cubit.getNotAnnouncedModel!.rooms!.length
                              ),
                            ),

                            fallback:(context)=> Center(child: CircularProgressIndicator())
                        ),

                      SizedBox(height:10 ,),
                      Row(
                          children: [
                            Spacer(),
                            BuiltContainerButton(function: (){
                              showDialog(context: context, builder: (context)=>
                                  Center(
                                    child: SingleChildScrollView(
                                      child: AlertDialog(
                                        elevation: 20,

                                        backgroundColor: Colors.white,
                                        iconPadding: EdgeInsets.all(0),
                                        contentPadding: EdgeInsets.all(10),

                                        title:BuiltContainerButton(function: (){
                                          var Roomid=int.parse(cubit.roomId!);
                                          var Student=int.parse(StudentId.text);
                                          var Final=int.parse(FinalDegree.text);
                                          var degree=int.parse(StudentDegree.text);
                                          var SubjectId=int.parse(cubit.numberSubject!);
                                          cubit.SendResult(
                                              name: name.text,
                                              room_id: Roomid,
                                              StudentId: Student,
                                              SubjectId:SubjectId ,
                                              DegreStudent: degree,
                                              DegreFinal: Final
                                          );


                                        }, icon: Icons.add, text: 'Add Result'),
                                        content: Column(
                                          children: [
                                            BuiltTextField(
                                                label: 'Name Test',
                                                type: TextInputType.text,
                                                controller: name,
                                                prefix: Icons.label
                                            ),

                                            SizedBox(height: 10,),
                                            Container(
                                              //   color: Colors.grey[300],
                                              child: FormHelper.dropDownWidgetWithLabel(
                                                context,
                                                'Choose Room',
                                                'Choose Room',
                                                cubit.roomId,
                                                cubit.listRoom,
                                                    (value){
                                                  cubit.roomId=value;
                                                },
                                                    (onValidate){
                                                  if(onValidate ==null)
                                                    return 'please enter Name Room';
                                                },
                                                optionValue: "id",
                                                optionLabel: "name",
                                                // hintColor: Colors.white,
                                                textColor: Colors.black,
                                                //  borderColor: color,


                                              ) ,
                                            ),
                                            SizedBox(height: 10,),

                                            BuiltTextField(
                                                label: 'Student id',
                                                type: TextInputType.number,
                                                controller: StudentId,
                                                prefix: Icons.label
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              //   color: Colors.grey[300],
                                              child: FormHelper.dropDownWidgetWithLabel(
                                                context,
                                                'Choose Subject',
                                                'Choose Subject',
                                                cubit.numberSubject,
                                                cubit.listNewSub,
                                                    (value){
                                                  cubit.numberSubject=value;
                                                },
                                                    (onValidate){
                                                  if(onValidate ==null)
                                                    return 'please enter Name Subject';
                                                },
                                                optionValue: "id",
                                                optionLabel: "name",
                                                // hintColor: Colors.white,
                                                textColor: Colors.black,
                                                //  borderColor: color,


                                              ) ,
                                            ),
                                            SizedBox(height: 10,),

                                            BuiltTextField(
                                                label: ' Total Marks  ',
                                                type: TextInputType.number,
                                                controller: FinalDegree,
                                                prefix: Icons.label
                                            ),
                                            SizedBox(height: 10,),
                                            BuiltTextField(
                                                label: 'Degree Student',
                                                type: TextInputType.number,
                                                controller: StudentDegree,
                                                prefix: Icons.label
                                            ),

                                          ],
                                        ),
                                      ),

                                    ),
                                  )
                              );
                            }, icon: Icons.add, text: 'Add Result'),
                          ]
                      )
                    ],
                  ),
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator())
            )
          );
        },

      ),
    );
  }
  Widget BuiltContainerButton(
      {
        required  Function function,
        required IconData icon,
        required String text
      }
      ){
    return InkWell(
      onTap: (){
        function();
      } ,
      child: Container(
        height: 40,
        color: Colors.red,
        child:Row(
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
