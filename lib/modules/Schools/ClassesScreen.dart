import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/Schools/Bloc/Cubit.dart';
import 'package:untitled15/modules/Schools/Bloc/States.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../Models/GetClassModel.dart';
import '../../constants/constants.dart';
import 'DrawerSchool.dart';
class ClassesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SchoolCubit()..GetClass(),
      child: BlocConsumer<SchoolCubit,SchoolStates>(
        listener: (context,state){

          if(state is AddClassSucessState){
            if(state.model.status=='success') {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: state.model.message,
              );
            }else{
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: state.model.message,
              );

            }
          }
          if(state is AddClassErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Error Invalid ',
            );

          }
          if(state is DeleteClassSucessState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Delete Class Successful',
            );



            }
          if(state is DeleteClassErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'error Invalid',
            );



          }






        },
        builder: (context,state){
          var cubit=SchoolCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('Class'),
              ),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(profileData),
              ),
              body: ConditionalBuilder(
                  condition: state is! GetClassLoadingState,
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
                                Text('Rooms',style: TextStyle(fontSize: 20,color: Colors.white),),

                                Text('Options',style: TextStyle(fontSize: 20,color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder:(context,index)=>BuiltItemRow(cubit.classModel!.classes![index],context) ,
                              separatorBuilder:(context,index)=> SizedBox(height: 10,),
                              itemCount: cubit.classModel!.classes!.length
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
                                              var id=int.parse(cubit.numberClass!);

                                              cubit.AddClass(idClass: id);
                                            }, icon: Icons.add, text: 'Add Class'),
                                            content: Container(
                                              //   color: Colors.grey[300],
                                              child: FormHelper.dropDownWidgetWithLabel(
                                                context,
                                                'Choose Class',
                                                'Choose Class',
                                                cubit.numberClass,
                                                listClass,
                                                    (value){
                                                  cubit.numberClass=value;
                                                },
                                                    (onValidate){
                                                  if(onValidate ==null)
                                                    return 'please enter Name Class';
                                                },
                                                optionValue: "id",
                                                optionLabel: "name",
                                                // hintColor: Colors.white,
                                                textColor: Colors.black,
                                                //  borderColor: color,


                                              ) ,
                                            ),
                                          ),

                                        ),
                                      )
                                  );
                                },
                                icon: Icons.add,
                                text: 'Add Class'
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
  Widget BuiltItemRow(Classes model,context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${model.itsClass!.name}'),
          Text('${model.roomsCount}'),
          BuiltContainerButton(
              function: (){
                SchoolCubit.get(context).DeleteClass(id: model.itsClass!.id!);
              },
              icon: Icons.delete,
              text: 'Delete'
          )
        ],
      ),
    );
  }
}

