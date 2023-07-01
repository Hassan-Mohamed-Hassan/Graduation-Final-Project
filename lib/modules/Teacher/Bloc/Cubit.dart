
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled15/Models/Teacher/AddAnswerModel.dart';
import 'package:untitled15/Models/Teacher/AddBookModel.dart';
import 'package:untitled15/Models/Teacher/AddExamModel.dart';
import 'package:untitled15/Models/Teacher/AddQuestionModel.dart';
import 'package:untitled15/Models/Teacher/GetBookModel.dart';
import 'package:untitled15/Models/Teacher/GetExamsModel.dart';
import 'package:untitled15/Models/Teacher/ShowExamModel.dart';
import 'package:untitled15/network/Remote/diohelper.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/Teacher/Bloc/States.dart';
import 'package:video_player/video_player.dart';

import '../../../Models/GetProfileModel.dart';
import '../../../Models/Teacher/AddCourseModel.dart';
import '../../../Models/Teacher/GetAbsenceTeacherTOStudentModel.dart';
import '../../../Models/Teacher/GetCourseByIdModel.dart';
import '../../../Models/Teacher/GetCourseModel.dart';
class CubitTeacher extends Cubit<TeacherStates>{
  CubitTeacher():super(initialTeacherState());
  static CubitTeacher get(context)=>BlocProvider.of(context);
  String? available;
  String? availableCourse;

  String? choose;

  late VideoPlayerController controller;
  void ChangeVideoPlayer(url){
    controller=VideoPlayerController.network('http://192.168.43.200:8000/storage/files/teacherUploads/$url')..initialize().then((value) {
      emit(VideoPlayerControllerState());

    });
  }



  GetExamsModel? getExams;
  void GetExams(){
    emit(GetExamLoadingState());
    DioHelper.getData(
      url: 'teacher/exams',
      token: tokenTeacher!

      ,
    ).then((value) {
      getExams=GetExamsModel.fromJson(value.data);
      emit(GetExamSucessState());
    }).catchError((error){
      print('error Get Exams $error');
      emit(GetExamErrorState());
    });

  }

  GetShowModel? show;
void ShowExam({
  required int id,
}){
  emit(ShowExamLoadingState());
  DioHelper.getData(
      url: 'teacher/exams/$id',
    token: tokenTeacher!

,
  ).then((value) {
    print('success');
    show=GetShowModel.fromJson(value.data);
    emit(ShowExamSucessState(show!));
    print(show!.status);
  }).catchError((error){
    print('error show $error');
    emit(ShowExamErrorState());
  });
}

