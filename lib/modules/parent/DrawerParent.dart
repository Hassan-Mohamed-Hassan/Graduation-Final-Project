import 'package:untitled15/Models/GetProfileModel.dart';
import 'package:untitled15/modules/Auth/Login/LoginCubit.dart';
import 'package:untitled15/modules/parent/AbsenceScreen.dart';
import 'package:untitled15/modules/parent/Bloc/Cubit.dart';
import 'package:flutter/material.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/parent/ChildrenScreen.dart';
import 'package:untitled15/modules/parent/ExamsChildren.dart';
import 'package:untitled15/modules/parent/ResultChildren.dart';
import '../Auth/Login/EditProfile.dart';
import '../Auth/Login/Logout.dart';

class DrawerItem extends StatelessWidget {
  GetProfileModel? profile;
  DrawerItem(this.profile);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('${profile!.profile![0].photo}'),
              ),
              SizedBox(width: 6,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${profile!.profile![0].name}',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 10),),
                    SizedBox(height: 7,),
                    Text('${profile!.profile![0].email}',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 10),),

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
            navigatePush(context:context,widget: ChildrenScreen());
          },
          child: ListTile(
            leading: Icon( Icons.home,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Children',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
       navigatePush(context:context,widget: ExamsChildren());
          },
          child: ListTile(
            leading: Icon( Icons.book,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Exams',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            navigatePush(context:context,widget: AbsenceChildren());
          },
          child: ListTile(
            leading: Icon( Icons.menu_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Absence',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
           navigatePush(context:context,widget: ResultChildren());
          },
          child: ListTile(
            leading: Icon( Icons.notification_important,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Result',style: TextStyle(color: Colors.white),),
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
