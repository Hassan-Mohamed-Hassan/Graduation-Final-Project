import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';

import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../Models/Parent/GetChildernModel.dart';
import '../../constants/Comonent.dart';
import '../../constants/constants.dart';
import 'Bloc/Cubit.dart';
import 'Bloc/States.dart';
import 'DrawerParent.dart';

class ChildrenScreen extends StatelessWidget {
var email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CubitParent()..GetChildren(),
      child: BlocConsumer<CubitParent,ParentStates>(
        listener: (context,state){
          if(state is AddChildrenSucessState){
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
                text: 'The subject id has already been taken.',
              );
            }
          }
          if(state is DeleteChildrenSucessState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Delete Child Successful',
            );

          }
          if(state is DeleteChildrenErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'error Invalid'
            );

          }
        },
        builder: (context,state){

          var cubit=CubitParent.get(context);

          return Scaffold(
              appBar: AppBar(
                title: Text('Children'),
              ),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(profileData),
              ),
              body: ConditionalBuilder(
                  condition: state is! GetChildrenLoadingState,
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
                                Text('Photo',style: TextStyle(fontSize: 20,color: Colors.white),),

                                Text('Name',style: TextStyle(fontSize: 20,color: Colors.white),),
                                Text('Options',style: TextStyle(fontSize: 20,color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder:(context,index)=>BuiltItemRow(cubit.getChildren!.children![index] ,context),
                              separatorBuilder:(context,index)=> SizedBox(height: 10,),
                              itemCount: cubit.getChildren!.children!.length
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

                                            title:ConditionalBuilder(
                                                condition: state is! AddChildrenLoadingState,
                                                builder: (context)=> BuiltContainerButton(function: (){

                                                  cubit.AddChildren(email: email.text);
                                                }, icon: Icons.add, text: 'Add Child'),
                                                fallback: (context)=>Center(child: CircularProgressIndicator())
                                            ),
                                            content: Container(
                                              //   color: Colors.grey[300],
                                              child:BuiltTextField(
                                                  label: 'Email Student',
                                                  type: TextInputType.emailAddress,
                                                  controller: email,
                                                  prefix: Icons.email
                                              ),
                                            ),
                                          ),

                                        ),
                                      )
                                  );
                                },
                                width: 115,
                                icon: Icons.add,
                                text: 'Add Child'
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
        required String text,
        double ?width,
      }
      ){
    return InkWell(
      onTap: (){
        function();
      } ,
      child: Container(
        height: 40,
        width:width,
        color: secondColor,
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
  Widget BuiltItemRow(Children model,context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('${model.photo}'),
          ),
          Text('${model.name}'),
          BuiltContainerButton(
            width: 90,
              function: (){
                CubitParent.get(context).DeleteChildren(id:model.id!);
              },
              icon: Icons.delete,
              text: 'Delete'
          )
        ],
      ),
    );
  }
}
