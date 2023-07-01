
import 'package:bloc/bloc.dart';
import 'package:untitled15/Models/AddStudentToSchoolModel.dart';
import 'package:untitled15/Models/GetAbsenceSchoolTOTeacherModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/Models/AddScheduleModel.dart';
import 'package:untitled15/Models/GetClassModel.dart';
import 'package:untitled15/Models/DeleteSubjectModel.dart';
import 'package:untitled15/Models/GetRoomModel.dart';
import 'package:untitled15/Models/GetStudentSchoolModel.dart';
import 'package:untitled15/Models/GetTeacherModel.dart';
import 'package:untitled15/Models/SchoolSubject.dart';
import 'package:untitled15/network/Remote/diohelper.dart';
import 'package:untitled15/constants/constants.dart';
import '../../../Models/AddClassModel.dart';
import '../../../Models/AddSubjectModel.dart';
import '../../../Models/AddTeacherModel.dart';
import '../../../Models/GetAnnouncedModel.dart';
import '../../../Models/GetNotAnnouncedModel.dart';
import '../../../Models/GetProfileModel.dart';
import '../../../Models/GetScheduleModel.dart';
import 'States.dart';

class SchoolCubit extends Cubit<SchoolStates>{
  SchoolCubit():super(initialSchoolState());
  static SchoolCubit get(context)=>BlocProvider.of(context);
  bool value=false;
  void ChangeContainer(){
    value=!value;
    emit(ChangeContainerSchoolState());
  }

  List<int> list=[
  ];
  void ChangeItem(int id){
    list.add(id);
    emit(ChangeContainerSchoolState());

  }


SchoolSubjectModel? subject;
  List<dynamic> listNewSub=[];
  void GetSubject(){
    emit(GetSubjectLoadingState());
    DioHelper.getData(
        url: 'school/subject',
      token: tokenSchool!
    ).then((value) {
      print('Get Subject');
      //int b=;
      subject=SchoolSubjectModel.fromJson(value.data);

      print('sucess');
      emit(GetSubjectSucessState());


     for(int i=0;i< subject!.existsSubjects!.length;i++){
      listNewSub.add(
        {
          "id":'${subject!.existsSubjects![i].id}',
          "name": '${subject!.existsSubjects![i].subject!.name}',

        }
      );

      print(listNewSub[i]);

     }
      print(listNewSub.length);



    }).catchError((error){
      print('subject error $error');
      emit(GetSubjectErrorState());
    });
  }
  AddSubjectModel? addSubject;

  void AddSubject(
  {
  required int SubjectId
}
      ){
    emit(AddSubjectLoadingState());
    DioHelper.postData(
        url: 'school/subject',
      token: tokenSchool!
      //  token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjgyNTgzMzkzLCJleHAiOjIwNDI1ODMzOTMsIm5iZiI6MTY4MjU4MzM5MywianRpIjoidW9lZTNWOWRLOW5vQW1DMyIsInN1YiI6IjgiLCJwcnYiOiJiYjAwNjNhYTQyMjI4NjY2NTNmNDExZWQ0NzI1OWMxNTk3M2IzNGRiIn0.VntXqhZUjUjmEtTn5tMsCEfLxDDjFT7IIPKBpOmzNlk'

,
    query: {

    'subject_id':SubjectId,


    }


    ).then((value) {
      print('sucess');

      addSubject=AddSubjectModel.fromJson(value.data);
      print(addSubject!.message);
      emit(AddSubjectSucessState(addSubject!));
      GetSubject();
    }).catchError((error){
      print('Add subject error $error');
      emit(AddSubjectErrorState());
    });
  }
  String? numberSubject;
  void AddNumberSubject(value){
    numberSubject=value;
    emit(AddSubjectNumberState());
  }
  String? numberClass;
  void AddNumberClass(value){
    numberClass=value;
    emit(AddSubjectNumberState());
  }
  DeleteSubjectModel? delete;
  void DeleteSubject(
  {
  required int id
}
      ){
    emit(DeleteSubjectLoadingState());
    DioHelper.DeleteData(
        url:'school/subject/$id',
      token: tokenSchool!
      //token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjgyNTgzMzkzLCJleHAiOjIwNDI1ODMzOTMsIm5iZiI6MTY4MjU4MzM5MywianRpIjoidW9lZTNWOWRLOW5vQW1DMyIsInN1YiI6IjgiLCJwcnYiOiJiYjAwNjNhYTQyMjI4NjY2NTNmNDExZWQ0NzI1OWMxNTk3M2IzNGRiIn0.VntXqhZUjUjmEtTn5tMsCEfLxDDjFT7IIPKBpOmzNlk'

    ).then((value) {
      delete=DeleteSubjectModel.fromJson(value.data);
      emit(DeleteSubjectSucessState(delete!));
      GetSubject();
      print(delete!.message);
    }).catchError((error){
      print('delete error $error');
      emit(DeleteSubjectErrorState());
    });
  }
  GetClassModel? classModel;
  List<dynamic> listNewclass=[];

