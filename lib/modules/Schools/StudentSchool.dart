import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/Models/GetStudentSchoolModel.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../constants/constants.dart';
import 'Bloc/Cubit.dart';
import 'Bloc/States.dart';

class StudentSchool extends StatelessWidget {
  final int id;
  final String name;
 StudentSchool({required this.id,required this.name});
var email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SchoolCubit()..GetStudent(id: id),
      child: BlocConsumer<SchoolCubit,SchoolStates>(
       listener: (context,state){
         if(state is AddStudentRoomSucessState){
           if(state.model.status=='success') {
             QuickAlert.show(
               context: context,
               type: QuickAlertType.success,
               text: 'Add Successful Student',
             );
           }
           else{
             QuickAlert.show(
               context: context,
               type: QuickAlertType.error,
               text: 'The selected email is invalid $id',
             );
           }
         }
         if(state is DeleteStudentRoomSucessState){
           if(state.model.status=='success') {
             QuickAlert.show(
               context: context,
               type: QuickAlertType.success,
               text: 'Delete Successful Student',
             );
           }
         }

       },
        builder: (context,state){
          var cubit=SchoolCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(name),
            ),
              body: ConditionalBuilder(
                  condition: state is! GetStudentRoomLoadingState,
                  builder: (context)=>Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          color: defaultColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Name',style: TextStyle(fontSize: 20,color: Colors.white),),
                                Spacer(),
                                Text('Options',style: TextStyle(fontSize: 20,color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        cubit.student!.students!.length!=0?
                        Expanded(
                          child: ListView.separated(
                              itemBuilder:(context,index)=>BuiltItemRow(
                                  cubit.student!.students![0].details![index],
                                  cubit.student!.students![0],
                                  context) ,
                              separatorBuilder:(context,index)=> SizedBox(height: 10,),
                              itemCount: cubit.student!.students![0].details!.length
                          ),
                        ):
                            Text('Not Found Students'),
                        SizedBox(width: 10,),
                        Row(
                          children: [
                            Spacer(),
                            BuiltContainerButton(
                                function: (){
                                  showDialog(context: context, builder: (context)=>
                                      Center(
                                        child: SingleChildScrollView(
                                          child: AlertDialog(
                                            elevation: 20,

                                            backgroundColor: Colors.white,
                                            iconPadding: EdgeInsets.all(0),
                                            contentPadding: EdgeInsets.all(10),

                                            title:BuiltContainerButton(function: (){

                                              cubit.AddStudent(email: email.text, roomId: id);
                                            }, icon: Icons.add, text: 'Add Student'),
                                            content: Container(
                                              //   color: Colors.grey[300],
                                              child: BuiltTextField(
                                                  label: 'Email Student',
                                                  type: TextInputType.emailAddress,
                                                  controller: email,
                                                  prefix: Icons.email
                                              ) ,
                                            ),
                                          ),

                                        ),
                                      )
                                  );
                                },
                                icon: Icons.add,
                                text: 'Add Student'
                            )
                          ],
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
  Widget BuiltItemRow(StudentsDetails details,Students model,context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text('${details.name}'),
          Spacer(),
          BuiltContainerButton(
              function: (){
               SchoolCubit.get(context).DeleteStudent(id: details.id!,idroom: id);
              },
              icon: Icons.delete,
              text: 'Delete'
          )
        ],
      ),
    );
  }
}

