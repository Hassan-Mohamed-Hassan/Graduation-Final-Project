import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/Models/GetTeacherModel.dart';
import 'package:untitled15/modules/Schools/Bloc/Cubit.dart';
import 'package:untitled15/modules/Schools/Bloc/States.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../constants/Comonent.dart';
import '../../constants/constants.dart';
import 'DrawerSchool.dart';
class TeacherScreen extends StatelessWidget {
  var email=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SchoolCubit()..GetTeacher()..GetSubject(),
      child: BlocConsumer<SchoolCubit,SchoolStates>(
        listener: (context,state){

          if(state is AddTeacherSucessState){
            if(state.model.status=='success') {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text:state.model.message,
              );
            }
            else{
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text:'Teacher inValid',
              );

            }
          }
          if(state is AddTeacherErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text:'Teacher inValid ',
            );

          }
          if(state is DeleteTeacherSucessState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text:'Delete Successful Teacher',
            );
          }


        },
        builder: (context,state){
          var cubit=SchoolCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Teachers'),
            ),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(profileData),
              ),
              body: ConditionalBuilder(
                  condition: state is! GetTeacherLoadingState && state is! GetSubjectLoadingState,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Name',style: TextStyle(fontSize: 20,color: Colors.white),),
                                Text('Supject',style: TextStyle(fontSize: 20,color: Colors.white),),

                                Text('Options',style: TextStyle(fontSize: 20,color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder:(context,index)=>BuiltItemRow(cubit.getTeacher!.teachers![index],context) ,
                              separatorBuilder:(context,index)=> SizedBox(height: 10,),
                              itemCount: cubit.getTeacher!.teachers!.length
                          ),
                        ),
                        SizedBox(width: 10,),
                        Row(
                          children: [
                            Spacer(),
                            BuiltContainerButton(
                              width: 140,
                                color: secondColor,
                                function: (){
                                  showDialog(context: context, builder: (context)=>
                                      Center(
                                        child: SingleChildScrollView(
                                          child: Form(
                                            key: formkey,
                                            child: AlertDialog(
                                              elevation: 20,

                                              backgroundColor: Colors.white,
                                              iconPadding: EdgeInsets.all(0),
                                              contentPadding: EdgeInsets.all(10),

                                              title:ConditionalBuilder(
                                                  condition: state is! AddSubjectLoadingState,
                                                  builder: (context)=> BuiltContainerButton(function: (){
                                                    var id=int.parse(cubit.teacherSubjectNew!);
                                                  if(formkey.currentState!.validate()){
                                                    cubit.AddTeacher(emailTeacher: email.text,studentId: id);

                                                  }
                                                  },
                                                      color: secondColor,
                                                      icon: Icons.add,
                                                      text: 'Add Teacher'),
                                                  fallback: (context)=>Center(child: CircularProgressIndicator())
                                              ),
                                              content: Container(
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 10,),
                                                    BuiltTextField(
                                                        label: 'Email Teacher',
                                                        type: TextInputType.emailAddress,
                                                        controller: email,
                                                        prefix: Icons.email,
                                                        validate: (String? value){
                                                          if(value!.isEmpty){
                                                            return 'Please Enter email';
                                                          }
                                                          return null;
                                                        }
                                                    ),
                                                    SizedBox(height:  10,),
                                                    FormHelper.dropDownWidgetWithLabel(
                                                      context,
                                                      'Choose Subject',
                                                      'Choose Subject',
                                                      cubit.teacherSubjectNew,
                                                      cubit.listNewSub,
                                                          (value){
                                                        cubit.teacherSubjectNew=value;
                                                        print(cubit.teacherSubjectNew);
                                                      },
                                                          (onValidate){
                                                        if(onValidate ==null) {
                                                          return 'please enter Name Subject';
                                                        }
                                                        return null;
                                                      },
                                                      optionValue: "id",
                                                      optionLabel: "name",
                                                      // hintColor: Colors.white,
                                                      textColor: Colors.black,
                                                      //  borderColor: color,


                                                    ) ,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),

                                        ),
                                      )
                                  );
                                },
                                icon: Icons.add,
                                text: 'Add Teacher'
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

  Widget BuiltItemRow(Teachers model,context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${model.name}'),
          Text('${model.subject!.subjectdetails!.name}'),
          BuiltContainerButton(
              function: (){
                SchoolCubit.get(context).DeleteTeacher(id: model.id!);
              },
              icon: Icons.delete,
              text: 'Delete'
          )
        ],
      ),
    );
  }
}

