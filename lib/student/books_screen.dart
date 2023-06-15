import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled15/student/Bloc/cubit.dart';
import 'package:untitled15/student/Bloc/states.dart';
import 'package:untitled15/student/books_detail.dart';

import 'drawer.dart';
import '../../constants/Comonent.dart';
import '../../constants/constants.dart';


class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>EducationCubit()..getBooks(),
      child: BlocConsumer<EducationCubit,EducationStates>(
        listener: (context,index){},
        builder:(context,state){
          EducationCubit cubit=EducationCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Books Page'),
            ),
            drawer: Drawer(
              backgroundColor: defaultColor,
              width: MediaQuery.of(context).size.width *0.55 ,
              child: DrawerItem(),
            ),
            body: state is SuccessBooks?Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 1 / 1.8,
              children: List.generate(
                cubit.books!.books.length,
                    (index) => GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BooksDetail(cubit.books!.books[index])));
                  },
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(image: NetworkImage(cubit.books!.books[index].image),height: 145,width:180,),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(cubit.books!.books[index].name,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          const SizedBox(
                            height: 7,
                          ),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: double.parse('${cubit.books!.books[index].ratesSumRate}'),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(Icons.person),
                              Text('${cubit.books!.books[index].teacher.name}',style: const TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          MaterialButton(
                            shape: Border.all(color: const Color.fromRGBO(108, 92, 231, 1)),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BooksDetail(cubit.books!.books[index])));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.more_horiz,color:defaultColor,),
                                Text('For More')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ):Center(child: CircularProgressIndicator(),),
          );
        },

    )
      );
  }
}
