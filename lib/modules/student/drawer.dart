import 'package:flutter/material.dart';
import 'package:untitled15/Models/GetProfileModel.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/Auth/Login/Logout.dart';
import 'package:untitled15/modules/student/ResultPage.dart';

import 'package:untitled15/modules/student/community.dart';
import 'package:untitled15/modules/student/courses.dart';

import '../Auth/Login/EditProfile.dart';
import 'ExamsScreen.dart';
import 'absenceScreen.dart';
import 'books_screen.dart';

class DrawerItem extends StatelessWidget {
  GetProfileModel? getProfileStudent;
  DrawerItem(this.getProfileStudent);
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
                backgroundImage: NetworkImage('${getProfileStudent!.profile![0].photo}'),
              ),
              SizedBox(width: 6,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${getProfileStudent!.profile![0].name}',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 10),),
                    SizedBox(height: 7,),
                    Text('${getProfileStudent!.profile![0].email}',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 10),),

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
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Community()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.supervisor_account_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Community',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ExamScreen()), (route) => false);
          },
          child: ListTile(
            leading: Icon( Icons.receipt_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Exams',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AbsenceScreen()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.wrap_text_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Absense',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Courses()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.play_arrow,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Courses',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BooksScreen()), (route) => false);

          },
          child: ListTile(
            leading:Icon(Icons.book,
    color: Colors.white,
    size: 30,),
            title: Text('Books',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ResultScreen()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.quiz_outlined,
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
