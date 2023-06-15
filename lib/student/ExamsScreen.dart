
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: DrawerItem(),
      ),
      body:cubit.subject.length!=0?Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            itemBuilder: (context,index)=> InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectExam(cubit.subject[index])));
              },
              child: Card(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.cairo(fontSize: 22,color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: 'SubjecutName : ',style: GoogleFonts.cabin(fontSize: 22,color: Colors.blue)),
                      TextSpan(text: '${cubit.subject[index]}', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            separatorBuilder: (context,index)=>SizedBox(height: 0,),
            itemCount: cubit.subject.length
        ),
      ):Center(child: CircularProgressIndicator(),)
    );}
    )
  );

  }
}