  void GetClass(){
    emit(GetClassLoadingState());
    DioHelper.getData(
        url: 'school/class',
         token: tokenSchool!
    ).then((value) {
      print('jjkjkelwqlwla');
      classModel=GetClassModel.fromJson(value.data);
      emit(GetClassSucessState(classModel!));
      for(int i=0;i<classModel!.classes!.length;i++){
        listNewclass.add(
          {
           "id":"${classModel!.classes![i].id}" ,
            "name":"${classModel!.classes![i].itsClass!.name}"
          }
        );
      }

    })
        .catchError((error){
          print('Get Class error $error');
          emit(GetClassErrorfState());
    });
  }
  AddClassModel? addClass;
  void AddClass({
  required int idClass
}){
    emit(AddClassLoadingState());
    DioHelper.postData(
        url: 'school/class',
        token: tokenSchool!,
        query: {
          'class_id':idClass
        }
    ).then((value) {
      addClass=AddClassModel.fromJson(value.data);
      emit(AddClassSucessState(addClass!));
      GetClass();

    }).catchError((error){
      print('error add class $error');
    });
  }
  void DeleteClass({
  required int id
}){
    emit(DeleteClassLoadingState());
    DioHelper.DeleteData(
        url: 'school/class/$id',
      token: tokenSchool!
    ).
    then((value) {
      emit(DeleteClassSucessState());
      GetClass();
    }).
    catchError((error){
      print(' error delete class $error');
      emit(DeleteClassErrorState());
    });
  }
  String? roomId;

  List<dynamic> listRoom=[];
  GetRoomModel? roomModel;
  void GetRoom(){
    emit(GetRoomLoadingState());
    DioHelper.getData(
        url: 'school/room',
       token: tokenSchool!
       // token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjgyNTgzMzkzLCJleHAiOjIwNDI1ODMzOTMsIm5iZiI6MTY4MjU4MzM5MywianRpIjoidW9lZTNWOWRLOW5vQW1DMyIsInN1YiI6IjgiLCJwcnYiOiJiYjAwNjNhYTQyMjI4NjY2NTNmNDExZWQ0NzI1OWMxNTk3M2IzNGRiIn0.VntXqhZUjUjmEtTn5tMsCEfLxDDjFT7IIPKBpOmzNlk'


    ).then((value) {
      roomModel=GetRoomModel.fromJson(value.data);
      print('sucess');
      emit(GetRoomSucessState(roomModel!));
      for(int i=0;i< roomModel!.rooms!.length;i++) {
        listRoom.add(
            {
              "id": '${roomModel!.rooms![i].id}',
              "name": '${roomModel!.rooms![i].name}',

            }
        );
      }
    }).catchError((error){
      print('Room error $error');
      emit(GetRoomErrorfState());
    });
  }
  GetRoomModel? Addroom;