  AddExamModel? addExam;
  void AddExam({
  required String name,
    required int degree,
    required String available,
    List? roomClass
}){
    emit(AddExamLoadingState());
    DioHelper.postData(
        url: 'teacher/exams',
        token: tokenTeacher!,

        query: {
          'name':name,
          'degree':degree,
          'for':available,
          //'roomsChoosen':roomClass

        }
    ).then((value) {
      addExam=AddExamModel.fromJson(value.data);
       print(addExam!.message);
      emit(AddExamSucessState(addExam!));
      GetExams();
    }).catchError((error){
      print('error add Exam $error');
      emit(AddExamErrorState());
    });
  }
  void DeleteExam({
  required int id
}){
    emit(DeleteExamLoadingState());
    DioHelper.DeleteData(
        url: 'teacher/exams/$id',
      token: tokenTeacher!
    ).then((value) {
      emit(DeleteExamSuccessState());
      GetExams();

    }).catchError((error){
      print('error delete exam $error');
      emit(DeleteExamErrorState());

    });
  }
  AddQuestionModel? addQuestion;
  void AddQuestion({
  required int examId,
    required String question
}){
    AddQuestionLoadingState();
    DioHelper.postData(
        url: 'teacher/questions',
      token: tokenTeacher!,
      query: {
       'exam_id':examId,
        'question':question
      }
    ).then((value) {
      addQuestion=AddQuestionModel.fromJson(value.data);
      AddQuestionSucessState(addQuestion!);
      ShowExam(id: examId);
      print(addQuestion!.message);

    }).catchError((error){
      print('error add Question $error');
      AddQuestionErrorState();
    });
  }
  void DeleteQuestion({
  required int id,
    int ? idexam
}){
    emit(DeleteQuestionLoadingState());
    DioHelper.DeleteData(
        url: 'teacher/questions/$id',
      token: tokenTeacher!,

    ).then((value) {
      emit(DeleteQuestionSucessState());
      ShowExam(id: idexam!);
    }).catchError((error){
      print('error delete question $error');
      emit(DeleteQuestionErrorState());
    });
  }
  AddAnswerModel? addAnswer;
  void AddAnswer({
    required int questionId,
    required int examId,
    required String answer
  }){
    AddAnswerLoadingState();
    DioHelper.postData(
        url: 'teacher/answers',
        token: tokenTeacher!,
        query: {
          'exam_id':examId,
          'answer':answer,
          'question_id':questionId
        }
    ).then((value) {
      addAnswer=AddAnswerModel.fromJson(value.data);
      AddAnswerSucessState(addAnswer!);
      print(addAnswer!.message);
      ShowExam(id: examId);

    }).catchError((error){
      print('error add Answer $error');
      AddAnswerErrorState();
    });
  }
  int ? select;
  ChangeSelect(value){
    select=value;
    emit(SelectValueState());
    //SelectAnswer(answerId: value);
  }
  void SelectAnswer({
  required int answerId,
    required int questionId,
    required int examId,

  }){
    emit(SelectAnswerLoadingState());
    DioHelper.PutData(
        url: 'teacher/answers',
        token: tokenTeacher!,
        query: {
         'answer_id':answerId,
          'exam_id':examId,
          'question_id':questionId
        }
    ).then((value) {
      emit(SelectAnswerSuccessState());
      print('Select Answer Successful');
    }).catchError((error){
      emit(SelectAnswerErrorState());
    });
  }
  File? imageData;
  Future<void> getImage()async{
    final ImagePicker picker=ImagePicker();
    XFile? image =await picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      var selected=File(image.path);
      emit(ImageState());
      imageData=selected;
      print(imageData!.path);
      print(imageData!.absolute);
      print('yes');
    }else{
      print('No');
    }
  }
  File? filePdf;
  void GetFile()async {
    FilePickerResult? result=await FilePicker.platform.pickFiles(
      type:FileType.any
    );
    if(result !=null){
      filePdf=File(result.files.single.path ?? "");
      emit(FileState());
    }
  }

  File? VideoData;
  final picker=ImagePicker();
  late VideoPlayerController player;
  getVideo()async{
    final Video=await picker.getVideo(source: ImageSource.gallery);
    VideoData=File(Video!.path);
    player=VideoPlayerController.file(VideoData!)..initialize().then((value) {
      emit(VideoState());
      player.play();
    });

  }


  GetCourseModel? getCourseModel;

  Future<void> GetCourse()async{
    emit(GetCourseLoadingState());
    await DioHelper.getData(
        url: 'teacher/courses',
        token: tokenTeacher!,
  ).then((value) {
      getCourseModel=GetCourseModel.fromJson(value.data);
      print(getCourseModel!.status);
      emit(GetCourseSuccessState());
    }).catchError((error){
      emit(GetCourseErrorState());
    });
  }
  AddCourseModel? addCourseModel;
  AddVideo({
 required   String name,
  id,
    required File videoFile
  }
      ) async {
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(videoFile.openRead()));
    // get file length
    var length = await videoFile.length();

    // string to uri
    var uri = Uri.parse("http://192.168.43.200:8000/api/teacher/videos");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('video', stream, length,
        filename: basename(videoFile.path));

    // add file to multipart
    request.headers.addAll({
      'Content-Type':'multipart/form-data',

      'Authorization':'Bearer $tokenTeacher',
    });
    request.files.add(multipartFile);
    request.fields['name']=name.toString();
    request.fields['course_id']=id.toString();


    // send
    var response = await request.send();
    print(response.statusCode);
    emit(AddVideoCourseSuccessState());
    GetCourse();

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);

    });
  }
  AddCourse({
    String? name,
    String? desc,
    String? available,
    required File imageFile
  }
      ) async {
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://192.168.43.200:8000/api/teacher/courses");
    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    // multipart that takes file
    var multipartFile = new http.MultipartFile('image', stream, length,
        filename: basename(imageFile.path));
    // add file to multipart
    request.headers.addAll({
      'Content-Type':'multipart/form-data',
      'Authorization':'Bearer $tokenTeacher',
    });
    request.files.add(multipartFile);
    request.fields['name']=name.toString();
    request.fields['description']=desc.toString();
    request.fields['forWhich']=available.toString();
    request.fields['roomsChoosen']=[1,2].toString();
    // send
    var response = await request.send();
    print(response.statusCode);
    await GetCourse();
    emit(AddCourseSuccessState());
    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);

    });
  }
  AddBookModel? addBookModel;

  AddBook({
    required String name,
    required File image,
    required File book
  }
      ) async {
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(book.openRead()));
    var stream2 = new http.ByteStream(DelegatingStream.typed(image.openRead()));

    // get file length
    var length = await book.length();
    var length2 = await image.length();


    // string to uri
    var uri = Uri.parse("http://192.168.43.200:8000/api/teacher/books");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('book', stream, length,
        filename: basename(book.path));
    var multipartFile2 = new http.MultipartFile('image', stream2, length2,
        filename: basename(image.path));

    // add file to multipart
    request.headers.addAll({
      'Content-Type':'multipart/form-data',

      'Authorization':'Bearer $tokenTeacher',
    });
    request.files.add(multipartFile);
    request.files.add(multipartFile2);
    request.fields['name']=name.toString();


    // send
    var response = await request.send();
    print(response.statusCode);
    emit(AddBookSuccessState());
    GetBook();

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);

    });
  }
