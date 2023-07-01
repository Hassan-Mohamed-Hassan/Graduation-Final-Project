import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/Schools/Bloc/Cubit.dart';
import 'package:untitled15/modules/Schools/Bloc/States.dart';
import 'package:untitled15/modules/Schools/DrawerSchool.dart';
import 'package:untitled15/modules/Schools/StudentSchool.dart';
import 'package:untitled15/modules/Schools/SubjectSchool.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../Models/GetRoomModel.dart';
import '../../constants/constants.dart';
class RoomsScreen extends StatelessWidget {
  var text=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SchoolCubit()..GetRoom()..GetClass(),
      child: BlocConsumer<SchoolCubit,SchoolStates>(
        listener: (context,state){

          if(state is AddRoomSucessState){
            if(state.model.status=='success') {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: state.model.message,
              );
            }
            else{
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: state.model.message,
              );
            }
          }
          if(state is DeleteRoomSucessState){
            if(state.model.status=='success') {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: state.model.message,
              );
            }
            else{
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: state.model.message,
              );
            }
          }



        },
        builder: (context,state){
          var cubit=SchoolCubit.get(context);
          return Scaffold(

              appBar: AppBar(
                title: Text('Rooms'),
              ),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(profileData),
              ),
              body: ConditionalBuilder(
                  condition: state is! GetRoomLoadingState && state is! GetClassLoadingState,
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
                                Text('Room name',style: TextStyle(fontSize: 15,color: Colors.white),),
                                Text('class name',style: TextStyle(fontSize: 15,color: Colors.white),),

                                Text('Options',style: TextStyle(fontSize: 15,color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder:(context,index)=>BuiltItemRow(
                                  cubit.roomModel!.rooms![index],
                                  cubit.roomModel!.rooms![index].mainClass!.itsClass!,
                                  cubit,
                                  context
                              ) ,
                              separatorBuilder:(context,index)=> SizedBox(height: 10,),
                              itemCount: cubit.roomModel!.rooms!.length
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

                                              cubit.AddRoom(name: text.text, class_id: id);
                                            }, icon: Icons.add, text: 'Add Room'),
                                            content: Container(
                                              //   color: Colors.grey[300],
                                              child:Column(
                                                children: [
                                                  BuiltTextField(
                                                      label: 'Room Name',
                                                      type:TextInputType.text,
                                                      controller: text,
                                                      prefix: Icons.room
                                                  ),
                                                  SizedBox(height: 10,),
                                                  FormHelper.dropDownWidgetWithLabel(
                                                    context,
                                                    'Choose Class',
                                                    'Choose Class',
                                                    cubit.numberClass,
                                                    cubit.listNewclass,
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
                                                ],
                                              )
                                            ),
                                          ),

                                        ),
                                      )
                                  );
                                },
                                icon: Icons.add,
                                text: 'Add Room'
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
  Widget BuiltItemRow(Rooms room,ItsClass model,SchoolCubit cubit,context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${room.name}',style: TextStyle(fontSize: 13),),
          Text('${model.name}',style: TextStyle(fontSize: 13),),
          Row(
            children: [
              BuiltContainerButton(
                  function: (){
                   // SchoolCubit.get(context).DeleteRoom(id:room.id!);
                    //cubit.GetStudent(id: model.id!);
                    navigatePush(context:context,widget: StudentSchool(id:room.id!,name:room.name!));

                  },
                  icon: Icons.person,
                  text: 'Student'
              ),
                SizedBox(width:5 ,),
              BuiltContainerButton(
                  function: (){
                    SchoolCubit.get(context).DeleteRoom(id:room.id!);
                  },
                  icon: Icons.delete,
                  text: 'Delete'
              ),

            ],
          )
        ],
      ),
    );
  }
}

