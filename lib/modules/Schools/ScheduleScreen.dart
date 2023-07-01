
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/Models/GetScheduleModel.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/Schools/Bloc/Cubit.dart';
import 'package:untitled15/modules/Schools/Bloc/States.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../constants/constants.dart';
import 'DrawerSchool.dart';

class ScheduleScreen extends StatelessWidget {
  var peroid=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SchoolCubit()..GetSchedule()..GetTeacher(),
        child: BlocConsumer<SchoolCubit,SchoolStates>(
          listener: (context,state){
            if(state is AddScheduleSuccessState){
              if(state.model.status=='success'){
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
            if(state is AddScheduleErrorState){
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'error Invalid ',
              );

            }
            if(state is AddLessonScheduleSuccessState){
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text:'Add Lesson Successful',
              );

            }
            if(state is AddLessonScheduleErrorState){
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text:'error invalid',
              );

            }

          },
            builder: (context,state){
            var cubit=SchoolCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('Schedule'),
              ),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(profileData),
              ),
              body: ConditionalBuilder(
                  condition: state is! GetScheduleLoadingState && state is! GetTeacherLoadingState,
                  builder: (context)=>Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        itemBuilder: (context,index)=>Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${cubit.secduleModel!.rooms![index].name}'),
                            SizedBox(height: 15,),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    color: defaultColor,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Center(child: Text('Peroid / Day',style: TextStyle(color: Colors.white),)),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: 100,

                                    color: defaultColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Center(child: Text('Saturday',style: TextStyle(color: Colors.white),)),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: 100,

                                    color: defaultColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Center(child: Text('Sunday',style: TextStyle(color: Colors.white),)),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: 100,

                                    color: defaultColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Center(child: Text('Monday',style: TextStyle(color: Colors.white),)),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: 100,

                                    color: defaultColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Center(child: Text('Tuesday',style: TextStyle(color: Colors.white),)),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: 100,

                                    color: defaultColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Center(child: Text('Wednesday',style: TextStyle(color: Colors.white),)),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: 100,

                                    color: defaultColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Center(child: Text('Thursday',style: TextStyle(color: Colors.white),)),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            BuiltSechduleItem(cubit.secduleModel!.rooms![index],cubit),
                            SizedBox(height: 15,),

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
                                              //var id=int.parse(cubit.numberClass!);

                                              cubit.AddSchedule(period: peroid.text, roomId:cubit.secduleModel!.rooms![index].id!);
                                            }, icon: Icons.add, text: 'Add Period'),
                                            content: Container(
                                              //   color: Colors.grey[300],
                                              child: BuiltTextField(
                                                  label: 'Peroid',
                                                  type: TextInputType.text,
                                                  controller: peroid,
                                                  prefix: Icons.access_time
                                              )
                                            ),
                                          ),

                                        ),
                                      )
                                  );
                                },
                                icon: Icons.add,
                                text: 'Add Period'
                            )



                          ],
                        ),
                        separatorBuilder: (condex,index)=>SizedBox(height: 20,),
                        itemCount: cubit.secduleModel!.rooms!.length
                    ),
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator())
              ),

            );
            },

        )
    );
  }
  Widget BuiltSechduleItem(Rooms model,cubit){
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index)=>Row(

          children: [
            Container(
              color: defaultColor,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Center(child: Text('${model.periods![index].period}',style: TextStyle(color: Colors.white),)),
              ),
            ),
            SizedBox(width: 10,),
            Built(model.periods![index],cubit),

          ],
        ),
        separatorBuilder: (context,index)=>SizedBox(height: 10,),
        itemCount: model.periods!.length
    );
  }
  Widget Built(Periods model,cubit){
    return Expanded(
      child: Container(
        height: 80,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index)=> Row(
              children: [
                model.lessons![index].teacher!=null?
                Stack(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Card(
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Center(child: Text( '${model.lessons![index].teacher!.name}',style: TextStyle(color: Colors.black),)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: IconButton(
                          onPressed: (){
                            showDialog(context: context, builder: (context)=>
                                Center(
                                  child: SingleChildScrollView(
                                    child: AlertDialog(
                                      elevation: 20,

                                      backgroundColor: Colors.white,
                                      iconPadding: EdgeInsets.all(0),
                                      contentPadding: EdgeInsets.all(10),

                                      title:BuiltContainerButton(function: (){
                                        var id=int.parse(cubit.lessonNew!);

                                        cubit.AddLesson(teacherid: id, lessonid: model.lessons![index].id!);
                                      }, icon: Icons.add, text: 'Add Lesson'),
                                      content: Container(
                                        //   color: Colors.grey[300],
                                          child:FormHelper.dropDownWidgetWithLabel(
                                            context,
                                            'Choose lesson',
                                            'Choose lesson',
                                           cubit.lessonNew,
                                            cubit.listNewTeacher,
                                                (value){
                                              cubit.lessonNew=value;
                                            },
                                                (onValidate){
                                              if(onValidate ==null) {
                                                return 'please enter Name Lesson';
                                              }
                                              return null;
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
                          icon: Icon(Icons.edit,color: defaultColor,)
                      ),
                    ),

                  ],
                ):
                Stack(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Card(
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Center(child: Text( 'Not Found',style: TextStyle(color: Colors.black),)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: IconButton(
                          onPressed: (){
                            showDialog(context: context, builder: (context)=>
                                Center(
                                  child: SingleChildScrollView(
                                    child: AlertDialog(
                                      elevation: 20,

                                      backgroundColor: Colors.white,
                                      iconPadding: EdgeInsets.all(0),
                                      contentPadding: EdgeInsets.all(10),

                                      title:BuiltContainerButton(function: (){
                                        var id=int.parse(cubit.lessonNew!);

                                        cubit.AddLesson(teacherid: id, lessonid: model.lessons![index].id!);
                                      }, icon: Icons.add, text: 'Add Lesson'),
                                      content: Container(
                                        //   color: Colors.grey[300],
                                        child:FormHelper.dropDownWidgetWithLabel(
                                          context,
                                          'Choose lesson',
                                          'Choose lesson',
                                          cubit.lessonNew,
                                          cubit.listNewTeacher,
                                              (value){
                                            cubit.lessonNew=value;
                                          },
                                              (onValidate){
                                            if(onValidate ==null) {
                                              return 'please enter Name Lesson';
                                            }
                                            return null;
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
                          icon: Icon(Icons.edit,color: defaultColor,)
                      ),
                    ),

                  ],
                )
              ],
            ),
            separatorBuilder: (context,index)=>SizedBox(width: 10,),
            itemCount: model.lessons!.length
        ),
      ),
    );
  }
  Widget BuiltScheduleItem(context){
    return SingleChildScrollView(

      scrollDirection: Axis.horizontal,
      child:         Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Row(
              children: [
                Container(
                  color: defaultColor,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Center(child: Text('}',style: TextStyle(color: Colors.white),)),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  width: 100,
                  child: Card(
                    elevation: 10,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Center(child: Text('',style: TextStyle(color: Colors.black),)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Card(
                    elevation: 10,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Center(child: Text('',style: TextStyle(color: Colors.black),)),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  width: 100,
                  child: Card(
                    elevation: 10,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Center(child: Text('',style: TextStyle(color: Colors.black),)),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  width: 100,
                  child: Card(
                    elevation: 10,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Center(child: Text('',style: TextStyle(color: Colors.black),)),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  width: 100,
                  child: Card(
                    elevation: 10,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Center(child: Text('',style: TextStyle(color: Colors.black),)),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  width: 100,
                  child: Card(
                    elevation: 10,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Center(child: Text('',style: TextStyle(color: Colors.black),)),
                    ),
                  ),
                ),


              ],
            ),
            SizedBox(height: 15,),

            Row(
              children: [
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
                                  // var id=int.parse(cubit.numberClass!);

                                  //   cubit.AddClass(idClass: id);
                                }, icon: Icons.add, text: 'Add Period'),
                                content:Text(''),
                              ),

                            ),
                          )
                      );
                    },
                    icon: Icons.add,
                    text: 'Add Period'
                ),
                SizedBox(width: 10,),
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
                                  // var id=int.parse(cubit.numberClass!);

                                  //   cubit.AddClass(idClass: id);
                                }, icon: Icons.add, text: 'Add Lesson'),
                                content:Text(''),
                              ),

                            ),
                          )
                      );
                    },
                    icon: Icons.add,
                    text: 'Add Lesson'
                ),



              ],
            )



          ],
        ),
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
}
