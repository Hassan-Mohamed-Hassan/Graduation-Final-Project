import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/Models/Teacher/GetExamsModel.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/Teacher/Bloc/Cubit.dart';
import 'package:untitled15/modules/Teacher/Bloc/States.dart';
import 'package:untitled15/modules/Teacher/ShowExam.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../constants/constants.dart';
import 'DrawerTeacher.dart';

class ExamsScreen extends StatelessWidget {
var name=TextEditingController();
var degree=TextEditingController();
var available=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CubitTeacher()..GetExams(),
      child: BlocConsumer<CubitTeacher,TeacherStates>(
        listener: (context,state){

          if(state is AddExamSucessState){
            if(state.model.status=='success'){
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: state.model.message,
              );


            }else {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: state.model.message,
              );
            }
          }
          if(state is AddExamErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'error Invalid',
            );
          }

          if(state is DeleteExamSuccessState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Delete Exam Successful',
            );

          }
          if(state is DeleteExamErrorState){
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'error Invalid'
            );

          }


        },
        builder: (context,state){
          var cubit=CubitTeacher.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('Exams'),
              ),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(profileData),
              ),
              body: ConditionalBuilder(
                  condition: state is! GetExamLoadingState,
                  builder: (context)=>Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              itemBuilder:(context,index)=>BuiltItemRow(cubit.getExams!.exams![index],cubit,context) ,
                              separatorBuilder:(context,index)=> SizedBox(height: 10,),
                              itemCount: cubit.getExams!.exams!.length
                          ),
                        ),
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
                                              var id=int.parse(degree.text);

                                              cubit.AddExam(name: name.text, degree: id, available: 'all');
                                            }, icon: Icons.add, text: 'Add Exam'),
                                            content: Container(
                                              //   color: Colors.grey[300],
                                              child:Column(
                                                children: [
                                                  SizedBox(height: 10,),
                                                  BuiltTextField(
                                                      label: 'Name Exam',
                                                      type: TextInputType.text,
                                                      controller: name,
                                                      prefix: Icons.title
                                                  ),
                                                  SizedBox(height: 10,),

                                                  BuiltTextField(
                                                      label: 'Degree Exam',
                                                      type: TextInputType.number,
                                                      controller: degree,
                                                      prefix: Icons.title
                                                  ),
                                                  SizedBox(height: 10,),

                                                ],
                                              ),
                                            ),
                                          ),

                                        ),
                                      )
                                  );
                                },
                                icon: Icons.add,
                                text: 'Add Exam'
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
         IconData? icon,
        required String text
      }
      ){
    return InkWell(
      onTap: (){
        function();
      } ,
      child: Container(
        height: 40,
        color: defaultColor,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // Icon(icon,color: Colors.white,),
            //SizedBox(width:5 ,),
            Text(text,style:TextStyle(color: Colors.white) ,)
          ],
        ),
      ),
    );
  }
  Widget BuiltItemRow(Exams model,CubitTeacher cubit,context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Exam Name:',style: TextStyle(color: defaultColor),),
                  Spacer(),
                  Expanded( flex :3,child: Text('${model.name}',maxLines:2,overflow:TextOverflow.ellipsis,)),
      ]
      ),
              SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('For:',style: TextStyle(color: defaultColor),),
                    Spacer(),
                    Expanded(flex:1,child: Text('${model.forr}')),
                  ]
              ),
              SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Q_Number:',style: TextStyle(color: defaultColor),),
                    Spacer(),
                    Expanded(flex:1,child: Text('${model.questionsCount}')),
                  ]
              ),
              SizedBox(height: 20,),
              Row(
                children: [

                  Expanded(
                    flex: 1,
                    child: BuiltContainerButton(
                        function: (){
                          CubitTeacher.get(context).DeleteExam(id:model.id!);
                        },
                        //   icon: Icons.delete,
                        text: 'Delete'
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded
                    (
                    flex: 1,
                    child: BuiltContainerButton(
                        function: (){
                          navigatePush(context:context,widget: ShowExam(id:model.id!));
                        },
                        text: 'Show'
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
