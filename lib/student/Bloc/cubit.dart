import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:untitled15/Models/absence.dart';
import 'package:untitled15/Models/allExams.dart';
import 'package:untitled15/Models/cources.dart';
import 'package:untitled15/Models/videos.dart';
import 'package:untitled15/constants/Comonent.dart';
import 'package:untitled15/Models/examModel.dart';
import 'package:untitled15/student/Bloc/states.dart';
import 'package:untitled15/student/community.dart';
import 'package:untitled15/student/courses.dart';

import '../../../Models/post.dart';
import '../../../Models/subject.dart';
import '../../../network/diohelper.dart';
import 'package:file_picker/file_picker.dart';

import '../../Models/books_model.dart';
class EducationCubit extends Cubit<EducationStates> {
  EducationCubit() :super(initialState());

  static EducationCubit get(context) => BlocProvider.of(context);

  void exitFromreplaycomment(autoRepley) {
    autoRepley = false;
    FocusManager.instance.primaryFocus?.unfocus();
    emit(CommentReplayState());
  }

  var controller = TextEditingController();
  bool showdialog = false;

  void showDialog(isShowDialog) {
    showdialog = isShowDialog;
    emit(showDialogState());
  }

  Posts ?allPosts;

  Future<void> getPosts() async {
    emit(LoadingPosts());
    await DioHelper.getData(url: 'student/posts').then((value) {
      allPosts = Posts.fromJson(value.data);
      print(value.data['posts']);
      emit(SuccessPosts());
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addPost(body, context) async {
    emit(LoadingAddPosts());
    await DioHelper.postData(url: 'student/posts', data: {'body': '$body'})
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Community()));
      emit(SuccessPosts());
    }).catchError((e) {
      print(e.toString());
    });
  }

  Post comments = Post.fromJson({});
  bool sendComment = false;

  Future addComment(body, postid) async {
    sendComment = true;
    comments;
    emit(LoadingAddPosts());
    await DioHelper.postData(
        url: 'student/comments', data: {'body': '$body', 'post_id': '$postid'})
        .then((value) {
      comments = Post.fromJson(value.data['comment']);
      print(comments.body);
      print(value.data['comment']);
      sendComment = false;
      emit(SuccessPosts());
    }).catchError((e) {
      print(e.toString());
    });
  }

  void refrch() {
    emit(SuccessPosts());
  }

