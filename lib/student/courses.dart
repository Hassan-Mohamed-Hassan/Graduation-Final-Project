
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled15/student/Bloc/cubit.dart';
import 'package:untitled15/student/Bloc/states.dart';
import 'package:untitled15/student/getvideo.dart';
import 'package:untitled15/student/show_video.dart';


import 'drawer.dart';
import '../../constants/constants.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>EducationCubit()..getCources(),
      child: BlocConsumer<EducationCubit,EducationStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=EducationCubit.get(context);
          return Scaffold(
              appBar: AppBar(),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child:cubit.cources!=null?  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder:(contex,index)=> Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          '${cubit.cources!.courses[index].image}',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${cubit.cources!.courses[index].name}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Text(
                              '${cubit.cources!.courses[index].createdAt!.createdAt}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.adamina(
                                textStyle: TextStyle(fontSize: 12, height: 1.5),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '${cubit.cources!.courses[index].createdAt!.createdAtDate!.year}/'
                                  '${cubit.cources!.courses[index].createdAt!.createdAtDate!.month}/'
                                  '${cubit.cources!.courses[index].createdAt!.createdAtDate!.day}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.adamina(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  height: 1.7,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating:double.parse('${cubit.cources!.courses[index].ratesSumRate!}')/double.parse('${cubit.cources!.courses[index].videosCount!}'),
                              minRating: 1,
                              itemSize: 30,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Spacer(),
                            Text(
                              'Vidoes Count:  ${cubit.cources!.courses[index].videosCount} ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.adamina(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  height: 1.7,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Description',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alef(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: defaultColor),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child:Text( '${cubit.cources!.courses[index].description}',)
                        ),
                        SizedBox(height: 10,),
                        MaterialButton(
                          color: defaultColor,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>GetVideo(cubit.cources!.courses[index].id)));
                          }, child:Text('View Videos',
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ), ),
                        SizedBox(height: 15,),
                        Container(height: 2,width: double.infinity,color: defaultColor,),
                        SizedBox(height: 15,),
                      ],
                    ),
                    itemCount:cubit.cources!.courses.length,
                  ):Center(child: CircularProgressIndicator(),),
                ),
              )
          );
        },
      ),
    );

  }
}
