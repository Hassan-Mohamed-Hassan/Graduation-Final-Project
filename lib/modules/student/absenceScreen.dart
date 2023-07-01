
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';
import '../../constants/constants.dart';
import 'Bloc/cubit.dart';
import 'drawer.dart';
class AbsenceScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>EducationCubit()..getAbsence(),
        child: BlocConsumer<EducationCubit,EducationStates>(
        builder: (context,state){
          EducationCubit cubit=EducationCubit.get(context);
      return Scaffold(
      appBar: AppBar(
        title: Text('Absence', style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
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
                    Text('Absence', style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),),
                    Spacer(),
                    Text('Day', style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),),
                    Spacer(),
                    Text('Status', style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            cubit.absence!=null? Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Column(
                    mainAxisSize:MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Room Name: ${cubit.absence!.room[index].name}',style: TextStyle(fontSize: 16,color: secondColor)),
                     SizedBox(height: 10,),
                      Container(
                        height: 50,
                         color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(flex: 2,child: Text('${cubit.absence!.room[index].students[0].name}',maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(color: defaultColor),)),
                            Spacer(),
                            Text('${cubit.absence!.room[index].students[index].createdAt!.year}-'
                                '${cubit.absence!.room[index].students[index].createdAt!.month}-'
                                '${cubit.absence!.room[index].students[index].createdAt!.day}'
                              ,style: TextStyle(color: defaultColor),),
                            Spacer(),
                            Text('Come',style: TextStyle(color: defaultColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10,),
                  itemCount: cubit.absence!.room.length
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
