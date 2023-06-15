import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled15/student/community.dart';
import 'package:untitled15/student/courses.dart';

import 'ExamsScreen.dart';
import 'NoticeScreen.dart';
import 'absenceScreen.dart';
import 'books_screen.dart';

class DrawerItem extends StatelessWidget {
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
                backgroundImage: AssetImage('assets/image.jpg'),
              ),
              SizedBox(width: 6,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mohamed Morsy',style: TextStyle(color: Colors.white,fontSize: 10),),
                    SizedBox(height: 7,),
                    Text('moh.morsy@gmail.com',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 10),),

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
            leading: Icon( Icons.book,
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
            leading: Icon( Icons.golf_course,
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
            leading: Icon( Icons.bookmark_rounded,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Books',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NoticeScreen()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.notification_important,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Notices',style: TextStyle(color: Colors.white),),
          ),
        ),
        Spacer(),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
        InkWell(
          onTap: (){},
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
