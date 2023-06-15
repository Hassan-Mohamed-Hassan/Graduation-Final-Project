
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/student/Bloc/cubit.dart';
import 'package:untitled15/student/Bloc/states.dart';
import 'package:untitled15/student/ExamsScreen.dart';

import '../../Styles/Color.dart';
import 'SubjectExam.dart';
import 'drawer.dart';
import '../../constants/Comonent.dart';


class ResultPage extends StatelessWidget {
  final int num;
  ResultPage({required this.num});
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>EducationCubit(),
      child: BlocConsumer<EducationCubit,EducationStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=EducationCubit.get(context);
          Size size=MediaQuery.of(context).size;

          return Scaffold(
            appBar: AppBar(
              title: Text('Degree'),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ExamScreen()));
                  }),

            //  backgroundColor: colorDrawer,
            ),


            body:
            Center(
              child: Text('Result :${num} /${cubit.showExam!.exam[0].questions.length}',style: TextStyle(fontSize: 20),),
            ),
          );
        },

      ),
    );
  }
}
