
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/constants/constants.dart';

import '../../Styles/Color.dart';
import 'Bloc/cubit.dart';
import 'Bloc/states.dart';
import 'drawer.dart';
import 'SubjectExam.dart';


class ExamScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
  return  BlocProvider(
        create: (context)=>EducationCubit()..getTeacherSubject(),
    child: BlocConsumer<EducationCubit,EducationStates>(
    listener: (context,state){},
    builder: (context,state){
    var cubit=EducationCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title:const Text('Exam'),
        //backgroundColor: colorDrawer,
      ),
      drawer: Drawer(
          backgroundColor: colorDrawer,
        width: size.width *0.55 ,
        child: DrawerItem(profileData),
      ),
      body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 50,
                    width: width(context, .7),
                    decoration: BoxDecoration(
                      color: dropcolor,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20.0),
                         ),
                    child: DropdownButton<String>(
                      value: cubit.dropdownExam,
                      borderRadius:BorderRadius.circular(20),
                      underline:Container(color: Colors.transparent,),
                      onChanged: (String? newValue) {
                        cubit.dropdownExam=newValue!;
                        if(newValue=='Subjects Exam'){
                          cubit.isSubjectsExam=true;
                          cubit.isSuccessExam=false;
                          cubit.isfaildExam=false;
                          cubit.getAllExams();
                        }
                        else if(newValue=='Success Exam'){
                          cubit.isSuccessExam=false;
                          cubit.getsuccesExams().then((value){
                            cubit.isSubjectsExam=false;
                            cubit.isSuccessExam=true;
                            cubit.isfaildExam=false;
                          });
                        }
                        else if(newValue=='Faild Exam'){
                          cubit.isfaildExam=false;
                          cubit.getfaildExams().then((value){
                            cubit.isSubjectsExam=false;
                            cubit.isSuccessExam=false;
                            cubit.isfaildExam=true;
                          });

                        }

                        cubit.refreshExam(cubit.subject.length);
                        print(cubit.isSuccessExam);
                      },
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      iconSize: 40,
                      alignment: AlignmentDirectional.center,
                      items: <String>['Subjects Exam', 'Success Exam','Faild Exam'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(fontSize: 14,color:Colors.black),),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                if(cubit.isSubjectsExam)
                 state is SuccessGetSubject? Expanded(
                  child:cubit.subject.length!=0? ListView.separated(
                      itemBuilder: (context,index)=> InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectExam(cubit.subjectName[index])));
                        },
                        child: Card(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 22,color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: 'SubjecutName : ',style:TextStyle(fontSize: 22,color: Colors.blue)),
                                TextSpan(text: '${cubit.subjectName[index]}', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context,index)=>SizedBox(height: 0,),
                      itemCount: cubit.subjectName.length
                  ):Text('Not Found Thing',style: TextStyle(color: secondColor),),
                ):
                  CircularProgressIndicator(),
                 if(cubit.isSuccessExam) Expanded(
                  child: Column(children: [
                    Container(
                      color: defaultColor,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text('E_Name', style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                            Spacer(),
                            Text('S_Dagree', style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                            Spacer(),
                            Text('Status', style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                  cubit.successExam!.exams.isNotEmpty? Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index){
                            print(cubit.successExam!.exams[index].studentDegree);
                            return Column(
                              mainAxisSize:MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 60,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text('${cubit.successExam!.exams[index].exam.name}',
                                          maxLines: 2,overflow: TextOverflow.ellipsis
                                          ,style:TextStyle(fontSize: 17,color: secondColor),),
                                      ),
                                      Spacer(),
                                      Text('${cubit.successExam!.exams[index].studentDegree}/${cubit.successExam!.exams[index].examDegree}'
                                        ,style: TextStyle(fontSize: 17,color: secondColor),),
                                      Spacer(),
                                      Text('${cubit.successExam!.exams[index].status}',style:TextStyle(fontSize: 17,color: secondColor)),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(height: 10,),
                          itemCount: cubit.successExam!.exams.length
                      ),
                    ):Text('Not Found Thing',style: TextStyle(color: secondColor),),
                  ],),
                ),
                if(cubit.isfaildExam)Expanded(
                  child: Column(children: [
                    Container(
                      color: defaultColor,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text('E_Name', style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                            Spacer(),
                            Text('S_Dagree', style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                            Spacer(),
                            Text('Status', style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    cubit.faildExam!.exams.length!=0?Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => Column(
                            mainAxisSize:MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 40,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text('${cubit.faildExam!.exams[index].exam.name}',
                                        maxLines: 1,overflow: TextOverflow.ellipsis
                                        ,style:TextStyle(fontSize: 20,color: secondColor),),
                                    ),
                                    Spacer(),
                                    Text('${cubit.faildExam!.exams[index].studentDegree}/${cubit.faildExam!.exams[index].examDegree}'
                                      ,style: TextStyle(fontSize: 20,color: secondColor),),
                                    Spacer(),
                                    Text('${cubit.faildExam!.exams[index].status}',style:TextStyle(fontSize: 20,color: Colors.red)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) => SizedBox(height: 10,),
                          itemCount: cubit.faildExam!.exams.length
                      ),
                    ):Text('Not Found Thing',style: TextStyle(color: secondColor),),
                  ],),
                ),
              ],
            ),


    )
    );}
    )
  );

  }
}
