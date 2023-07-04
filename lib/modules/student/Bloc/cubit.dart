import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:untitled15/Models/GetProfileModel.dart';
import 'package:untitled15/Models/absence.dart';
import 'package:untitled15/Models/allExams.dart';
import 'package:untitled15/Models/cources.dart';
import 'package:untitled15/Models/courseModelForClass.dart';
import 'package:untitled15/Models/student/successExam.dart';
import 'package:untitled15/Models/studentResult.dart';
import 'package:untitled15/Models/videos.dart';
import 'package:untitled15/Models/examModel.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/student/Bloc/states.dart';
import 'package:untitled15/modules/student/community.dart';
import 'package:untitled15/network/local/CacheHelper.dart';
import '../../../Models/books_model.dart';
import '../../../Models/post.dart';
import '../../../Models/subject.dart';
import '../../../network/Remote/diohelper.dart';

class EducationCubit extends Cubit<EducationStates> {
  EducationCubit() :super(initialState());

  static EducationCubit get(context) => BlocProvider.of(context);

  void exitFromreplaycomment(autoRepley) {
    autoRepley = false;
    FocusManager.instance.primaryFocus?.unfocus();
    emit(CommentReplayState());
  }

  var controller = TextEditingController();

  Posts ?allPosts;
  Future<void> getPosts() async {
     emit(LoadingGetPosts());
     await DioHelper.getData(url: 'student/posts',token: tokenStudent!).then((value) {
      allPosts = Posts.fromJson(value.data);
      print(value.data['posts']);
      emit(SuccessGetPosts());
    }).catchError((e) {
      emit(ErrorGetPosts());
      print(e.toString());
    });
  }

