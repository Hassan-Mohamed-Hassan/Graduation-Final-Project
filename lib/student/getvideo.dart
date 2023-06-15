
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled15/student/Bloc/cubit.dart';
import 'package:untitled15/student/Bloc/states.dart';
import 'package:untitled15/student/show_video.dart';


import 'drawer.dart';
import '../../constants/constants.dart';

class GetVideo extends StatelessWidget {
  int ?id;

  GetVideo(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>EducationCubit()..getVideos(id),
      child: BlocConsumer<EducationCubit,EducationStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=EducationCubit.get(context);
          return Scaffold(
              appBar: AppBar(),

              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child:  state is SuccessVideos?
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index)=> Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                    '${cubit.videos!.course[0]!.image}',
                                    width: 130,
                                    height: 135,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(width: 7,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${cubit.videos!.course[0]!.videos[index].name}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.aBeeZee(
                                            textStyle: const TextStyle(
                                              fontSize: 12,
                                            ),

                                          ),
                                        ),
                                        SizedBox(height: 7,),
                                        Text(
                                          '${cubit.videos!.course[0]!.videos[index].views}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.adamina(
                                            textStyle:const TextStyle(fontSize: 11, height: 1.5),
                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text(
                                          '${cubit.videos!.course[0]!.videos[index].length} minute',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.adamina(
                                            textStyle: const TextStyle(fontSize: 11, height: 1.5),
                                          ),
                                        ),
                                        const SizedBox(height: 7,),
                                        Row(
                                          children: [
                                            Text(
                                              '${cubit.videos!.course[0]!.videos[index].createdAt}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.adamina(
                                                textStyle: const TextStyle(fontSize: 11, height: 1.5),
                                              ),
                                            ),
                                            Spacer(),
                                            MaterialButton(
                                              color: defaultColor,
                                              onPressed: (){
                                                print("??????????????????????");
                                                print('${cubit.videos!.course[0].videos[index].video}');
                                                print("??????????????????????");
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowVideo('${cubit.videos!.course[0].videos[index].video}')));
                                              }, child:Text('Play',
                                              style: GoogleFonts.adamina(
                                                textStyle: TextStyle(fontSize: 13, color: Colors.white),
                                              ),
                                            ), )
                                          ],
                                        ),
                                        const SizedBox(height: 7,),
                                        RatingBar.builder(
                                          initialRating:double.parse('${cubit.videos!.course[0].videos[index].ratesSumRate}')/
                                              double.parse('${cubit.videos!.course[0].videos[index].ratesCount}'),
                                          minRating: 1,
                                          itemSize: 20,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],),
                            ),
                            separatorBuilder: (context,index)=>Container(height: 2,width: double.infinity,color:defaultColor),
                            itemCount: cubit.videos!.course[0].videos.length)
                      :const Center(child: CircularProgressIndicator(),
                  ),
                ),
              )
          );
        },
      ),
    );

  }
}
