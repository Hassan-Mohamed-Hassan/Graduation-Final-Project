import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/OnBoardingScreen.dart';
import 'package:untitled15/modules/student/Bloc/cubit.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';
import 'package:untitled15/modules/student/community.dart';
import 'modules/Schools/SubjectSchool.dart';
import 'modules/Teacher/ExamsScreen.dart';
import 'modules/parent/ChildrenScreen.dart';
import 'network/Remote/diohelper.dart';
import 'network/local/CacheHelper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
  await CacheHelper.getinit();

  Widget startWidget;
  String ?token;
  String ?type;
  if(CacheHelper.getStringData(key:'tokenSchool')!='null'){
    tokenSchool=CacheHelper.getStringData(key:'tokenSchool');
    tokenLogout=CacheHelper.getStringData(key:'tokenLogout');
    token=CacheHelper.getStringData(key:'tokenSchool');
    type=CacheHelper.getStringData(key:'typeProfile');
    print(tokenSchool);
    startWidget=SubjectSchool();
  }
  else if(CacheHelper.getStringData(key:'tokenStudent')!='null'){
    tokenStudent=CacheHelper.getStringData(key:'tokenStudent');
    tokenLogout=CacheHelper.getStringData(key:'tokenLogout');
    token=CacheHelper.getStringData(key:'tokenStudent');
    type=CacheHelper.getStringData(key:'typeProfile');
    print(tokenStudent);
    startWidget=Community();
  }
  else if(CacheHelper.getStringData(key:'tokenTeacher')!='null'){
    startWidget=ExamsScreen();
    tokenTeacher=CacheHelper.getStringData(key:'tokenTeacher');
    tokenLogout=CacheHelper.getStringData(key:'tokenLogout');
    token=CacheHelper.getStringData(key:'tokenTeacher');
    type=CacheHelper.getStringData(key:'typeProfile');
    print(tokenTeacher);
  }
  else if(CacheHelper.getStringData(key:'tokenParent')!='null'){
    tokenParent=CacheHelper.getStringData(key:'tokenParent');
    tokenLogout=CacheHelper.getStringData(key:'tokenLogout');
    token=CacheHelper.getStringData(key:'tokenParent');
    type=CacheHelper.getStringData(key:'typeProfile');
    print(tokenParent);
    startWidget=ChildrenScreen();
  }
  else{
    startWidget=OnBoarding();
  }
print(startWidget);
  print(tokenLogout);
  runApp( MyApp(startWidget,type,token));
}

class MyApp extends StatelessWidget {
  Widget ?startWidget;
  String?token;
  String?type;
MyApp(this.startWidget,this.type,this.token);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>EducationCubit()),
      ],
      child: BlocProvider(
        create: (context) => EducationCubit()..GetProfileForAnyType(type: type,token: token),
        child: BlocConsumer<EducationCubit,EducationStates>(
          builder:(context,state){
            if( EducationCubit.get(context).profileData != null)
            {
              profileData=EducationCubit.get(context).profileData;
              print(profileData!.profile![0].createdAt);
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primaryColor: HexColor('#6C5CE7'),
                    textTheme: TextTheme(
                      bodyMedium: TextStyle(color: Colors.black,fontSize: 15,),
                    ),
                    appBarTheme: AppBarTheme(
                        toolbarHeight: 60,
                        backgroundColor: HexColor('#6C5CE7'),
                        actionsIconTheme: IconThemeData(color: Colors.white,size: 30),
                        elevation: 0
                    ),
                    iconTheme: IconThemeData(
                        color:  HexColor('#6C5CE7')
                    )
                ),
                home: startWidget
            );
            }
             else if(token !=null){
              return  MaterialApp(
                  title: 'Flutter Demo',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      primaryColor: HexColor('#6C5CE7'),
                      textTheme: TextTheme(
                        bodyMedium: TextStyle(color: Colors.black,fontSize: 15,),
                      ),
                      appBarTheme: AppBarTheme(
                          toolbarHeight: 60,
                          backgroundColor: HexColor('#6C5CE7'),
                          actionsIconTheme: IconThemeData(color: Colors.white,size: 30),
                          elevation: 0
                      ),
                      iconTheme: IconThemeData(
                          color:  HexColor('#6C5CE7')
                      )
                  ),
                  home: Container(color: Colors.white,child: Center(child: CircularProgressIndicator(),),)
              ) ;
            }
               else return MaterialApp(
                  title: 'Flutter Demo',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      primaryColor: HexColor('#6C5CE7'),
                      textTheme: TextTheme(
                        bodyMedium: TextStyle(color: Colors.black,fontSize: 15,),
                      ),
                      appBarTheme: AppBarTheme(
                          toolbarHeight: 60,
                          backgroundColor: HexColor('#6C5CE7'),
                          actionsIconTheme: IconThemeData(color: Colors.white,size: 30),
                          elevation: 0
                      ),
                      iconTheme: IconThemeData(
                          color:  HexColor('#6C5CE7')
                      )
                  ),
                  home: startWidget
              );

          },
          listener: (context,state){},
        ),
      )
    );
  }
}

