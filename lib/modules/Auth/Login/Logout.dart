import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/Auth/Login/LoginScreen.dart';

import '../../../constants/Comonent.dart';
import '../../CurvedScreen.dart';
import 'LoginCubit.dart';
import 'LoginState.dart';


class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is LogoutSuccessState){
            navigateFininsh(context: context,Widget: LoginScreen());
          }
        },
        builder: (context,state){
          var cubit=LoginCubit.get(context);
          return Scaffold(
            body: Column(

              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: size.height *0.3,
                      width: double.infinity,

                      child: ClipPath(
                          clipper: CurveCliper(),
                          child:Container(
                            decoration: BoxDecoration(
                                color: defaultColor

                            ),
                          )
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: SizedBox(
                        height: 80,
                        child: TextLiquidFill(
                          text: ' LOGOUT ',
                          waveColor: Colors.red,
                          boxBackgroundColor: defaultColor,
                          textStyle: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),

                          boxHeight: 80.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: TextButton(
                          onPressed: (){
                            cubit.Logout();
                           },
                          child: Text('LOGOUT',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: defaultColor),)
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}