/*
  List<int> subjectId = [];
  List<String> subjectName = [];

  Future<void> getSubjecut() async {
    subjectId = [];
    subjectName = [];
    emit(LoadingPosts());
    await DioHelper.getSubject(url:'school/subject').then((value) {
      value.data['exists_subjects'].forEach((e) {
        subjectId.add(e['subject_id']);
        subjectName.add(e['subject']['name']);
      });
      print(subjectName);
      print(subjectId);
      emit(SuccessPosts());
    }).catchError((e) {
      print(e.toString());
    });
  }

  List<int> teacherId = [];
  List<String> teacherName = [];

  Future<void> getTeacher() async {
    teacherId = [];
    teacherName = [];
    emit(LoadingPosts());
    await DioHelper.getTeachers(url: 'school/teacher').then((value) {
      value.data['teachers'].forEach((e) {
        teacherId.add(e['id']);
        teacherName.add(e['name']);
      });
      emit(SuccessPosts());
    }).catchError((e) {
      print(e.toString());
    });
  }
*/

  ExamModel? showExam;
  AllExams? showExams;
  List<List<Answer>>anwser = [];
  List<String>question = [];
  List<String>correctAnswer = [];
  List<List<String>> isTrueValues = [];
  List<int> yesIndices = [];

  Future<void> getAllExams() async {
    showExams=null;
    emit(LoadingPosts());
    await DioHelper.getData(url:'student/exams',quary:{'teacher': 'all', 'exam': 'exams'}).then((value) {
      showExams = AllExams.fromJson(value.data);
      print(showExams!.exams[0].name);
      emit(SuccessPosts());
    }).catchError((e){
      print(e);
    });
  }

  List<List>trueAnswers=[];
  Future<void> getExam(id) async {
    showExam=null;
    question=[];
    anwser=[];
    trueAnswers=[];
    emit(LoadingPosts());
    await DioHelper.getData(url: 'student/exams/$id').then((value) {
      showExam = ExamModel.fromJson(value.data);
      showExam!.exam[0].questions.forEach((element) async {
        question.add(element.question!);
        anwser.add(element.answers);
      });
      anwser.forEach((element) {
        List Q_id_Ans_id=[];
        element.forEach((element) {
          Q_id_Ans_id.add([element.questionId,element.id]);
        });
        trueAnswers.add(Q_id_Ans_id);
      });
      print(trueAnswers);
      print('NPPPPPPPPPP');
      emit(SuccessPosts());
      for (var question in showExam!.exam[0].questions) {
        List<String> questionIsTrueValues = [];
        for (var answer in question.answers) {
          questionIsTrueValues.add(answer.isTrue ?? "not answered");
        }
        isTrueValues.add(questionIsTrueValues);
      }
      for (int i = 0; i < isTrueValues.length; i++) {
        int index = isTrueValues[i].indexOf("yes");
        yesIndices.add(index != -1 ? index : null!);
      }
      print(yesIndices);
    }).catchError((e) {
      print(e.toString());
    });
  }

  List ans = [];
  List totalanwser = [];
  List<Map<String,dynamic>> quizData=[];
  Future<dynamic> getquastion(id) async{
    quizData=[];
    await getExam(id);
    ans = [];
    totalanwser = [];
    for (int i = 0; i < anwser.length; i++) {
      for (int j = 0; j < anwser[i].length; j++) {
        ans.add(anwser[i][j].answer);
      }
      totalanwser.add(ans);
      ans = [];
    }
    for (int i = 0; i < question.length; i++) {
      print(question.length);
      print('${question[i]}');
      print('${totalanwser[i]}');
      print('${totalanwser[i][yesIndices[i]]}');
      quizData.add({
        'question': '${question[i]}',
        'options': totalanwser[i],
        'answer': '${totalanwser[i][yesIndices[i]]}',
      });
      
    }
    print(quizData.length);
    print(quizData[0]);
    print('////////////////////////////////');
    emit(SuccessCources());
    return quizData;
  }


     List subject = [];
    Subject ?subjects;
    List <Map<int,String>>SubjectName=[];
    Future getTeacherSubject() async {
      subject = [];
      SubjectName=[];
      DioHelper.getData(url: 'student/subjects').then((value){
        print(value.data);
        subjects= Subject.fromJson(value.data);
        for(int i=0;i<subjects!.subjects.length;i++){
          SubjectName.add({subjects!.subjects[0].id!:'${subjects!.subjects[0].subject!.name}'});
        }
        SubjectName.toSet();
        print(SubjectName[0]);
            });
      await getAllExams().then((value){
        for(int i=0;i<showExams!.exams.length;i++){
          if(showExams!.exams[i].subjectId==SubjectName[i].keys.elementAt(i)){
            subject.add(SubjectName[i].values.elementAt(i));
          };
        }
        subject.toSet();
        print(subject);
      });

    }

  Future submitAnswer(List<List>selectedAnswer,id) async {

    DioHelper.postData(url:'student/exams/$id',
      query: {
      for(int i=0;i<selectedAnswer.length;i++)
        for(int j=0;j<2;j++)
          'answers[$i][$j]':selectedAnswer[i][j]
      }
    ).then((value) {
      print(value.data);
      show_Toast(message: '${value.data}', color: Colors.blue);
    }).catchError(( e){
      show_Toast(message: '${e.Message}', color: Colors.red);
      print(e);
    });

  }





    String convertDate(createdAtString) {
      DateTime createdAt(createdAtString) =>
          DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse(createdAtString);
      // Format the DateTime object as a string in the desired format
      formattedCreatedAt(createdAtString) =>
          DateFormat("yyyy-MM-dd HH:mm").format(createdAt(createdAtString));
      return formattedCreatedAt(createdAtString);
    }

    Absence ?absence;
    Future<void> getAbsence() async {
      emit(LoadingAbsence());
      DioHelper.getData(url: 'student/absence').then((value) {
        absence = Absence.fromJson(value.data);
        print(absence!.room.length);
        print(':::::::::::::::::::');
        print(absence!.toJson());
        print(':::::::::::::::::::');
        emit(SuccessAbsence());
      }).catchError((e) {
        print(e.toString());
        emit(ErrorAbsence());
      });
    }
    Cources?cources;
    Future<void> getCources() async {
      emit(LoadingCources());
      DioHelper.getData(url: 'student/courses?for=all').then((value) {
        cources = Cources.fromJson(value.data);
        print(cources!.courses[0].name);
        emit(SuccessCources());
      }).catchError((e) {
        print(e.toString());
        emit(ErrorCources());
      });
    }

    Vidoes? videos;
    Future<void> getVideos(id) async {
      emit(LoadingVideos());
      DioHelper.getData(url: 'student/courses/$id').then((value) {
        print(value.data);
        videos = Vidoes.fromJson(value.data);
        print(videos!.course[0].name);

        emit(SuccessVideos());
      }).catchError((e) {
        print(e.toString());
        emit(ErrorVideos());
      });
    }

    double totalRank = 0;
    Books ?books;
    Future<void> getBooks() async {
      emit(LoadingBooks());
      DioHelper.getData(url: 'student/books').then((value) {
        books = Books.fromJson(value.data);
        print(books!.books);
        emit(SuccessBooks());
      }).catchError((e) {
        print(e.toString());
        emit(ErrorBooks());
      });

    }

  }

