import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled15/Models/GetAbsenceSchoolTOTeacherModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'Bloc/Cubit.dart';
import 'Bloc/States.dart';
import 'DrawerSchool.dart';

class AbsenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SchoolCubit()..GetAbsence(),
      child: BlocConsumer<SchoolCubit,SchoolStates>(
        listener: (context,state){
          if(state is AbsenceLoadingState){

            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text:'Add Successful Absence',
            );


          }
          if(state is AbsenceErrorState){

            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text:'Error Invalid',
            );


          }
        },
        builder: (context,state){
          var cubit=SchoolCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('Absence'),
              ),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(profileData),
              ),
              body: ConditionalBuilder(
                  condition: state is! GetAbsenceLoadingState ,
                  builder: (context)=>Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          height: 50,
                          color: defaultColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('photo',style: TextStyle(fontSize: 20,color: Colors.white),),
                                Text('Name',style: TextStyle(fontSize: 20,color: Colors.white),),

                                Text('Status',style: TextStyle(fontSize: 20,color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder:(context,index)=>BuiltItemRow(
                                  cubit.getAbsenceSchoolTOTeacherModel!.teachers![index],
                                  cubit.getAbsenceSchoolTOTeacherModel!.absence!.length,
                                  index,context) ,
                              separatorBuilder:(context,index)=> SizedBox(height: 10,),
                              itemCount: cubit.getAbsenceSchoolTOTeacherModel!.teachers!.length
                          ),
                        ),
                        cubit.getAbsenceSchoolTOTeacherModel!.absence!.length==0?
                        BuiltContainerButton(
                            function: (){
                              cubit.AddAbsence();

                            },
                            text: 'Done'
                        ):
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: defaultColor,width: 0.5),
                                  bottom: BorderSide(color: defaultColor,width: 0.5),

                                  right:BorderSide(color: defaultColor,width: 0.5),
                                  left: BorderSide(color:defaultColor,width: 0.5)
                              ),
                              color: Colors.white
                          ),
                          child: Center(child: Text('students were absent ')),
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
        required String text
      }
      ){
    return InkWell(
      onTap: (){
        function();
      } ,
      child: Container(
          height: 40,
          width: double.infinity,
          color: Colors.red,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,style:TextStyle(color: Colors.white) ,),
            ],
          )

      ),
    );
  }
  Widget BuiltItemRow(Teachers model,length,index,context){

    return
      length==0?
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('${model.photo}'),
            ),
            Text('${model.name}'),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: defaultColor,width: 0.5),
                      bottom: BorderSide(color: defaultColor,width: 0.5),

                      right:BorderSide(color: defaultColor,width: 0.5),
                      left: BorderSide(color:defaultColor,width: 0.5)
                  ),
                  color: Colors.white
              ),

              child: MaterialButton(

                  onPressed: (){
                    SchoolCubit.get(context).listAbsence.add(model.id);
                  },

                  child: Center(child: Text('Come',style: TextStyle(color: defaultColor),))),
            )
          ],
        ),
      ):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('${model.photo}'),
            ),
            Text('${model.name}'),
            model.absences!.length==0?
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: defaultColor,width: 0.5),
                      bottom: BorderSide(color: defaultColor,width: 0.5),

                      right:BorderSide(color: defaultColor,width: 0.5),
                      left: BorderSide(color:defaultColor,width: 0.5)
                  ),
                  color: Colors.white
              ),

              child: Center(child: Text('absent',style: TextStyle(color: Colors.red),)),
            ):Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: defaultColor,width: 0.5),
                      bottom: BorderSide(color: defaultColor,width: 0.5),

                      right:BorderSide(color: defaultColor,width: 0.5),
                      left: BorderSide(color:defaultColor,width: 0.5)
                  ),
                  color: Colors.white
              ),

              child: Center(child: Text('present',style: TextStyle(color: Colors.green))),
            ),
          ],
        ),
      );
  }
}
