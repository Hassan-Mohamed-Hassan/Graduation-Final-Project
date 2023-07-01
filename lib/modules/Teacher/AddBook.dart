import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../constants/Comonent.dart';
import 'Bloc/Cubit.dart';
import 'Bloc/States.dart';

class AddBook extends StatelessWidget {
  var name=TextEditingController();
  var desc=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context)=>CubitTeacher(),
        child: BlocConsumer<CubitTeacher,TeacherStates>(
          listener: (context,state){
            if(state is AddBookSuccessState){

              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Add Successful Book',
              );
            }

          },
          builder: (context,state){
            var cubit=CubitTeacher.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('Add Book'),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          BuiltTextField(
                              label: 'Name Book',
                              type: TextInputType.text,
                              controller: name,
                              prefix: Icons.title,
                              validate: (value){
                                if(value.isEmpty){
                                  return 'Please Enter Name';
                                }null;
                              }
                          ),
                          SizedBox(height: 10,),



                          MaterialButton(
                            padding: EdgeInsets.all(8),
                            onPressed: (){
                              cubit.getImage();
                            },
                            color: Colors.black,
                            child: Text('Get Image',
                              style: TextStyle(
                                  color: Colors.white
                              ),),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          cubit.imageData ==null?
                          Container(
                            margin: EdgeInsets.all(1),
                            height: 15,
                            child: Text('Please Upload Image'),
                          ):CircleAvatar(
                            radius: 40,
                            backgroundImage: FileImage(cubit.imageData!),
                          ),
                          SizedBox(height: 10,),
                           cubit.filePdf!=null?
                             Text('The File is Completely Uploaded'):Container(),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            cubit.GetFile();
                          }, child: Text('Get Pdf')),
                          SizedBox(height: 10,),



                          Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: MaterialButton(onPressed: (){

                              cubit.AddBook(
                                  name:name.text,
                                  image:cubit.imageData!,
                                book: cubit.filePdf!
                              );

                            },
                              child: Text('Add Book ',style: TextStyle(color: Colors.white,fontSize: 20),),),
                          )



                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },

        )
    );
  }
}
