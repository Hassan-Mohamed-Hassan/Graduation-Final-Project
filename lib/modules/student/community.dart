import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled15/modules/student/Bloc/cubit.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';

import 'drawer.dart';

import '../../constants/constants.dart';
import 'add_comment.dart';
import 'add_post.dart';


class Community extends StatelessWidget{
  int like=0;
  int dislike=0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>EducationCubit()..getPosts(),
      child: BlocConsumer<EducationCubit,EducationStates>(
      builder: (context,state){
         var cubit=EducationCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [Image.asset('asset/comunity.png',color: Colors.white,width: 40,height: 40,)],
          ),
          drawer: Drawer(
            backgroundColor: defaultColor,
            width: MediaQuery.of(context).size.width *0.55 ,
            child: DrawerItem(profileData),
          ),
          body: Padding(padding: const EdgeInsets.all(5.0),
            child:  SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AddPost()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(.2)),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                           child: Icon(Icons.person),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('Add Post',
                              style:TextStyle(fontSize: 15))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  cubit.allPosts==null? Center(child: CircularProgressIndicator(),): ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                   NetworkImage('${cubit.allPosts!.posts[index].student!.photo}'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${cubit.allPosts!.posts[index].student!.name}',
                                        style: TextStyle(
                                              fontSize: 15,
                                            )),
                                      SizedBox(height: 5,),
                                      Text(
                                        '${cubit.convertDate('${cubit.allPosts!.posts[index].student!.createdAt}')}',
                                        style:  TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${cubit.allPosts!.posts[index].body}' ,
                                style:  TextStyle(
                                      fontSize: 16,
                                    ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                color: Colors.grey,
                                height: 1.5,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon:
                                        Icon(Icons.thumb_up_alt_outlined)),
                                  ),
                                  Expanded(child: Text('${cubit.allPosts!.posts[index].likes}')),
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {

                                        },
                                        icon: Icon(
                                            Icons.thumb_down_alt_outlined)),
                                  ),
                                  Expanded(child:Text('${cubit.allPosts!.posts[index].dislikes}')),
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddComment(cubit.allPosts!.posts[index],index+1)));
                                        },
                                        icon:
                                        Icon(Icons.comment_bank_outlined)),
                                  ),
                                  Expanded(child: Text('${cubit.allPosts!.posts[index].commentsCount}')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                      itemCount:cubit.allPosts!.posts.length),
                ],
              ),
            ),
          ),
        );
        },
      listener: (context,state){},
      ),
    );
  }

}
Route createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder:(context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin =Offset(0.0, 1.0);
      const end = Offset(0.0, 0.0);
      const curve = Curves.fastOutSlowIn;
      var tween = Tween(begin: begin, end: end);
      var curveAnmation=CurvedAnimation(parent: animation, curve: curve);
      return  SlideTransition(position: tween.animate(curveAnmation),child: child,);
    },
  );
}
