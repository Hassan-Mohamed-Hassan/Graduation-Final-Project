import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:untitled15/modules/Auth/Login/LoginCubit.dart';
import 'package:untitled15/modules/Auth/Login/LoginScreen.dart';
import 'package:untitled15/modules/Schools/SubjectSchool.dart';
import 'package:untitled15/modules/Teacher/ExamsScreen.dart';
import 'package:untitled15/modules/parent/ChildrenScreen.dart';
import 'package:untitled15/modules/student/community.dart';

import '../../../constants/Comonent.dart';
import '../../../constants/constants.dart';
import '../Login/LoginState.dart';


class RegisterScreen extends StatelessWidget{
  var email=TextEditingController();
  var pass=TextEditingController();
  var name=TextEditingController();

  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is RegisterSucessState){
            if(state.model.status == 'success')
            {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: state.model.message,
              );
              if(state.model.loginType=='schools') {
                navigateFininsh(context: context, Widget: SubjectSchool());
              }
              else if(state.model.loginType=='parents'){
                navigateFininsh(context: context, Widget: ChildrenScreen());

              }
              else if(state.model.loginType=='teachers'){

                navigateFininsh(context: context, Widget: ExamsScreen());


              }
              else if(state.model.loginType=='students'){
                navigateFininsh(context: context, Widget:Community());
                //
              }
            }
            else
            {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'Sorry, something went wrong',
              );
            }
          }


        },

        builder:(context,state){
          Size size=MediaQuery.of(context).size;
          var cubit =LoginCubit.get(context);
          return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text('WELCOM\n CONNECT US',textAlign: TextAlign.center
                          , style: TextStyle(
                              color: defaultColor,fontSize: 25,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700),),
                      ),
                      Image.asset('asset/students 1.png'),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Form(
                          key: formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BuiltTextField(
                                  type: TextInputType.name,
                                  controller: name,
                                  label: 'Name',
                                  prefix: Icons.person,
                                  validate: (String? value){
                                    if(value!.isEmpty){
                                      return 'Please Enter Name ';
                                    }
                                    return null;

                                  }
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              BuiltTextField(
                                  type: TextInputType.emailAddress,
                                  controller: email,
                                  label: 'Email Address',
                                  prefix: Icons.email,
                                  validate: (String? value){
                                    if(value!.isEmpty){
                                      return 'Please Enter Email Address';
                                    }
                                    return null;

                                  }
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              BuiltTextField(
                                  type: TextInputType.visiblePassword,
                                  controller: pass,
                                  secure: cubit.secure,
                                  label: 'password',
                                  prefix: Icons.lock,
                                  suffix: cubit.secure?Icons.visibility_off:Icons.visibility,
                                  suffixPressed: (){
                                    cubit.changeIcon();
                                  },
                                  validate: (String? value){
                                    if(value!.isEmpty){
                                      return 'Please Enter Email Address';
                                    }
                                    return null;

                                  }
                              ),
                              FormHelper.dropDownWidgetWithLabel(
                                borderColor:secondColor,
                                contentPadding: 10,
                                labelFontSize: 0,
                                validationColor: secondColor,
                                borderFocusColor: secondColor,
                                context,
                                '',
                                'Choose Type',
                                cubit.RegisterType,
                                listType,
                                    (value){
                                  cubit.ChangeRegisterType(value);
                                },
                                    (onValidate){
                                  if(onValidate ==null)
                                    return 'please enter Name ';
                                },
                                optionValue: "id",
                                optionLabel: "name",
                                // hintColor: Colors.white,
                                textColor: Colors.black,
                                //  borderColor: color,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ConditionalBuilder(
                                  condition: state is! RegisterLoadingState,
                                  builder: (context)=> BuiltButton(
                                      height: 45,
                                      width: width(context, .8),
                                      color: defaultColor,
                                      name: 'Register',
                                      function: (){
                                        if(formkey.currentState!.validate()){
                                          cubit.RegisterData(
                                              name: name.text,
                                              email: email.text,
                                              password: pass.text,
                                              RegisterType: cubit.RegisterType
                                          );
                                        }
                                      }
                                  ),
                                  fallback:(context)=>Center(child: CircularProgressIndicator())
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an Account ?',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey
                                    ),

                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  TextButton(
                                      onPressed: (){

                                        navigatePush(context:context,widget: LoginScreen());
                                      },
                                      child: Text(
                                        'Login ',
                                        style: TextStyle
                                          (
                                            fontSize: 15,
                                            color: secondColor
                                        ),
                                      ))
                                ],
                              )


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          );
        } ,

      ),
    );
  }

}