void DeleteCourse({
  required int id
}){
    emit(DeleteCourseLoadingState());
    DioHelper.DeleteData(
        url: 'teacher/courses/$id',
      token: tokenTeacher!
    ).then((value){
      emit(DeleteCourseSuccessState());
      GetCourse();
    }).catchError((error){
      print('error delete Course ${error.toString()}');
      emit(DeleteCourseErrorState());
    });
}
GetCourseByIDModel? courseByIDModel;
  void  GetCourseID({
  required int id
}){
    emit(GetCourseByIdLoadingState());
    DioHelper.getData(
        url: 'teacher/courses/$id',
      token: tokenTeacher!
    ).then((value) {
      courseByIDModel=GetCourseByIDModel.fromJson(value.data);
      emit(GetCourseByIdSuccessState());

    }).catchError((error){
      print('error get course by id $error');
      emit(GetCourseByIdErrorState());

    });
  }

 //Books
GetBookModel? getBookModel;
void GetBook(){
  emit(GetBookLoadingState());
   DioHelper.getData(
       url: 'teacher/books',
     token: tokenTeacher!,
   ).then((value) {
     getBookModel=GetBookModel.fromJson(value.data);
     emit(GetBookSuccessState());
     print(getBookModel!.status);
   }).catchError((error){
     print('error get book $error');
     emit(GetBookErrorState());
   });
   AddCourseModel? addCourseModel;
}


void DeleteBook({
  required int id
}){
  emit(DeleteBookLoadingState());
  DioHelper.DeleteData(
      url: 'teacher/books/$id',
    token: tokenTeacher!
  ).then((value) {
    emit(DeleteBookSuccessState());
     GetBook();
  }).catchError((error){
    print('error delete book $error');
    emit(DeleteBookErrorState());

  });
}

//Absence
  GetAbsenceTeacherTOStudentModel? getAbsenceTeacherTOStudentModel;
void GetAbsence(){
  emit(GetAbsenceTeacherLoadingState());
  DioHelper.getData(
      url: 'teacher/absence',
    token: tokenTeacher!

  ).then((value) {
    emit(GetAbsenceTeacherSuccessState());

    getAbsenceTeacherTOStudentModel=GetAbsenceTeacherTOStudentModel.fromJson(value.data);
  }).catchError((error){
    print('error $error');
    emit(GetAbsenceTeacherErrorState());

  });
}
  List listAbsence=[];
void AddAbsence({
  required int id
}){
  emit(AddAbsenceTeacherLoadingState());
  DioHelper.postData(
      url: 'teacher/absence',
          token: tokenTeacher!,
    query: {
        'room_id':id,
      for(int i=0;i<listAbsence.length;i++)
        'students[]':listAbsence[i]
    }
  ).then((value) {
    emit(AddAbsenceTeacherSuccessState());


  }).catchError((error){
    emit(AddAbsenceTeacherErrorState());

  });
}
//profile

  GetProfileModel? getProfileModel;

 GetProfile() {
    emit(GetProfileTeacherLoadingState());
    DioHelper.getData(
        url: 'profile/teacher',
        token: tokenTeacher!
    ).then((value) {
      getProfileModel=GetProfileModel.fromJson(value.data);
      emit(GetProfileTeacherSuccessState());
    }).catchError((error) {
      print('error get profilr $error');
      emit(GetProfileTeacherErrorState());
    });
  }

}
