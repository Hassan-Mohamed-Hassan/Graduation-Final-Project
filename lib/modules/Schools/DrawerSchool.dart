import 'package:untitled15/Models/GetProfileModel.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/Schools/Bloc/Cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/modules/Auth/Login/LoginCubit.dart';
import 'package:untitled15/modules/Schools/AbsenceScreen.dart';
import 'package:untitled15/modules/Schools/ClassesScreen.dart';
import 'package:untitled15/modules/Schools/ResultScreen.dart';
import 'package:untitled15/modules/Schools/RoomsScreen.dart';
import 'package:untitled15/modules/Schools/ScheduleScreen.dart';
import 'package:untitled15/modules/Schools/SubjectSchool.dart';
import 'package:untitled15/modules/Schools/TeacherScreen.dart';

import '../../constants/Comonent.dart';
import '../Auth/Login/EditProfile.dart';
import '../Auth/Login/Logout.dart';


class DrawerItem extends StatelessWidget {
  GetProfileModel? profileData;

  DrawerItem(this.profileData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('${profileData!.profile![0].photo}'),
              ),
              SizedBox(width: 6,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${profileData!.profile![0].name}',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 10),),
                    SizedBox(height: 7,),
                    Text('${profileData!.profile![0].email}',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 10),),

                  ],
                ),
              ),
            ],
          ),

        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
        InkWell(
          onTap: (){
            navigatePush(context:context,widget:SubjectSchool()) ;
            //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ExamScreen()), (route) => false);
          },
          child: ListTile(
            leading: Icon( Icons.subject_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Subject',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ClassesScreen()), (route) => false);
            navigatePush(context:context,widget: ClassesScreen());
          },
          child: ListTile(
            leading: Icon( Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Classes',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            navigatePush(context:context,widget: RoomsScreen());

          },
          child: ListTile(
            leading: Icon( Icons.roofing_sharp,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Rooms',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            navigatePush(context:context,widget: TeacherScreen());

          },
          child: ListTile(
            leading: Icon( Icons.person,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Teachers',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            navigatePush(context:context,widget: ScheduleScreen());

          },
          child: ListTile(
            leading: Icon( Icons.zoom_out_map_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Schedule',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            navigatePush(context:context,widget: AbsenceScreen());

          },
          child: ListTile(
            leading: Icon( Icons.zoom_out_map_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Absence',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            navigatePush(context:context,widget: ResultScreen());

          },
          child: ListTile(
            leading: Icon( Icons.zoom_out_map_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Results',style: TextStyle(color: Colors.white),),
          ),
        ),
        Spacer(),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
        InkWell(
          onTap: (){
            navigatePush(context:context,widget: EditProfile());

          },
          child: ListTile(
            leading: Icon( Icons.person,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Profile',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            navigatePush(context:context,widget: Logout());
          },
          child: ListTile(
            leading: Icon( Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Sign out',style: TextStyle(color: Colors.white),),
          ),
        ),

      ],
    );
  }
}
