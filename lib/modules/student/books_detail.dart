import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/student/Bloc/cubit.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';
import 'package:untitled15/modules/student/showpdf.dart';

import 'drawer.dart';
import '../../constants/constants.dart';
import '../../Models/books_model.dart';

class BooksDetail extends StatelessWidget {
Book ?books;

BooksDetail(this.books);

  @override
  Widget build(BuildContext context) {
    TextEditingController rateController=TextEditingController();
    double rate=0.0;
    return BlocProvider(create: (context)=>EducationCubit(),
    child: BlocConsumer<EducationCubit,EducationStates>(
      listener: (context,state){},
      builder: (context,state){
        EducationCubit cubit=EducationCubit.get(context);
        return Scaffold(
          appBar: AppBar(leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,size: 35,),
          ),),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: NetworkImage('${books!.image}'),
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      '${books!.name}',
                      style: TextStyle(fontSize: 20,color: defaultColor)
                  ),
                  const SizedBox(height: 18),
                  Text(
                      '${books!.description}',
                      style:TextStyle(fontSize: 15)
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${books!.teacher!.name}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.visibility_outlined),
                          const SizedBox(
                            width: 6,
                          ),
                          Text('${books!.views} Views')
                        ],
                      ),
                      RatingBar.builder(
                        itemSize: 20,
                        initialRating:rate==0.0?double.parse('${books!.ratesSumRate}'):rate,
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
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text('${books!.createdAt}'),
                  const SizedBox(height: 18),
                  Row(children: [
                    MaterialButton(
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
                                      controller:rateController,
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
                                    print(books!.id);
                                    print(int.parse(rateController.text));
                                    cubit.rateBooks(book_id: books!.id,rate:int.parse(rateController.text)).then((value){
                                      QuickAlert.show(
                                          context: context,
                                          type:QuickAlertType.success ,
                                          text: 'Done Rateing'
                                      );
                                     rate=double.parse(rateController.text);
                                     cubit.refrch();
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
                            style:TextStyle(fontSize: 16,color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                      color:secondColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFViewer(url:'${books!.book}',)));
                      },
                      child: Row(
                        children:  [
                          Icon(
                            Icons.book_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'Read',
                            style:TextStyle(fontSize: 16,color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
        );
      },
    ),
    );
  }
}
