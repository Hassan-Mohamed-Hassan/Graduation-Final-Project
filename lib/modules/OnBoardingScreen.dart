
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/modules/Auth/Login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class board{
  String? title;
  String? Text;
  String? image;
  board({this.title,this.Text,this.image});
}

class OnBoarding extends StatefulWidget{
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  bool last=false;
  var controller=PageController();
  List<board> list=[
    board(
        title: 'School',
        Text:'A school that adds students, adds teachers, adds subjects, adds the school schedule, and takes teachers absences',
        image:'asset/images/schools.jpg'
    ),
    board(
        title: 'Teacher',
        Text:'Teachers add courses, books and exams and take care of students absence ',
        image:'asset/images/teacher.jpeg'
    ),
    board(
        title: 'Student',
        Text:'Students take exams, listen to courses, and study books ',
        image:'asset/images/student.jpg'
    ),
    board(
        title: 'Parent',
        Text:"Parents see their children\'s grades in exams and see their children\'s absence ",
        image:'asset/images/parent.jpeg'
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            TextButton(
                onPressed:(){
                  navigatePush(context: context,widget: LoginScreen());
    },

                child: Text(
                  'Skip',
                  style:  TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                )
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int value){
                    if(value==list.length-1){
                      setState(() {
                        last=true;
                      });
                    }
                    else{
                      setState(() {
                        last=false;
                      });
                    }

                  },
                  controller: controller,
                  itemBuilder: (context,index)=>BuiltItem(list[index]),
                  itemCount: list.length,
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: list.length,
                    effect:ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.deepOrange,
                        expansionFactor: 4,
                        spacing: 5
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: (){
                      if(last){
                        navigatePush(context: context,widget: LoginScreen());
                      }
                      else{
                        controller.nextPage(duration: Duration(
                            milliseconds: 750
                        ), curve:Curves.fastLinearToSlowEaseIn );
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
Widget BuiltItem(board item)=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(child: SizedBox(
      width: double.infinity,
        child: Image(image: AssetImage('${item.image}')))),
    Text('${item.Text}'),
    SizedBox(
      height: 20,
    ),
    Text('${item.title}'),

  ],
);