  void  AddRoom({
    required String? name,
    required int? class_id
  }
      ){
    emit(AddRoomLoadingState());
    DioHelper.postData(
        url: 'school/room',
        token: tokenSchool!
        //token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjgyNTgzMzkzLCJleHAiOjIwNDI1ODMzOTMsIm5iZiI6MTY4MjU4MzM5MywianRpIjoidW9lZTNWOWRLOW5vQW1DMyIsInN1YiI6IjgiLCJwcnYiOiJiYjAwNjNhYTQyMjI4NjY2NTNmNDExZWQ0NzI1OWMxNTk3M2IzNGRiIn0.VntXqhZUjUjmEtTn5tMsCEfLxDDjFT7IIPKBpOmzNlk'
,
    query: {
         'name':name,
          'class_id':class_id
        }
    ).then((value) {
      Addroom=GetRoomModel.fromJson(value.data);
      print('sucess');
      emit(AddRoomSucessState(Addroom!));
      GetRoom();
    }).catchError((error){
      print('Add room error $error');
      emit(AddRoomErrorfState());
    });
  }
  void DeleteRoom(
      {
        required int id
      }
      ){
    emit(DeleteRoomLoadingState());
    DioHelper.DeleteData(
        url:'school/room/$id',
      token: tokenSchool!
      //  token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjgyNTgzMzkzLCJleHAiOjIwNDI1ODMzOTMsIm5iZiI6MTY4MjU4MzM5MywianRpIjoidW9lZTNWOWRLOW5vQW1DMyIsInN1YiI6IjgiLCJwcnYiOiJiYjAwNjNhYTQyMjI4NjY2NTNmNDExZWQ0NzI1OWMxNTk3M2IzNGRiIn0.VntXqhZUjUjmEtTn5tMsCEfLxDDjFT7IIPKBpOmzNlk'

    ).then((value) {
      delete=DeleteSubjectModel.fromJson(value.data);
      emit(DeleteRoomSucessState(delete!));
      GetRoom();
      print(delete!.message);
    }).catchError((error){
      print('delete error $error');
      emit(DeleteRoomErrorState());
    });
  }
  GetStudentSchoolModel? student;
  List<dynamic> listStudent=[];
  void GetStudent({
  required int id,
}){
    emit(GetStudentRoomLoadingState());
    DioHelper.getData(
        url: 'school/students/$id',
        token: tokenSchool!


    ).then((value) {
      student=GetStudentSchoolModel.fromJson(value.data);
      emit(GetStudentRoomSucessState(student!));
      print(student!.status);
     // print(student!.students![0].name);
      listStudent.add(
          {
            "id":"${student!.students![0].details![0].id}" ,
            "name":"${student!.students![0].details![0].name}"
          }
      );
      print('Successful ');


    }).catchError((error){
      print(' get student error $error');
      emit(GetStudentRoomErrorState());
    });
  }
  GetAddStudentToRoomModel? addstudent;
  void AddStudent({
  required String email,
    required int  roomId
}){
    emit(AddStudentRoomLoadingState());
    DioHelper.postData(
        url: 'school/students',
        token: tokenSchool!,
        query: {
          'email':email,
          'room_id':roomId
    }
    ).then((value) {
      addstudent=GetAddStudentToRoomModel.fromJson(value.data);
      //addstudent=GetStudentSchoolModel.fromJson(value.data);
      print('jhs');
     // print('add ${addstudent!.status}');
      emit(AddStudentRoomSucessState(addstudent!));
      GetStudent(id: roomId);
    }).catchError((error){
      print('add error $error');
      emit(AddStudentRoomErrorState());
    });
  }
  DeleteSubjectModel? deletestudent;
  void DeleteStudent(
      {
        required int id,
        int? idroom
      }
      ){
    emit(DeleteStudentRoomLoadingState());
    DioHelper.DeleteData(
        url:'school/students/$id',
       token: tokenSchool!
       // token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjgyNTgzMzkzLCJleHAiOjIwNDI1ODMzOTMsIm5iZiI6MTY4MjU4MzM5MywianRpIjoidW9lZTNWOWRLOW5vQW1DMyIsInN1YiI6IjgiLCJwcnYiOiJiYjAwNjNhYTQyMjI4NjY2NTNmNDExZWQ0NzI1OWMxNTk3M2IzNGRiIn0.VntXqhZUjUjmEtTn5tMsCEfLxDDjFT7IIPKBpOmzNlk'

    ).then((value) {
      deletestudent=DeleteSubjectModel.fromJson(value.data);
      emit(DeleteStudentRoomSucessState(deletestudent!));
      GetStudent(id: idroom!);
      print(delete!.message);
    }).catchError((error){
      print('delete error $error');
      emit(DeleteStudentRoomErrorState());
    });
  }

  //Teacher

