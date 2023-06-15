import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer.dart';
import '../../constants/constants.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
        backgroundColor: defaultColor,

      ),
      drawer: Drawer(
        backgroundColor: defaultColor,
        width: size.width *0.55 ,
        child: DrawerItem(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(width: 5,),
                Text('3/4/2023'),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index)=>NoticeItem(),
                  separatorBuilder: (context,index)=>SizedBox(height: 10,),
                  itemCount: 6
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget NoticeItem(){
    return Container(
      height: 70,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: defaultColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text('Mohamed Morsy passed in Interview to Field Flutter Development',style:  GoogleFonts.actor(textStyle: TextStyle(fontSize: 15,color: Colors.white)),),
    );
  }
}
