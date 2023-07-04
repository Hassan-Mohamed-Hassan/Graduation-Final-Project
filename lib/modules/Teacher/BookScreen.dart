
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/Teacher/AddBook.dart';
import 'package:untitled15/modules/Teacher/ViewBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/modules/Teacher/Bloc/Cubit.dart';
import 'package:untitled15/modules/Teacher/Bloc/States.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../constants/constants.dart';
import 'DrawerTeacher.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CubitTeacher()..GetBook(),
      child: BlocConsumer<CubitTeacher,TeacherStates>(
        listener: (context,state){
          if(state is DeleteBookSuccessState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Delete Successful Book',
            );
          }
          if(state is DeleteBookErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'error Invalid',
            );
          }
        },
        builder: (context,state){
          var cubit=CubitTeacher.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Books'),
            ),
            drawer: Drawer(
              backgroundColor: defaultColor,
              width: MediaQuery.of(context).size.width *0.55 ,
              child: DrawerItem(profileData),
            ),
            body: ConditionalBuilder(
                condition: state is! GetBookLoadingState,
                builder: (context)=>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context,index)=>Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                elevation: 20,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${cubit.getBookModel!.books![index].name}'),
                                      SizedBox(height: 10,),
                                      /*
                                      SizedBox(
                                        width: 200,
                                          height: 100,
                                          child: Image(image: NetworkImage('${cubit.getBookModel!.books![index].image}'))),

                                       */
                                      Row(children: [
                                        Icon(Icons.person),
                                        SizedBox(width: 20,),
                                        Text('${cubit.getBookModel!.books![index].teacher!.name}')
                                      ],),
                                      SizedBox(height: 10,),

                                      Row(children: [
                                        Icon(Icons.book),
                                        SizedBox(width: 20,),
                                        Text('${cubit.getBookModel!.books![index].size}')
                                      ],),
                                      SizedBox(height: 10,),

                                      Row(children: [
                                        Icon(Icons.book),
                                        SizedBox(width: 20,),
                                        Text('${cubit.getBookModel!.books![index].views} views')
                                      ],),
                                      SizedBox(height: 10,),

                                      Row(children: [
                                        Icon(Icons.book),
                                        SizedBox(width: 20,),
                                        Text('${cubit.getBookModel!.books![index].createdAt}')
                                      ],),
                                      SizedBox(height: 10,),
                                      RatingBar.builder(
                                        itemBuilder: (context,i)=>Icon(Icons.star,color: Colors.amber,size: 16,),
                                        onRatingUpdate: (index){

                                        },
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 5),
                                        initialRating: cubit.getBookModel!.books![0].ratesCount!.toDouble(),
                                        itemSize: 14,
                                        direction: Axis.horizontal,
                                        minRating:  cubit.getBookModel!.books![0].ratesCount!.toDouble(),
                                        maxRating: 5,

                                      ),
                                      SizedBox(height: 10,),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: BuiltContainerButton(
                                                function: (){
                                                  navigatePush(context:context,widget: ViewBook(url: cubit.getBookModel!.books![index].book!));
                                                },
                                                icon: Icons.view_array_outlined, text: 'View Book'
                                            ),
                                          ),
                                          SizedBox(width: 20,),
                                          Expanded(
                                            child: BuiltContainerButton(
                                                function: (){
                                                  cubit.DeleteBook(id: cubit.getBookModel!.books![index].id!);
                                                },
                                                color: Colors.red,
                                                icon: Icons.delete, text: 'Delete'
                                            ),
                                          ),

                                        ],
                                      )






                                    ],
                                  ),
                                ),
                              ),
                            ),
                            separatorBuilder: (context,index)=>SizedBox(height: 20,),
                            itemCount: cubit.getBookModel!.books!.length
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Spacer(),
                          BuiltContainerButton(function: (){
                            navigatePush(context:context,widget: AddBook());
                          }, icon: Icons.add, text: 'Add Book')
                        ],
                      )
                    ],
                  ),
                ),
                fallback:(context)=>Center(child: CircularProgressIndicator())
            ),
          );
        },

      ),
    );
  }
  Widget BuiltContainerButton(
      {
        required  Function function,
          Color ?color,
        required IconData? icon,
        required String text
      }
      ){
    return InkWell(
      onTap: (){
        function();
      } ,
      child: Container(
        height: 40,
        color: color??secondColor,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(icon,color: Colors.white,),
              SizedBox(width:5 ,),
              Text(text,style:TextStyle(color: Colors.white) ,)
            ],
          ),
        ),
      ),
    );
  }
}
