
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/modules/student/Bloc/cubit.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';
import '../../constants/constants.dart';
import 'QuestionScreen.dart';
import 'drawer.dart';


class SubjectExam extends StatelessWidget {
  String ? subject;
  SubjectExam(this.subject);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>EducationCubit()..getAllExams(),
      child: BlocConsumer<EducationCubit,EducationStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=EducationCubit.get(context);
          print(subject);
         return Scaffold(
           appBar: AppBar(
             title: Text('Subject'),
               leading: IconButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 icon: const Icon(Icons.arrow_back,size: 35,),
               )

           ),

           body:cubit.showExams!=null? Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 Expanded(
                   child: ListView.separated(
                     physics: BouncingScrollPhysics(),
                       itemBuilder: (context,index)=>TableItem(subject,index,cubit,context),
                       separatorBuilder:(context,index)=> SizedBox(height: 20,),
                       itemCount: cubit.showExams!.exams.length
                   ),
                 ),
               ],
             ),
           ):Center(child: CircularProgressIndicator(),),
         );
        },

      ),
    );
  }
Widget TableItem(subject,index,EducationCubit cubit,context){
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: [
              Row(
                children: [
                  Text('Subject',style: TextStyle(color: defaultColor),),
                  Spacer(),
                  Text('$subject'),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('Name',style: TextStyle(color: defaultColor)),
                  Spacer(),
                  Text('${cubit.showExams!.exams[index].name}'),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('Questions Number',style: TextStyle(color: defaultColor)),
                  Spacer(),
                  Text('${cubit.showExams!.exams[index].questionsCount}'),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('Total Degrees',style: TextStyle(color: defaultColor)),
                  Spacer(),
                  Text('${cubit.showExams!.exams[index].degree}'),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('Create at',style: TextStyle(color: defaultColor)),
                  Spacer(),
                  Text('${cubit.showExams!.exams[index].createdAt!.year}-'
                      '${cubit.showExams!.exams[index].createdAt!.month}-'
                      '${cubit.showExams!.exams[index].createdAt!.day}'),
                ],
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
        double totaldgree=int.parse(cubit.showExams!.exams[index].degree!)/cubit.showExams!.exams[index].questionsCount!;
        cubit.getquastion(cubit.showExams!.exams[index].id).then((value){
        print(value);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
        MyQuizPageView(totaldgree,value,cubit.trueAnswers,cubit.showExams!.exams[index].id!)),);

        });
        },
                child: Container(
                  width: 110,
                  height: 40,
                  color: secondColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                         Text('start',style: Theme.of(context).textTheme.bodyMedium!.copyWith
                    (color: Colors.white,fontSize: 25,fontFamily:'mormal'),),
                            IconButton(
                          onPressed: (){
                      double totaldgree=int.parse(cubit.showExams!.exams[index].degree!)/cubit.showExams!.exams[index].questionsCount!;
                      cubit.getquastion(cubit.showExams!.exams[index].id).then((value){

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                            MyQuizPageView(totaldgree,value,cubit.trueAnswers,cubit.showExams!.exams[index].id!)));

                      });
            },icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                    ],
                  ),
                ),
              )
            ],
        ),
          ),
        ),
        SizedBox(height: 15,),
        Container(width: width(context, .8),height: 2,color: secondColor,),

      ],
    );

}
}
