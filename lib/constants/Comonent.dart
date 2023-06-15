import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Models/books_model.dart';
import 'constants.dart';

//code create by morsy;
List<String>resultone=[
  'Announced',
  'play',
  'mohamed',
];
List<String> resulttwo=[
  'All Courses',
  'All',
  'mohamed',
];
List<String>itemone=[
  'your Teacher',
  'Student',
  'School',
];
List<String>itemtwo=[
  'Exams',
  'Successful',
  'Faild',
];
//code create by Osama;

Widget buildDropDown(
    {@required String? dropdownValue,
      @required List<String>? itemsDefault,
      @required onChanged,
    }) =>
    Container(
      color: HexColor('#EEF2FF'),
      child: DropdownButton<String>(
        value: dropdownValue,
        style: TextStyle(color: defaultColor),
        dropdownColor: HexColor('#EEF2FF'),
             isExpanded: true,
        items: itemsDefault!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            enabled: value != 'Sunday',
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.comfortaa(
                fontSize: 17,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
//Code DropDown

  Widget BuiltButton({
    required String name,
    required function,
    double? height,
    double? width,
    Color ? backgroundColor

  }){
    return Container(
      height: height,
      width: width,
      color:backgroundColor??defaultColor,
      child: MaterialButton(
          onPressed: function,
         elevation: 0,
          color: Colors.transparent,
          splashColor:defaultColor,
          child: Text('${name}',style: GoogleFonts.actor(fontSize: 16,fontWeight: FontWeight.w700,color:Colors.white),)
      ),
    );
  }

Widget buildTextFormField({required String ?label,required textControler,required Submitted,TextInputType? textInputType}){
  return TextFormField(
    keyboardType:textInputType??TextInputType.text,
    controller: textControler,
    onFieldSubmitted: (value){
      Submitted;
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none
        ),
      label: Text('$label',style: GoogleFonts.cairo(),),
      prefixIcon: Icon(Icons.text_fields),
      filled: true,
      fillColor: HexColor('#EEF2FF')
    ),

  );
}

Widget defaultTextButton({@required function,@required widget})=>TextButton(onPressed:function, child:widget);
void navigatorTO(context,page)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>page));

void navigatorTOAndRemove(context,page)=>Navigator.pushAndRemoveUntil(context,   MaterialPageRoute(builder: (context) =>page), (route) => false);

void show_Toast({required String message,required Color color,}){
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 4,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}