  Future<void> addPost(body, context) async {
    emit(LoadingAddPosts());
    await DioHelper.postData(url: 'student/posts',token: tokenStudent!,data: {'body': '$body'})
        .then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Community()));
      emit(SuccessAddPosts());
    }).catchError((e) {
      emit(ErrorAddPosts());
      print(e.toString());
    });
  }

  Post comments = Post.fromJson({});
  bool sendComment = false;
  Future addComment(body, postid) async {
    sendComment = true;
    comments;
    emit(LoadingAddComment());
    await DioHelper.postData(
        url: 'student/comments', token: tokenStudent!,data: {'body': '$body', 'post_id': '$postid'})
        .then((value) {
      comments = Post.fromJson(value.data['comment']);
      sendComment = false;
      emit(SuccessAddComment());
    }).catchError((e) {
      print(e.toString());
      emit(ErrorAddComment());
    });
  }

  void refrch() {
    emit(RefrechState());
         }





  AllExams? showExams;
  Future<void> getAllExams() async {
    showExams=null;
    emit(LoadingGetAllExamsState());
    await DioHelper.getData(url:'student/exams',token: tokenStudent!,query:{'teacher': 'all', 'exam': 'exams'}).then((value) {
      showExams = AllExams.fromJson(value.data);
      print(showExams!.exams[0].name);
      emit(SuccessGetAllExamsState());
    }).catchError((e){
      emit(ErrorGetAllExamsState());
      print(e);
    });
  }

  SuccessExam ?successExam;
  Future<void> getsuccesExams() async {
    successExam=null;
    emit(LoadingGetAllExamsState());
    await DioHelper.getData(url:'student/exams',token: tokenStudent!,query:{'teacher': 'all', 'exam': 'success'}).then((value) {
      successExam = SuccessExam.fromJson(value.data);
      emit(SuccessGetSuccessExamsState());
    }).catchError((e){
      emit(ErrorGetSuccessExamsState());
      print(e);
    });

  }

  SuccessExam ?faildExam;
  Future<void> getfaildExams() async {
    faildExam=null;
    emit(LoadingGetFaildExamsState());
    await DioHelper.getData(url:'student/exams',token: tokenStudent!,query:{'teacher': 'all', 'exam': 'faild'}).then((value) {
      faildExam =  SuccessExam.fromJson(value.data);
      emit(SuccessGetFaildExamsState());
    }).catchError((e){
      emit(ErrorGetFaildExamsState());
      print(e);
    });
  }

  List<List<String>> isTrueValues = [];
  List<int> yesIndices = [];
  ExamModel? showExam;
  List<List<Answer>>anwser = [];
  List<String>question = [];
  List<List>trueAnswers=[];
  Future<void> getExam(id) async {
    showExam=null;
    question=[];
    anwser=[];
    trueAnswers=[];
    emit(LoadingGetExamsByIdState());
    await DioHelper.getData(url: 'student/exams/$id',token: tokenStudent!).then((value) {
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
      emit(SuccessGetExamsByIdState());
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
    }).catchError((e) {
      emit(ErrorGetExamsByIdState());
      print(e.toString());
    });
  }

  List ans = [];
  List totalanwser = [];
  List<Map<String,dynamic>> quizData=[];
  Future<dynamic> getquastion(id) async{
    emit(LoadingGetQuestion());
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
      quizData.add({
        'question': '${question[i]}',
        'options': totalanwser[i],
       'answer': '${totalanwser[i][yesIndices[i]]}',
      });
        print('${totalanwser[i][yesIndices[i]]}');
    }
    emit(SuccessGetQuestion());
    return quizData;
  }

    List subject = [];
    List subjectName = [];
    Subject ?subjects;
    List <Map<int,String>>subjectData=[];
    Future getTeacherSubject() async {

      emit(LoadingGetSubject());
       DioHelper.getData(url: 'student/subjects',token: tokenStudent!).then((value){
      subjects= Subject.fromJson(value.data);
      print(value.data);
    }).then((value){
      for(int i=0;i<subjects!.subjects.length;i++) {
         subjectData.add({
          subjects!.subjects[i].id!: '${subjects!.subjects[i].subject!.name}'
                     });
            print(subjectData[i]);
      }
     getAllExams().then((value){
       print(showExams!.exams.length);
      for(int j=0;j<showExams!.exams.length;j++){
      for(int i=0;i<subjects!.subjects.length;i++){
        if(showExams!.exams[j].subjectId==subjectData[i].keys.elementAt(0)){
          subject.add(subjectData[i].values.elementAt(0));
        };
      }

      }
       subject.toSet();
         subjectName=subject.toSet().toList();
        emit(SuccessGetSubject());
     });
    });
  }

    Future submitAnswer(List<List>selectedAnswer,id,context) async {
    DioHelper.postData(url:'student/exams/$id',
        token: tokenStudent!,
      query: {
      for(int i=0;i<selectedAnswer.length;i++)
        for(int j=0;j<2;j++)
          'answers[$i][$j]':selectedAnswer[i][j]
      }
    ).then((value) async{
      print(value.data);
    }).catchError(( e){
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Error Occurred!!',
      );
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
      DioHelper.getData(url: 'student/absence',token: tokenStudent!).then((value) {
        absence = Absence.fromJson(value.data);
        emit(SuccessAbsence());
      }).catchError((e) {
        print(e.toString());
        emit(ErrorAbsence());
      });
    }

    Cources?cources;
    CourseClassResponse?courseClassResponse;
    Future<void> getCourcesClass() async {
    emit(LoadingCourcesClassState());
    DioHelper.getData(url: 'student/courses?for=class',token: tokenStudent!).then((value) {
      courseClassResponse = CourseClassResponse.fromJson(value.data);
      emit(SuccessCourcesClassState());
    }).catchError((e) {
      print(e);
      emit(ErrorCourcesClassState());
    });
  }

    Future<void> getCources() async {
      emit(LoadingCourcesForState());
      DioHelper.getData(url: 'student/courses?for=all',token: tokenStudent!).then((value) {
        cources = Cources.fromJson(value.data);
        emit(SuccessCourcesForState());
      }).catchError((e) {
        print(e.toString());
        emit(ErrorCourcesForState());
      });
    }

    Vidoes? videos;
    Future<void> getVideos(id) async {
      emit(LoadingGetVideos());
      DioHelper.getData(url: 'student/courses/$id',token: tokenStudent!).then((value) {
        print(value.data);
        videos = Vidoes.fromJson(value.data);
        emit(SuccessGetVideos());
      }).catchError((e) {
        print(e.toString());
        emit(ErrorGetVideos());
      });
    }

    Books ?books;
    Future<void> getBooks() async {
      emit(LoadingBooks());
      DioHelper.getData(url: 'student/books',token: tokenStudent!).then((value) {
        books = Books.fromJson(value.data);
        print(books!.books);
        print(value.data);
        emit(SuccessBooks());
      }).catchError((e) {
        print(e.toString());
        emit(ErrorBooks());
      });

    }

    Future<void> rateBooks({int ?book_id,int?rate}) async {
      emit(LoadingRatingBooks());
      DioHelper.postData(url: 'student/books?book_id=$book_id&rate=$rate',token: tokenStudent!).then((value) {
        print(value.data);
        emit(SuccessRatingBooks());
      }).catchError((e) {
        print(e.toString());
        emit(ErrorRatingBooks());
      });

    }

    Future<void> rateVideos({int ?video_id,int?rate,context}) async {
      emit(LoadingRatingVideo());
      DioHelper.postData(url: 'student/videos?video_id=$video_id&rate=$rate',token: tokenStudent!).then((value) {
        print(value.data);
        emit(SuccessRatingVideo());
      });

    }

     GetProfileModel? profileData;
     Future<GetProfileModel> GetProfileForAnyType({required type,required token}) async {
       print(tokenStudent);
    emit(LoadingGetProfileState());
   await DioHelper.getData(
        url: 'profile/$type',
        token: token!
    ).then((value) {
     profileData=GetProfileModel.fromJson(value.data);
      emit(SuccessGetProfileState());
      print(profileData!.profile![0].name);
    }).catchError((error) {
      print('error get profilr $error');
      emit(ErrorGetProfileState());
    });
   return profileData!;
  }

      StudentResult? studentResult;
       Future<void> getStudentResult() async {
    emit(LoadingGetResultState());
    DioHelper.getData(url: 'student/results',token: tokenStudent!).then((value) {
      studentResult = StudentResult.fromJson(value.data);
      emit(SuccessGetResultState());
      print(studentResult!.results[0].name);
    }).catchError((e) {
      print(e.toString());
      emit(ErrorGetResultState());
    });
  }


  String dropdownCourse='All';
  String dropdownExam='Subjects Exam';
    bool isAllCourses=true;
    bool isSubjectsExam=true;
    bool isSuccessExam=false;
    bool isfaildExam=false;

    void refreshExam(int l){
      if(l !=0) emit(SuccessGetSubject());
      else emit(RefrechState());
    }
}

