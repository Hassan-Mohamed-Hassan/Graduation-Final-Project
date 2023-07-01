import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:untitled15/Models/GetProfileModel.dart';
import 'package:untitled15/modules/student/community.dart';
import 'package:untitled15/network/local/CacheHelper.dart';
import '../../../constants/Comonent.dart';
import '../../../constants/constants.dart';
import '../../CurvedScreen.dart';
import '../../Schools/SubjectSchool.dart';
import '../../Teacher/ExamsScreen.dart';
import '../../parent/ChildrenScreen.dart';
import '../Register/RegisterScreen.dart';
import 'LoginCubit.dart';
import 'LoginState.dart';

class LoginScreen extends StatelessWidget{
  var email=TextEditingController();
  var pass=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return BlocProvider<LoginCubit>(
     create: (context)=>LoginCubit(),
     child: BlocConsumer<LoginCubit,LoginStates>(
       listener: (context,state){
       //  var cubit=LoginCubit.get(context);
         if(state is LoginSucessState){
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
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
                       child: Form(
                     key: formkey,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
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
                             condition: state is! LoginLoadingState,
                             builder: (context)=> BuiltButton(

                                 color: defaultColor,
                                 name: 'SIGN IN',
                                 function: (){
                                   print('.............');
                                 if(formkey.currentState!.validate()){
                                   print('.............');
                                   cubit.LoginData(
                                       email: email.text,
                                       password: pass.text,
                                     registerType: cubit.RegisterType
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
                               'Don’t have an Account ?',
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
                                    navigatePush(context:context,widget: RegisterScreen());
                                 },
                                 child: Text(
                                   'Register ',
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
                 ]
               )

               ),
             )
         );
       } ,

     ),
   );
  }

}