import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled15/Models/Parent/GetExamChildrenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/parent/Bloc/Cubit.dart';
import 'package:untitled15/modules/parent/Bloc/States.dart';
import 'package:untitled15/modules/parent/DrawerParent.dart';

class ExamsChildren extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CubitParent()..GetExamsStudent(),
      child: BlocConsumer<CubitParent,ParentStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=CubitParent.get(context);
         return Scaffold(
            appBar: AppBar(
              title: Text('Exams'),
            ),
           drawer: Drawer(
             backgroundColor: defaultColor,
             width: MediaQuery.of(context).size.width *0.55 ,
             child: DrawerItem(profileData),
           ),
            body: state is! GetExamsChildrenLoadingState?ListView.separated(
                    itemBuilder: (context,index)=>Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: defaultColor,width: 1),
                                  top: BorderSide(color: defaultColor,width: 1),
                                  right: BorderSide(color: defaultColor,width: 1),
                                  left: BorderSide(color: defaultColor,width: 1),

                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:NetworkImage('${cubit.getExamsChildrenModel!.exams![index].photo}') ,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${cubit.getExamsChildrenModel!.exams![index].name}',style: TextStyle(fontSize: 20),),
                                        Text('${cubit.getExamsChildrenModel!.exams![index].examsSumStudentDegree}/${cubit.getExamsChildrenModel!.exams![index].examsSumExamDegree}',style: TextStyle(fontSize:16,color:Colors.grey ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Text('Name ',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 17,color: secondColor))),
                                    Expanded(child: Center(child: Text('Subject',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 17,color: secondColor)))),
                                    Expanded(child: Center(child: Text('Degree',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 17,color: secondColor)))),
                                    Expanded(child: Text('Status',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 17,color: secondColor))),
                                  ],
                                ),

                                cubit.getExamsChildrenModel!.exams![index].examsSumExamDegree !=0?
                                ListView.separated(
                                  shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context,i)=>BuiltRowItem(cubit.getExamsChildrenModel!.exams![index].examss![i] ),
                                    separatorBuilder: (context,i)=>SizedBox(height: 10,),
                                    itemCount: cubit.getExamsChildrenModel!.exams![index].examss!.length
                                ):
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Text("A student who has no exams",style: TextStyle(color: secondColor),),
                                    )









                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                    separatorBuilder:(context,index) =>SizedBox(height: 20,),
                    itemCount: cubit.getExamsChildrenModel!.exams!.length
                )
                :Center(child: CircularProgressIndicator())

          );
        },

      ),
    );
  }
  Widget BuiltRowItem(Examss model){

    return
      Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: Text('${model.exam!.name}',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 14,),)),
          Expanded(child: Center(child: Text('${model.exam!.subject!.subject!.name}',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 14,),))),
          Expanded(child: Center(child: Text('${model.studentDegree}/${model.examDegree}',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 14),))),
          Expanded(child: Text('${model.status}',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 14),)),
        ],
      ),
    );


  }
}
