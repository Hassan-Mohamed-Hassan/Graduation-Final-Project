import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled15/student/Bloc/cubit.dart';
import 'package:untitled15/student/Bloc/states.dart';
import 'package:untitled15/student/community.dart';

import '../../Models/post.dart';
import '../../constants/constants.dart';

class AddComment extends StatelessWidget{
  bool autoRepley = false;

  List<Post> comments=[];
  Post allpost;
  int postId;

  AddComment(this.allpost,this.postId);
  FocusNode focusNode = FocusNode();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>EducationCubit(),
      child: BlocConsumer<EducationCubit,EducationStates>(
        builder: (context,state){
          comments=allpost.comments;
          var cubit=EducationCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Community()));
                  }),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                        AssetImage('assets/image.jpg'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${allpost.student!.name}',
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: TextStyle(
                                              fontSize: 15,
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${allpost.body}' ,
                                    style: GoogleFonts.cairo(
                                        textStyle: TextStyle(
                                          fontSize: 16,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    height: 1.5,
                                    width: double.infinity,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:comments.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage('${comments[index].student!.photo}'),
                                        ),
                                        SizedBox(width: 8.0),
                                        Text(
                                         '${comments[index].student!.name}',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.0),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 15.0),
                                      child: Text('${comments[index].body}'),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                     '${comments[index].createdAt}',
                                      style: TextStyle(color: Colors.grey, fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  cubit.sendComment==true?
                  Center(child: CircularProgressIndicator(),):
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage('assets/image.jpg'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                focusNode: focusNode,
                                autofocus: autoRepley,
                                controller: cubit.controller,
                                onTapOutside:(v){
                                  cubit.exitFromreplaycomment(autoRepley);
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  hintText: 'Write comment...',
                                ),

                                onFieldSubmitted: (v) {
                                  if(v.isNotEmpty){
                                    cubit.addComment(v,postId).then((value){
                                      comments.add(cubit.comments);
                                      print(comments.last.body);
                                      cubit.refrch();

                                    });
                                  }
                                },
                              ),
                            ),

                          ]
                      )
                  )
                ],
              ),
            )
          );
        },
        listener: (context,state){},
      ),
    );
  }
}
