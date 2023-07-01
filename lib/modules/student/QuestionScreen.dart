import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:untitled15/modules/student/Bloc/cubit.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';
import 'package:untitled15/modules/student/ExamsScreen.dart';

class MyQuizPageView extends StatefulWidget {
  double ?totaldgree;
  dynamic quizData;
  List<List>trueAnswer=[];
  int id;
  MyQuizPageView(this.totaldgree,this.quizData,this.trueAnswer,this.id);
  @override
  _MyQuizPageViewState createState() => _MyQuizPageViewState(totaldgree,quizData,this.trueAnswer,this.id);
}

class _MyQuizPageViewState extends State<MyQuizPageView> {
  int _currentPageIndex = 0;
  List<List<int>>? _selectedOptions;
  double ?totaldgree;
  dynamic quizData;
  List<List>trueAnswer;
  int id;
  _MyQuizPageViewState(this.totaldgree,this.quizData,this.trueAnswer,this.id);
  final _pageController = PageController();
  List<List>?selectedAnswer;
  @override
  void initState() {
    super.initState();
    selectedAnswer=List.generate(quizData.length, (_) => []);
    _selectedOptions = List.generate(
      quizData.length,
          (index) => List.generate(
        quizData[index]['options'].length,
            (_) => -1,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>EducationCubit(),
    child: BlocConsumer<EducationCubit,EducationStates>(
      listener: (context,state){},
      builder: (context,state){
        EducationCubit cubit=EducationCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('My Quiz'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: quizData.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            quizData[index]['question'],
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 20),
                          ...List.generate(
                            quizData[index]['options'].length,
                                (optionIndex) => RadioListTile(
                              title: Text(quizData[index]['options'][optionIndex]),
                              value: optionIndex,
                              groupValue: _selectedOptions![index][optionIndex],
                              onChanged: (value) {
                                setState(() {
                                  _selectedOptions![index] =
                                      List.generate(quizData[index]['options'].length, (_) => -1);
                                  _selectedOptions![index][optionIndex] = value!;
                                  print(index);
                                  selectedAnswer![index]=trueAnswer[index][value];
                                });

                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text('Previous'),
                      onPressed: _currentPageIndex == 0
                          ? null
                          : () {
                        setState(() {
                          _currentPageIndex--;
                          _pageController.animateToPage(
                            _currentPageIndex,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                    ),
                    ElevatedButton(
                        child: Text('Next'),
                        onPressed: _currentPageIndex == quizData.length - 1
                            ? null
                            : () {
                          bool allQuestionsAnswered = true;
                          for (int i = 0; i < _selectedOptions!.length; i++) {
                            if (_selectedOptions![i].contains(-1)) {
                              allQuestionsAnswered = false;
                              break;
                            }
                          }
                          setState(() {
                            _currentPageIndex++;
                            _pageController.animateToPage(
                              _currentPageIndex,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          });
                        }

                    ),
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: _currentPageIndex==quizData.length-1
                          ? () {
                         cubit.submitAnswer(selectedAnswer!,id,context).then((value){
                           QuickAlert.show(
                               context: context,
                               type: QuickAlertType.success,
                               text:
                                   'Done Submit Exam ',
                               onConfirmBtnTap: (){
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ExamScreen()));
                               }
                           );
                         });
                      }:null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
    );
  }
}