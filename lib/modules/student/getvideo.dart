
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quickalert/quickalert.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/student/Bloc/cubit.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';
import 'package:untitled15/modules/student/show_video.dart';


import 'drawer.dart';
import '../../constants/constants.dart';

class GetVideo extends StatelessWidget {
  int ?id;

  GetVideo(this.id);

  @override
  Widget build(BuildContext context) {
    TextEditingController rateControllervidep=TextEditingController();
    double rate=0.0;
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
                  child: cubit.videos!=null?
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index)=> Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
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
                                              style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                            ),
                                            SizedBox(height: 7,),
                                            Text(
                                              '${cubit.videos!.course[0]!.videos[index].views}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 11, height: 1.5),

                                            ),
                                            const SizedBox(height: 5,),
                                            Text(
                                              '${cubit.videos!.course[0]!.videos[index].length} minute',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontSize: 11, height: 1.5),
                                              ),

                                            const SizedBox(height: 7,),
                                            Row(
                                              children: [
                                                Text(
                                                  '${cubit.videos!.course[0]!.videos[index].createdAt}',
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style:  const TextStyle(fontSize: 11, height: 1.5),

                                                ),
                                                Spacer(),
                                                MaterialButton(
                                                  color: secondColor,
                                                  onPressed: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowVideo('${cubit.videos!.course[0].videos[index].video}')));
                                                  }, child:Text('Play',
                                                  style: TextStyle(fontSize: 15, color: Colors.white),

                                                ), )
                                              ],
                                            ),
                                            const SizedBox(height: 7,),

                                          ],
                                        ),
                                      ),
                                    ],),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      RatingBar.builder(
                                        initialRating:rate==0.0?double.parse('${cubit.videos!.course[0].videos[index].ratesSumRate}')/
                                            double.parse('${cubit.videos!.course[0].videos[index].ratesCount}'):rate,
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
                                      Spacer(),
                                      SizedBox(
                                        width: 120,
                                        child: MaterialButton(
                                          color: secondColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5)),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        BuiltTextField(
                                                          controller:rateControllervidep,
                                                          label: 'Rate Number',
                                                          prefix: Icons.star_rate,
                                                          type: TextInputType.number,
                                                          validate: (String? value){
                                                            if(value!.isEmpty){
                                                              return 'Please Enter rate number';
                                                            }
                                                            return null;
                                                          },
                                                        ),

                                                        ElevatedButton(onPressed: (){
                                                          print(int.parse(rateControllervidep.text));
                                                          cubit.rateVideos(video_id: cubit.videos!.course[0].videos[index].id,rate:int.parse(rateControllervidep.text),context: context).then((value){
                                                            QuickAlert.show(
                                                                context: context,
                                                                type:QuickAlertType.success ,
                                                                text: 'Done Rateing'
                                                            );
                                                             rate=double.parse(rateControllervidep.text);
                                                          }
                                                          );
                                                        }, child: Text('OK'))
                                                      ],),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            children:  [
                                              Icon(
                                                Icons.star_rate,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 10,),
                                              Text(
                                                'Rating',
                                                style:TextStyle(fontSize: 15,color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                ],
                              ),
                            ),
                            separatorBuilder: (context,index)=>Container(height: 2,width: double.infinity,color:secondColor),
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
