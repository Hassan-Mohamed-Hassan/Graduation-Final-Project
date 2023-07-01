import 'package:untitled15/Models/Teacher/AddBookModel.dart';
import 'package:untitled15/Models/Teacher/AddExamModel.dart';
import 'package:untitled15/Models/Teacher/AddQuestionModel.dart';
import 'package:untitled15/Models/Teacher/ShowExamModel.dart';

import '../../../Models/Teacher/AddAnswerModel.dart';
import '../../../Models/Teacher/AddCourseModel.dart';

abstract class TeacherStates {}
class initialTeacherState extends TeacherStates{}
class VideoPlayerControllerState extends TeacherStates{}
class VideoState extends TeacherStates{}
class FileState extends TeacherStates{}



// Exam

class GetExamLoadingState extends TeacherStates{}
class GetExamSucessState extends TeacherStates{}
class GetExamErrorState extends TeacherStates{}

class ShowExamLoadingState extends TeacherStates{}
class ShowExamSucessState extends TeacherStates{
  final GetShowModel model;
  ShowExamSucessState(this.model);
}
class ShowExamErrorState extends TeacherStates{}


class AddExamLoadingState extends TeacherStates{}
class AddExamSucessState extends TeacherStates{
  final AddExamModel model;
  AddExamSucessState(this.model);
}
class AddExamErrorState extends TeacherStates{}


class DeleteExamLoadingState extends TeacherStates{}
class DeleteExamSuccessState extends TeacherStates{}
class DeleteExamErrorState extends TeacherStates{}

//Question

class AddQuestionLoadingState extends TeacherStates{}
class AddQuestionSucessState extends TeacherStates{
  final AddQuestionModel model;
  AddQuestionSucessState(this.model);
}
class AddQuestionErrorState extends TeacherStates{}

class DeleteQuestionLoadingState extends TeacherStates{}
class DeleteQuestionSucessState extends TeacherStates{

}
class DeleteQuestionErrorState extends TeacherStates{}

//Answer


class AddAnswerLoadingState extends TeacherStates{}
class  AddAnswerSucessState extends TeacherStates{
  final AddAnswerModel model;
  AddAnswerSucessState(this.model);
}
class  AddAnswerErrorState extends TeacherStates{}

class SelectValueState extends TeacherStates{}

class SelectAnswerLoadingState extends TeacherStates{}
class SelectAnswerSuccessState extends TeacherStates{}
class SelectAnswerErrorState extends TeacherStates{}

// Courses


class ImageState extends TeacherStates{}

class GetCourseLoadingState extends TeacherStates{}
class GetCourseSuccessState extends TeacherStates{}
class GetCourseErrorState extends TeacherStates{}

class GetCourseByIdLoadingState extends TeacherStates{}
class GetCourseByIdSuccessState extends TeacherStates{}
class GetCourseByIdErrorState extends TeacherStates{}

class AddCourseLoadingState extends TeacherStates{}
class AddCourseSuccessState extends TeacherStates{
  //final AddCourseModel model;
  //AddCourseSuccessState(this.model);

}
class AddCourseErrorState extends TeacherStates{}

class AddVideoCourseLoadingState extends TeacherStates{}
class AddVideoCourseSuccessState extends TeacherStates{
}
class AddVideoCourseErrorState extends TeacherStates{}

class DeleteCourseLoadingState extends TeacherStates{}
class DeleteCourseSuccessState extends TeacherStates{

}
class DeleteCourseErrorState extends TeacherStates{}
// Books

class GetBookLoadingState extends TeacherStates{}
class GetBookSuccessState extends TeacherStates{}
class GetBookErrorState extends TeacherStates{}

class AddBookLoadingState extends TeacherStates{}
class AddBookSuccessState extends TeacherStates{
  //final AddBookModel model;
  //AddBookSuccessState(this.model);
}
class AddBookErrorState extends TeacherStates{}

class DeleteBookLoadingState extends TeacherStates{}
class DeleteBookSuccessState extends TeacherStates{
}
class DeleteBookErrorState extends TeacherStates{}

//Absence

class GetAbsenceTeacherLoadingState extends TeacherStates{}
class GetAbsenceTeacherSuccessState extends TeacherStates{}
class GetAbsenceTeacherErrorState extends TeacherStates{}

class AddAbsenceTeacherLoadingState extends TeacherStates{}
class AddAbsenceTeacherSuccessState extends TeacherStates{}
class AddAbsenceTeacherErrorState extends TeacherStates{}


//profile

class GetProfileTeacherLoadingState extends TeacherStates{}
class GetProfileTeacherSuccessState extends TeacherStates{}
class GetProfileTeacherErrorState extends TeacherStates{}

