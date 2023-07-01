
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';
import '../../constants/constants.dart';
import 'Bloc/cubit.dart';
import 'drawer.dart';
class ResultScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>EducationCubit()..getStudentResult(),
        child: BlocConsumer<EducationCubit,EducationStates>(
          builder: (context,state){
            EducationCubit cubit=EducationCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('Result', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.55,
                child: DrawerItem(profileData),
              ),

              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
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
                            Text('T_Dagree', style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                            Spacer(),
                            Text('S_Dagree', style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                   cubit.studentResult!=null? Expanded(
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
                                      child: Text('${cubit.studentResult!.results[index].name}',
                                        maxLines: 1,overflow: TextOverflow.ellipsis
                                        ,style:TextStyle(fontSize: 20,color: secondColor),),
                                    ),
                                    Spacer(),
                                    Text('${cubit.studentResult!.results[index].results[0].subjectDegree}'
                                      ,style: TextStyle(fontSize: 20,color: secondColor),),
                                    Spacer(),
                                    Text('${cubit.studentResult!.results[index].results[0].studentDegree}',style:TextStyle(fontSize: 20,color: secondColor)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) => SizedBox(height: 10,),
                          itemCount: cubit.studentResult!.results.length
                      ),
                    ):Center(child: CircularProgressIndicator(),),

                  ],
                ),
              ),
            );},
          listener: (context,state){},
        )
    );
  }
}
