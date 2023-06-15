
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled15/student/Bloc/cubit.dart';
import 'package:untitled15/student/Bloc/states.dart';

import '../../constants/Comonent.dart';
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
  Widget HeaderTextMain(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Text(text,style: TextStyle(fontSize: 20,color: defaultColor),),
    );
  }
  Widget HeaderTextBasic(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 5),
      child: Text(text,maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.black),),
    );
  }
Widget TableItem(subject,index,EducationCubit cubit,context){
    return          Column(
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,

          children: [
            TableRow(

                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 0),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)
                    )
                ),
                children: [
                  HeaderTextMain('Number'),
                  HeaderTextBasic('${index+1}')
                ]
            ),
            TableRow(

                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 0),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)
                    )
                ),
                children: [
                  HeaderTextMain('Subject'),
                  HeaderTextBasic('$subject')
                ]
            ),
            TableRow(


                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 1),
                        bottom: BorderSide(color: Colors.grey,width: 0),

                        right:BorderSide(color: Colors.grey,width: 1),
                        left: BorderSide(color: Colors.grey,width: 1)

                    )
                ),
                children: [
                  HeaderTextMain('Name'),
                  HeaderTextBasic('${cubit.showExams!.exams[index].name}'),




                ]
            ),
            TableRow(


                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 0),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)

                    )
                ),
                children: [
                  HeaderTextMain('Questions'),
                  HeaderTextBasic('${cubit.showExams!.exams[index].questionsCount}'),




                ]
            ),
            TableRow(


                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 0),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)

                    )
                ),
                children: [
                  HeaderTextMain('Degrees'),
                  HeaderTextBasic('${cubit.showExams!.exams[index].degree}'),




                ]
            ),
            TableRow(


                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 0),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)

                    )
                ),
                children: [
                  HeaderTextMain('Create at'),
                  HeaderTextBasic(cubit.convertDate('${cubit.showExams!.exams[index].createdAt}')),




                ]
            ),

          ],
        ),
SizedBox(height: 10,),
        SizedBox(
          height: 60,
          width: width(context, .5),
          child: MaterialButton(
            padding: EdgeInsets.all(10),
            color: defaultColor,
            onPressed: (){
             double totaldgree=int.parse(cubit.showExams!.exams[index].degree!)/cubit.showExams!.exams[index].questionsCount!;
              cubit.getquastion(cubit.showExams!.exams[index].id).then((value){
                print(value);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
                  MyQuizPageView(totaldgree,value,cubit.trueAnswers,cubit.showExams!.exams[index].id!)),(Route<dynamic> route) => true,);

              });
            },
            child: Text('start',style: TextStyle(fontSize: 17,color: Colors.white),),
          ),
        )

      ],
    );

}
}
