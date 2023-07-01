import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/modules/student/Bloc/cubit.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';

import '../../constants/constants.dart';

class AddPost extends StatelessWidget {


var postController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>EducationCubit(),
      child: BlocConsumer<EducationCubit,EducationStates>(
          builder: (context,state){
            var cubit=EducationCubit.get(context);
            return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                Navigator.pop(context);
                },
                  icon: const Icon(Icons.arrow_back,size: 35,),
                )

                ),
                body: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                      NetworkImage('${profileData!.profile![0].photo}'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Hassan Mohamed',
                                        style:  TextStyle(
                                              fontSize: 15,
                                            )),

                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                          width: double.infinity,
                                          height: 200,
                                          margin:EdgeInsets.symmetric(horizontal: 10) ,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color:defaultColorContainer,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Write Post...',
                                            ),
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            controller: postController,
                                          )
                                      ),
                                     /* if(cubit.image!=null) Expanded(
                                        child: Container(width: double.infinity,
                                          padding: EdgeInsets.all(10),
                                          margin:EdgeInsets.symmetric(horizontal: 10) ,
                                          decoration: BoxDecoration(
                                            color:defaultColorContainer,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Image(image:FileImage(cubit.image!,),
                                              width: double.infinity,
                                              height: 250,fit: BoxFit.fill),
                                        ),
                                      )*/
                                    ],
                                  ),
                                ),
                               /* SizedBox(height: 10,),
                                ElevatedButton(onPressed: (){
                                  cubit.showDialog( true);

                                },
                                    style: ElevatedButton.styleFrom(backgroundColor: defaultColor,elevation: 0,),
                                    child: Text('Add Image',style: GoogleFonts.actor(),)),*/
                                SizedBox(height: 10,),
                               state is LoadingAddPosts? Center(child: CircularProgressIndicator(),): ElevatedButton(onPressed: (){
                                  cubit.addPost('${postController.text}',context);
                                },
                                    style: ElevatedButton.styleFrom(fixedSize: Size(200, 30),
                                      backgroundColor: defaultColor,elevation: 0,),
                                    child: Text('Publish',style:TextStyle(fontSize: 15),)),

                               /* if(cubit.showdialog) AlertDialog(
                                  backgroundColor: defaultColorContainer,
                                  actionsAlignment: MainAxisAlignment.end,
                                  actionsPadding: EdgeInsets.zero,
                                  contentPadding:EdgeInsets.zero,

                                  elevation: 0,
                                  content:Column(children: [ListTile(
                                    leading: Icon(Icons.camera_alt,color: defaultColor,),
                                    title:Text('Camera',style:GoogleFonts.cairo(textStyle:TextStyle(color: defaultColor))
                                    ),
                                    onTap: (){cubit.getCameraImage();},
                                  ),
                                    ListTile(
                                      leading: Icon(Icons.image,color: defaultColor,),
                                      title:Text('Gallery',style:GoogleFonts.cairo(textStyle:TextStyle(color: defaultColor))
                                      ),
                                      onTap: (){cubit.getGallertImage();},
                                    ),
                                  ],),
                                  actions: [
                                    // The "Yes" button
                                    TextButton(
                                        onPressed: () {
                                          // Remove the box
                                          cubit.showDialog( false);
                                          // Close the dialog
                                        },
                                        child: const Text('Cancel')),
                                  ],
                                )*/
                              ]
                          ),
                        )
                      ]
                  ),
                )
            );
          },
      listener: (context,state){},
      ),
    );
  }
}