  GetTeacherModel? getTeacher;
  List<dynamic> listNewTeacher=[];

  void GetTeacher(){
    emit(GetTeacherLoadingState());
    DioHelper.getData(
        url: 'school/teacher',
       token: tokenSchool!,
       // token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjgyNTgzMzkzLCJleHAiOjIwNDI1ODMzOTMsIm5iZiI6MTY4MjU4MzM5MywianRpIjoidW9lZTNWOWRLOW5vQW1DMyIsInN1YiI6IjgiLCJwcnYiOiJiYjAwNjNhYTQyMjI4NjY2NTNmNDExZWQ0NzI1OWMxNTk3M2IzNGRiIn0.VntXqhZUjUjmEtTn5tMsCEfLxDDjFT7IIPKBpOmzNlk'


    ).then((value) {
      getTeacher = GetTeacherModel.fromJson(value.data);
      print('Get teacher ${getTeacher!.status}');
      emit(GetTeacherSucessState(getTeacher!));
      for(int i=0;i< getTeacher!.teachers!.length;i++){
        listNewTeacher.add(
            {
              "id":'${getTeacher!.teachers![i].id}',
              "name": '${getTeacher!.teachers![i].name}(${getTeacher!.teachers![i].subject!.subjectdetails!.name})',

            }
        );
      }
    }

      ).catchError((error){
      print('Get Teacher error $error');
      emit(GetTeacherErrorState());
    });
  }
  AddTeacherModel? addTeacher;
  void AddTeacher({
  required String emailTeacher,
    required int studentId
}
  ){
    emit(AddTeacherLoadingState());
    DioHelper.postData(
        url: 'school/teacher',
        token: tokenSchool!
        //token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjgyNTgzMzkzLCJleHAiOjIwNDI1ODMzOTMsIm5iZiI6MTY4MjU4MzM5MywianRpIjoidW9lZTNWOWRLOW5vQW1DMyIsInN1YiI6IjgiLCJwcnYiOiJiYjAwNjNhYTQyMjI4NjY2NTNmNDExZWQ0NzI1OWMxNTk3M2IzNGRiIn0.VntXqhZUjUjmEtTn5tMsCEfLxDDjFT7IIPKBpOmzNlk'
        ,
        query: {
          'teacher_email':emailTeacher,
          'subject_id':studentId
        }
    ).then((value) {
      addTeacher=AddTeacherModel.fromJson(value.data);
      print(value.data);
      print(addTeacher!.message);
      emit(AddTeacherSucessState(addTeacher!));
      GetTeacher();
    })/*.catchError((error){
      print('error add Teacher ${error}');
      emit(AddTeacherErrorState());
    })*/;
  }
String? teacherSubjectNew;
  void ChangeTeacherSubjectNew(value){
    teacherSubjectNew=value;
    emit(TeacherSubjectNewState());
  }
  String? lessonNew;


