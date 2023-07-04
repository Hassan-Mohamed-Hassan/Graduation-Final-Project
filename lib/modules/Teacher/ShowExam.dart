
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/Teacher/Bloc/Cubit.dart';
import 'package:untitled15/modules/Teacher/Bloc/States.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../Models/Teacher/ShowExamModel.dart';
import '../../constants/Comonent.dart';

class ShowExam extends StatelessWidget {
  final int id;
  ShowExam({required this.id});
var text=TextEditingController();
var answer=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CubitTeacher()..ShowExam(id: id),
      child: BlocConsumer<CubitTeacher,TeacherStates>(
        listener: (context,state){
          if(state is AddQuestionSucessState){
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
          if( state is AddQuestionErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'error Invalid',
            );

          }
          if(state is DeleteQuestionSucessState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Delete Question SuccessFul',
            );
          }
          if(state is DeleteQuestionErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'error Invalid',
            );
          }
          if(state is AddAnswerSucessState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Add Answer SuccessFul',
            );

          }
          if(state is AddAnswerErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'error Invalid',
            );

          }
          if(state is SelectAnswerSuccessState){
            {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Sucessful Select Answer',
              );


            }

          }


        },
          builder: (context,state){
          var cubit=CubitTeacher.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text('View Exams'),
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            body:ConditionalBuilder(
                condition: state is! ShowExamLoadingState,
                builder: (context)=>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context,index)=>BuiltExam(cubit.show!.exam![0].questions![index],cubit,context),
                            separatorBuilder: (context,index)=>SizedBox(height: 20,),
                            itemCount: cubit.show!.exam![0].questions!.length
                        ),
                      ),
                      SizedBox(height: 10,),
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

                                            cubit.AddQuestion(examId: id, question: text.text);
                                          }, icon: Icons.add, text: 'Add Question'),
                                          content: Container(
                                            //   color: Colors.grey[300],
                                            child:Column(
                                              children: [
                                                SizedBox(height: 10,),
                                                BuiltTextField(
                                                    label: 'Question',
                                                    type: TextInputType.text,
                                                    controller: text,
                                                    prefix: Icons.title
                                                ),



                                              ],
                                            ),
                                          ),
                                        ),

                                      ),
                                    )
                                );
                              },
                              icon: Icons.add,
                              text: 'Add Question'
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
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: Colors.white,),
              SizedBox(width:5 ,),
              Text(text,style:TextStyle(color: Colors.white) ,)
            ],
          ),
        ),
      ),
    );
  }
  Widget BuiltExam(Questions model,CubitTeacher cubit,context){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            Expanded(flex:3,child: Text('${model.question}',maxLines:3,overflow: TextOverflow.ellipsis ,),),
            SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: (){
                    cubit.DeleteQuestion(id: model.id!,idexam: id);
                  },
                  icon: Icon(Icons.delete)
              ),
            )
          ],
        ),
        SizedBox(height: 10,),

        ListView.separated(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:(context,index)=>Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(children: [
                        model.answers![index].isTrue=="yes"?
                        Radio(value: model.answers![index].id, groupValue: model.answers![index].id , onChanged: (val){
                          cubit.SelectAnswer(answerId: val!, questionId: model.id!, examId: id);
                          cubit.ChangeSelect(val);
                          print(val);
                        }
                        ):Radio(value: model.answers![index].id, groupValue: cubit.select , onChanged: (val){
                          cubit.SelectAnswer(answerId: val!, questionId: model.id!, examId: id);
                          cubit.ChangeSelect(val);
                          print(val);
                        }
                        ),
                        SizedBox(width:5 ,),
                        Expanded(child: Text('${model.answers![index].answer} ',maxLines:2 ,overflow: TextOverflow.ellipsis,style: TextStyle(color: defaultColor))),

                      ],
                      ),
                    ),

                  ],
                ),

              ],
            ) ,
            separatorBuilder: (context,index)=>SizedBox(height: 10,),
            itemCount: model.answers!.length
        ),
        SizedBox(height: 10,),
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

                              cubit.AddAnswer(questionId: model.id!, examId: id, answer: answer.text);
                            }, icon: Icons.add, text: 'Add Answer'),
                            content: Container(
                              //   color: Colors.grey[300],
                              child:Column(
                                children: [
                                  SizedBox(height: 10,),
                                  BuiltTextField(
                                      label: 'Answer',
                                      type: TextInputType.text,
                                      controller: answer,
                                      prefix: Icons.title
                                  ),



                                ],
                              ),
                            ),
                          ),

                        ),
                      )
                  );
                },
                icon: Icons.add,
                text: 'Add Answer'
            )
          ],
        )






      ],
    );
  }
}
