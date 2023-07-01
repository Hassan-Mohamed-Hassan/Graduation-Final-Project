import 'package:untitled15/Models/AddScheduleModel.dart';
import 'package:untitled15/Models/AddTeacherModel.dart';
import 'package:untitled15/Models/DeleteSubjectModel.dart';
import 'package:untitled15/Models/GetScheduleModel.dart';
import 'package:untitled15/Models/GetTeacherModel.dart';
import 'package:untitled15/Models/SchoolSubject.dart';

import '../../../Models/AddClassModel.dart';
import '../../../Models/AddStudentToSchoolModel.dart';
import '../../../Models/AddSubjectModel.dart';
import '../../../Models/GetClassModel.dart';
import '../../../Models/GetRoomModel.dart';
import '../../../Models/GetStudentSchoolModel.dart';

abstract class SchoolStates {}
class initialSchoolState extends SchoolStates{}
class ChangeContainerSchoolState extends SchoolStates{}
class changeItemOneSchoolState extends SchoolStates{}
class changeItemTwoSchoolState extends SchoolStates{}
class ff extends SchoolStates{}
class ChangeRoomIdState extends SchoolStates{}

// Subject

class GetSubjectSucessState extends SchoolStates{}
class GetSubjectErrorState extends SchoolStates{}
class GetSubjectLoadingState extends SchoolStates{}
class AddSubjectSucessState extends SchoolStates{
  final AddSubjectModel model;
  AddSubjectSucessState( this.model);
}
class AddSubjectErrorState extends SchoolStates{}
class AddSubjectLoadingState extends SchoolStates{}
class AddSubjectNumberState extends SchoolStates{}
class AddClassNumberState extends SchoolStates{}

class DeleteSubjectErrorState extends SchoolStates{}
class DeleteSubjectLoadingState extends SchoolStates{}
class DeleteSubjectSucessState extends SchoolStates{
  final DeleteSubjectModel model;
  DeleteSubjectSucessState(this.model);
}

//Class

class GetClassLoadingState extends SchoolStates{}
class GetClassSucessState extends SchoolStates{
 final GetClassModel model;
 GetClassSucessState(this.model);

}
class GetClassErrorfState extends SchoolStates{}

class AddClassLoadingState extends SchoolStates{}
class AddClassSucessState extends SchoolStates{
  final AddClassModel model;
  AddClassSucessState(this.model);

}
class AddClassErrorState extends SchoolStates{}

class DeleteClassLoadingState extends SchoolStates{}
class DeleteClassSucessState extends SchoolStates{


}
class DeleteClassErrorState extends SchoolStates{}

//Room

class GetRoomLoadingState extends SchoolStates{}
class GetRoomSucessState extends SchoolStates{
  final GetRoomModel model;
  GetRoomSucessState(this.model);
}
class GetRoomErrorfState extends SchoolStates{}

class AddRoomLoadingState extends SchoolStates{}
class AddRoomSucessState extends SchoolStates{
  final GetRoomModel model;
  AddRoomSucessState(this.model);

}
class AddRoomErrorfState extends SchoolStates{}

class DeleteRoomLoadingState extends SchoolStates{}
class DeleteRoomSucessState extends SchoolStates{
  final DeleteSubjectModel model;
  DeleteRoomSucessState(this.model);

}
class DeleteRoomErrorState extends SchoolStates{}

//Student School

class GetStudentRoomLoadingState extends SchoolStates{}
class GetStudentRoomSucessState extends SchoolStates{
  final GetStudentSchoolModel model;
  GetStudentRoomSucessState(this.model);

}
class GetStudentRoomErrorState extends SchoolStates{}

class AddStudentRoomLoadingState extends SchoolStates{}
class AddStudentRoomSucessState extends SchoolStates{
  final GetAddStudentToRoomModel model;
 // final GetStudentSchoolModel model;
  AddStudentRoomSucessState(this.model);

}
class AddStudentRoomErrorState extends SchoolStates{}

class DeleteStudentRoomLoadingState extends SchoolStates{}
class DeleteStudentRoomSucessState extends SchoolStates{
  final DeleteSubjectModel model;
  DeleteStudentRoomSucessState(this.model);

}
class DeleteStudentRoomErrorState extends SchoolStates{}

//Teacher

class GetTeacherLoadingState extends SchoolStates{}
class GetTeacherSucessState extends SchoolStates{
  final GetTeacherModel model;
  GetTeacherSucessState(this.model);

}
class GetTeacherErrorState extends SchoolStates{}

class AddTeacherLoadingState extends SchoolStates{}
class AddTeacherSucessState extends SchoolStates{
  final AddTeacherModel model;
  AddTeacherSucessState(this.model);

}
class AddTeacherErrorState extends SchoolStates{}

class DeleteTeacherLoadingState extends SchoolStates{}
class DeleteTeacherSucessState extends SchoolStates{}
class DeleteTeacherErrorState extends SchoolStates{}

class TeacherSubjectNewState extends SchoolStates{}

//Schedule

class GetScheduleLoadingState extends SchoolStates{}
class GetScheduleSuccessState extends SchoolStates{
  final GetscheduleModel model;
  GetScheduleSuccessState(this.model);
}
class GetScheduleErrorState extends SchoolStates{}

class AddScheduleLoadingState extends SchoolStates{}
class AddScheduleSuccessState extends SchoolStates{
  final AddScheduleModel model;
  AddScheduleSuccessState(this.model);
}
class AddScheduleErrorState extends SchoolStates{}

class AddLessonScheduleLoadingState extends SchoolStates{}
class AddLessonScheduleSuccessState extends SchoolStates{}
class AddLessonScheduleErrorState extends SchoolStates{}

class TeacherLessonSubjectNewState extends SchoolStates{}

//Absence
class GetAbsenceLoadingState extends SchoolStates{}
class GetAbsenceSuccessState extends SchoolStates{}
class GetAbsenceErrorState extends SchoolStates{}

class AbsenceLoadingState extends SchoolStates{}
class AbsenceSuccessState extends SchoolStates{}
class AbsenceErrorState extends SchoolStates{}

//profile

class GetProfileSchoolLoadingState extends SchoolStates{}
class GetProfileSchoolSuccessState extends SchoolStates{}
class GetProfileSchoolErrorState extends SchoolStates{}
//
class AddStudentToSchoolLoadingState extends SchoolStates{}
class AddStudentToSchoolSuccessState extends SchoolStates{}
class AddStudentToSchoolErrorState extends SchoolStates{}

//Result


class GetResultSchoolLoadingState extends SchoolStates{}
class GetResultSchoolSuccessState extends SchoolStates{}
class GetResultSchoolErrorState extends SchoolStates{}

class GetAnnouncedLoadingState extends SchoolStates{}
class GetAnnouncedSuccessState extends SchoolStates{}
class GetAnnouncedErrorState extends SchoolStates{}

class GetNotAnnouncedLoadingState extends SchoolStates{}
class GetNotAnnouncedSuccessState extends SchoolStates{}
class GetNotAnnouncedErrorState extends SchoolStates{}