  void DeleteTeacher({
  required int id
}){
    emit(DeleteTeacherLoadingState());
      DioHelper.DeleteData(
          url: 'school/teacher/$id',
         token: tokenSchool!
         // token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjgyNTgzMzkzLCJleHAiOjIwNDI1ODMzOTMsIm5iZiI6MTY4MjU4MzM5MywianRpIjoidW9lZTNWOWRLOW5vQW1DMyIsInN1YiI6IjgiLCJwcnYiOiJiYjAwNjNhYTQyMjI4NjY2NTNmNDExZWQ0NzI1OWMxNTk3M2IzNGRiIn0.VntXqhZUjUjmEtTn5tMsCEfLxDDjFT7IIPKBpOmzNlk'

      ).then((value) {
        print('Sucess ');
        emit(DeleteTeacherSucessState());
        GetTeacher();
      }).catchError((error){
        print('error Delete Teacher $error ');
        emit(DeleteTeacherErrorState());
      });
  }
  GetscheduleModel? secduleModel;
  void GetSchedule(){
    emit(GetScheduleLoadingState());
    DioHelper.getData(
        url: 'school/room?getter=schedule',
      token: tokenSchool!
    ).then((value) {
      secduleModel=GetscheduleModel.fromJson(value.data);
      emit(GetScheduleSuccessState(secduleModel!));
      print(secduleModel!.status);
    }).catchError((error){
      print('error get Schedule $error');
      emit(GetScheduleErrorState());
    });
  }
  AddScheduleModel? addScheduleModel;
  void AddSchedule({
  required String period,
    required int roomId
}){
    emit(AddScheduleLoadingState());
    DioHelper.postData(
        url: 'school/period',
        token: tokenSchool!,
        query: {
          'period':period,
          'room_id':roomId
        }
    ).then((value) {
    addScheduleModel=AddScheduleModel.fromJson(value.data);
    print(addScheduleModel!.message);
    emit(AddScheduleSuccessState(addScheduleModel!));
    GetSchedule();
    }).catchError((error){
     print('error Add Schedule $error');
     emit(AddScheduleErrorState());
    });
  }
void AddLesson({
  required int teacherid,
  required int lessonid
}){
    emit(AddLessonScheduleLoadingState());
    DioHelper.PutData(
        url: 'school/lesson/$lessonid',
        token: tokenSchool!,
        query: {
          'teacher_id':teacherid
        }
    ).then((value) {
      emit(AddLessonScheduleSuccessState());
      GetSchedule();
    }).catchError((error){
      print('error put lesson to teacher $error');
      emit(AddLessonScheduleErrorState());
    });
}

//Absence
GetAbsenceSchoolTOTeacherModel? getAbsenceSchoolTOTeacherModel;
  void GetAbsence(){
    emit(GetAbsenceLoadingState());
    DioHelper.getData(
      url: 'school/absence',
      token: tokenSchool!,

    ).then((value) {
      getAbsenceSchoolTOTeacherModel=GetAbsenceSchoolTOTeacherModel.fromJson(value.data);

      emit(GetAbsenceSuccessState());
    }).catchError((error){
      emit(GetAbsenceErrorState());

    });
  }
List listAbsence=[];

void AddAbsence(

    ){
    emit(AbsenceLoadingState());
    DioHelper.postData(
        url: 'school/absence',
      token: tokenSchool!,

      query: {
          for(int i=0;i<listAbsence.length;i++)
            'teachers[]':listAbsence[i],

      }
    ).then((value){
      emit(AbsenceSuccessState());
      print('Success');
    }).catchError((error){
      print('error absence $error');
      emit(AbsenceErrorState());
    });
}

//profile

  GetProfileModel? getProfileModel;

  GetProfile() {
    emit(GetProfileSchoolLoadingState());
    DioHelper.getData(
        url: 'profile/school',
        token: tokenSchool!
    ).then((value) {
      getProfileModel=GetProfileModel.fromJson(value.data);
      emit(GetProfileSchoolSuccessState());
    }).catchError((error) {
      print('error get profilr $error');
      emit(GetProfileSchoolErrorState());
    });
  }

  //Result

 SendResult({
    required String name,
   required int room_id,
   required int StudentId,
   required int SubjectId,
   required int DegreStudent,
   required int DegreFinal

}){
   emit(GetResultSchoolLoadingState());
    DioHelper.postData(
        url: 'school/results',
      token: tokenSchool!,
      query: {
          'name':name,
        'room_id':room_id,
        'results[0][0][0]':StudentId,
        'results[0][1][0][0]':SubjectId,
        'results[0][1][0][1]':DegreFinal,
        'results[0][1][0][2]':DegreStudent
      }
    ).then((value){
   emit(GetResultSchoolSuccessState());

    }).catchError((error){
      print('error Send Result $error');
   print(GetResultSchoolErrorState());
    });
 }

 //status announced  or  not_announced

  GetAnnouncedModel? getAnnouncedModel;
  GetNotAnnouncedModel? getNotAnnouncedModel;
String ? status;
  void StatusAnnounced({
  required String status
}){
    emit(GetAnnouncedLoadingState());
    DioHelper.getData(
        url: 'school/results',
      token: tokenSchool!,
      query: {
          'status':status
      }
    ).then((value) {
      if(status=='announced') {
        getAnnouncedModel = GetAnnouncedModel.fromJson(value.data);
      }else{
        getNotAnnouncedModel=GetNotAnnouncedModel.fromJson(value.data);
      }
      emit(GetAnnouncedSuccessState());
    }).catchError((error){
      emit(GetAnnouncedErrorState());
    });

}


}