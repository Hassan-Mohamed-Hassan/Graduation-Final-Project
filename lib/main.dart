import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled15/student/Bloc/cubit.dart';
import 'package:untitled15/student/community.dart';
import 'network/diohelper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>EducationCubit()..getPosts()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: HexColor('#6C5CE7'),
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
      home: Community()
    )
    );
  }
}

