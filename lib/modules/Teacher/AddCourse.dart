import 'dart:io';

import 'package:untitled15/modules/Teacher/Bloc/Cubit.dart';
import 'package:untitled15/modules/Teacher/Bloc/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:untitled15/modules/Teacher/CourseScreen.dart';

import '../../constants/Comonent.dart';
import '../../constants/constants.dart';

class AddCourse extends StatelessWidget {
  var name=TextEditingController();
  var desc=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
    create: (context)=>CubitTeacher(),
    child: BlocConsumer<CubitTeacher,TeacherStates>(
       listener: (context,state){
         if(state is AddCourseSuccessState){

           QuickAlert.show(
             context: context,
             type: QuickAlertType.success,
             text: 'Add Successful Course',
           );
         }
         if(state is AddCourseErrorState){
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
             title: Text('Add Course'),
             leading: IconButton(
               icon: Icon(Icons.arrow_back_ios),
               onPressed: (){
                 navigatePush(context: context,widget: CourseScreen());
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
                         label: 'Name Course',
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

                     BuiltTextField(
                         label: 'Description',
                         type: TextInputType.text,
                         controller: desc,
                         prefix: Icons.title,

                         validate: (value){
                           if(value.isEmpty){
                             return 'Please Enter Name';
                           }null;
                         }
                     ),
                     SizedBox(height: 10,),

                     FormHelper.dropDownWidgetWithLabel(
                       context,
                       'Choose Available Course ',
                       'Choose Available Course',
                       cubit.availableCourse,
                       listAvailable,
                           (value){
                         cubit.availableCourse=value;
                         print(value);
                       },
                           (onValidate){
                         if(onValidate ==null) {
                           return 'please enter Available';
                         }
                         return null;
                       },
                       optionValue: "name",
                       optionLabel: "desc",
                       // hintColor: Colors.white,
                       textColor: Colors.black,
                       //  borderColor: color,


                     ) ,
                     SizedBox(height: 10,),
                     MaterialButton(
                       padding: EdgeInsets.all(8),
                       onPressed: (){
                         cubit.getImage();
                       },
                       color: Colors.black,
                       child: Text('Get Image',
                         style: TextStyle(
                             color: Colors.white
                         ),),
                       shape: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(5)
                       ),
                     ),
                     cubit.imageData ==null?
                     Container(
                       margin: EdgeInsets.all(1),
                       height: 15,
                       child: Text('Please Upload Image'),
                     ):CircleAvatar(
                       radius: 40,
                       backgroundImage: FileImage(cubit.imageData!),
                     ),
                     SizedBox(height: 10,),
                     Container(
                       height: 40,
                       width: 200,
                       decoration: BoxDecoration(
                         color: Colors.red,
                         borderRadius: BorderRadius.circular(15)
                       ),
                       child: MaterialButton(onPressed: (){
                           cubit.AddCourse(
                               name:name.text,
                               desc:desc.text,
                               available:cubit.availableCourse!,
                               imageFile:cubit.imageData!
                           );

                       },
                       child: Text('Add Course ',style: TextStyle(color: Colors.white,fontSize: 20),),),
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
