import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled15/Models/GetProfileModel.dart';

final Color defaultColor= HexColor('#6C5CE7');
final Color secondColor= HexColor('#00B2FF');
final Color defaultColorContainer=  Colors.grey.withOpacity(.1);
double width(context,size)=>MediaQuery.of(context).size.width*size;
double height(context,size)=>MediaQuery.of(context).size.height*size;
bool scure=true;
var passwordIcon=Icons.visibility_off_outlined;
var token;
String dropdownValue_Type_Login='students';

String? tokenSchool;
String? tokenParent;
String? tokenStudent;
String? tokenTeacher;
String? tokenLogout;
String? typeProfile;
GetProfileModel? profileData;

List<dynamic> listStatus=[
  {
    'id':'announced',
    'name':'announced'
  },
  {
    'id':'not_announced',
    'name':'not_announced'
  },

];

List listdays=[
  'Saturday',
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday'
] ;

List<dynamic> listType=[

  {
    'name': 'schools',
    'id':'schools'
  },
  {
    'name': 'parents',
    'id':'parents'
  },
  {
    'name': 'teachers',
    'id':'teachers'
  },
  {
    'name': 'students',
    'id':'students'
  },

] ;

List<dynamic> listAvailable=[
  {
    'name': 'all',
    'desc':'All Student'
  },
  {
    'name':'class',
    'desc': 'Class from Student'
  },



] ;
List<dynamic> listexams=[
  {
    'name':'exams',
    'id': 'exams'
  },
  {
    'name':'success',
    'id': 'success'
  },
  {
    'name':'faild',
    'id': 'faild'
  },

];


List<dynamic> listSubject=
[
  {
    "id": "1",
    "name": "Physics"
  },
  {
    "id": "2",
    "name": "Math"
  },
  {
    "id": "3",
    "name": "Static"
  },
  {
    "id": "5",
    "name": "Algebra"
  },
  {
    "id": "7",
    "name": "Trigonometry"
  },
  {
    "id": "10",
    "name": "History"
  },
  {
    "id": "11",
    "name": "Geography"
  },
  {
    "id": "12",
    "name": "Philosophy"
  },
  {
    "id": "13",
    "name": "Psychology"
  },
  {
    "id": "14",
    "name": "Social studies"
  },
  {
    "id": "15",
    "name": "Biology"
  },
  {
    "id": "16",
    "name": "Geology"
  },
  {
    "id": "17",
    "name": "Religion"
  },
  {
    "id": "19",
    "name": "Computer"
  },
  {
    "id": "20",
    "name": "Arabic"
  },
  {
    "id": "21",
    "name": "English"
  },
  {
    "id": "22",
    "name": "French"
  },
  {
    "id": "23",
    "name": "German"
  },
  {
    "id": "24",
    "name": "Italian"
  }
];
List<dynamic> listClass=
[
  {
    "id": "1",
    "name": "First Primary"
  },
  {
    "id": "2",
    "name": "Second Primary"
  },
  {
    "id": "3",
    "name": "Third Primary"
  },
  {
    "id": "4",
    "name": "Fourth Primary"
  },
  {
    "id": "5",
    "name": "Fifth Primary"
  },
  {
    "id": "6",
    "name": "Sixth Primary"
  },
  {
    "id": "7",
    "name": "First Preparatory"
  },
  {
    "id": "8",
    "name": "Second Preparatory"
  },
  {
    "id": "9",
    "name": "Third Preparatory"
  },
  {
    "id": "10",
    "name": "First Secondary"
  },
  {
    "id": "11",
    "name": "Second Secondary"
  },
  {
    "id": "12",
    "name": "Third Secondary"
  }
];

