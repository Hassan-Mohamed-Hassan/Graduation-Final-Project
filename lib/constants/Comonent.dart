import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled15/constants/constants.dart';
Widget BuiltTextField(
    {
      required String label,
      required TextInputType  type,
      required TextEditingController controller,
      required IconData prefix,
      IconData? suffix,
      validate,
      bool secure=false,
      suffixPressed,


    }
    )=> TextFormField(
    keyboardType: type,
    controller:controller ,
    obscureText: secure,
    decoration: InputDecoration(
        labelText:label,
        prefixIcon: Icon(
            prefix
        ),
        suffixIcon: TextButton(
          onPressed:suffixPressed ,
          child: Icon(
              suffix
          ),
        ),
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        border:OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30))
    ),
    validator: validate
);

Widget BuiltButton(
    {
       double? height,
      double? width,
       Color? color,
      required String name,
      required  Function function,
    }
    )=>
    Container(
      width:width!=null?width: double.infinity,
      height:height!=null?height: 50,
      color:color!=null? color:defaultColor,
      child: MaterialButton(
        onPressed:(){
          function();
        },
        child: Text(name.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),

      ),
    );



void navigateFininsh({
  Widget ,
  context
})=>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context)=>Widget)
        ,(route) => false
    );
void navigatePush({
  required Widget widget,
  context
})=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));

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
  );}
Widget BuiltContainerButton(
    {
      required  Function function,
       IconData? icon,
      required String text,
      double? width,
      Color? color,
    }
    ){
  return InkWell(
    onTap: (){
      function();
    } ,
    child: Container(
      height: 40,
      width: width??90,
      color: color??Colors.red,
      child:Row(
        children: [
          Icon(icon,color: Colors.white,),
          SizedBox(width:5 ,),
          Text(text,style:TextStyle(color: Colors.white,),textAlign: TextAlign.center,)
        ],
      ),
    ),
  );
}
