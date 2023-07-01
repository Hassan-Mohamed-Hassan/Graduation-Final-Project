
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/Auth/Login/LoginCubit.dart';

import '../../../constants/Comonent.dart';
import 'LoginState.dart';

class EditProfile extends StatelessWidget {
  var name=TextEditingController();
  var email=TextEditingController();
  var address=TextEditingController();
  var mobile=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    name.text=profileData!.profile![0].name??'';
    email.text=profileData!.profile![0].email??'';
    address.text=profileData!.profile![0].address??'';
    mobile.text=profileData!.profile![0].phone??'';
    return BlocProvider(
        create: (context)=>LoginCubit(),
        child: BlocConsumer<LoginCubit,LoginStates>(
          listener: (context,state){
            if(state is UpdateProfileSuccessState){
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Successful Edit Profile',
              );
            }
            if(state is UpdatePhotoSuccessState){
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Successful Edit Photo',
              );
            }

            if(state is UpdateProfileErrorState){
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'Error Invalid ',
              );
            }

          },
          builder: (context,state){
            var cubit=LoginCubit.get(context);
            return Scaffold(
                appBar: AppBar(
                  title: Text('Update Profile'),
                  leading:IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ) ,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Center(
                      child: Form(
                        key: formKey,

                        child: Column(
                          children: [
                            if(state is UpdateProfileLoadingState)
                              LinearProgressIndicator(),
                            SizedBox(
                              height: 20,
                            ),
                            if(state is UpdatePhotoLoadingState)
                              LinearProgressIndicator(),
                            SizedBox(
                              height: 20,
                            ),

                            BuiltTextField(
                              label: 'Name',
                              type: TextInputType.name,
                              controller: name,
                              prefix: Icons.person,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            BuiltTextField(
                              label: 'Email',
                              type: TextInputType.emailAddress,
                              controller: email,
                              prefix: Icons.email,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            BuiltTextField(
                              label: 'Mobile',
                              type: TextInputType.number,
                              controller: mobile,
                              prefix: Icons.phone,
                            ),


                            SizedBox(
                              height: 20,
                            ),



                            BuiltTextField(
                              label: 'Address',
                              type: TextInputType.text,
                              controller: address,
                              prefix: Icons.title,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            BuiltContainerButton(
                                function: (){
                                  if(formKey.currentState!.validate()){
                                    cubit.UpdateProfile(
                                        name: name.text,
                                        email: email.text,
                                        phone: mobile.text,
                                        address: address.text
                                    );
                                  }
                                },
                                icon: Icons.edit,
                                text: 'Edit Profile'
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
                            Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: MaterialButton(onPressed: (){
                                cubit.EditPhoto(
                                    photo:cubit.imageData!
                                );

                              },
                                child: Text('Edit Photo ',style: TextStyle(color: Colors.white,fontSize: 20),),),
                            )




                          ],
                        ),
                      ),
                    ),
                  ),
                )
            );
          },

        )
    );
  }
  Widget BuiltContainerButton(
      {
        required  Function function,
        required IconData icon,
        required String text
      }
      ){
    return InkWell(
      onTap: (){
        function();
      } ,
      child: Container(
        height: 40,
        color: Colors.red,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(width:5 ,),
            Text(text,style:TextStyle(color: Colors.white) ,)
          ],
        ),
      ),
    );
  }
}
