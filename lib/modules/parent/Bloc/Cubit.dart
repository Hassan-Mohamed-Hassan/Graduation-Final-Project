

import 'package:bloc/bloc.dart';
import 'package:untitled15/Models/Parent/GetAbsenceChildrenModel.dart';
import 'package:untitled15/Models/Parent/GetExamChildrenModel.dart';
import 'package:untitled15/Models/Parent/GetResultParentModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/GetProfileModel.dart';
import '../../../Models/Parent/AddChildrenModel.dart';
import '../../../Models/Parent/GetChildernModel.dart';
import '../../../constants/constants.dart';
import '../../../network/Remote/diohelper.dart';
import 'States.dart';


class CubitParent extends Cubit<ParentStates>{
  CubitParent():super(initialParentState());
  static CubitParent get(context)=>BlocProvider.of(context);
  bool value=false;
  void ChangeContainer(){
    value=!value;
    emit(ChangeContainerState());
  }
  GetChildrenModel? getChildren;
  List<dynamic> listIdStudent=[];
  void GetChildren(){
    print('/////////33333333333');
    emit(GetChildrenLoadingState());
    DioHelper.getData(
        url: 'parent/children',
      token: tokenParent!
    ).then((value) {
      getChildren=GetChildrenModel.fromJson(value.data);
      print(getChildren!.status);
      emit(GetChildrenSucessState(getChildren!));
      for(int i=0;i<getChildren!.children!.length;i++){
        listIdStudent.add(
          {
            "id":'${getChildren!.children![i].id}',
            "name": '${getChildren!.children![i].name}',
          }
        );
        print(listIdStudent[i]);
      }

    });
  }

  AddChildrenModel? addChildren;
  void AddChildren({
  required String email
}){
    emit(AddChildrenLoadingState());
    DioHelper.postData(
        url: 'parent/children',
        token: tokenParent!,
        query: {
          'email':email
        }
    ).then((value) {
      addChildren=AddChildrenModel.fromJson(value.data);
      emit(AddChildrenSucessState(addChildren!));
      GetChildren();
    }).catchError((error){
      print('error add children $error');
      emit(AddChildrenErrorState());
    });
  }
  void DeleteChildren({
  required int id
}){
    emit(DeleteChildrenLoadingState());
    DioHelper.DeleteData(
        url:'parent/children/$id',
      token: tokenParent!
    ).then((value) {
      emit(DeleteChildrenSucessState());
      GetChildren();
    }).catchError((error){
      print('error delete children $error');
      emit(DeleteChildrenErrorState());
    });
  }

  //Exams
  GetExamsChildrenModel? getExamsChildrenModel;
  void GetExamsStudent(){
    emit((GetExamsChildrenLoadingState()));
    DioHelper.getData(
        url: 'parent/exams',
      token: tokenParent!,

    ).then((value) {
      emit((GetExamsChildrenSuccessState()));
      getExamsChildrenModel=GetExamsChildrenModel.fromJson(value.data);
      print('Success');
      print(getExamsChildrenModel!.exams![0].name);
      print(getExamsChildrenModel!.exams![1].examss!.length);
      print(getExamsChildrenModel!.exams![0].examss![0].exam!.name);

    }).catchError((error){
      print('Get exam children $error');
      emit((GetExamsChildrenErrorState()));

    });
  }

  //Absence
  String? idStudent;
  GetAbsenceChildrenModel? getAbsenceChildrenModel;
 void GetAbsence({
  required int id
}){
  emit(GetAbsenceChlidrenLoadingState());
    DioHelper.getData(
        url: 'parent/absence',
      token: tokenParent!,
      query: {
          'student_id':id
      }

    ).then((value) {
      getAbsenceChildrenModel=GetAbsenceChildrenModel.fromJson(value.data);
      emit(GetAbsenceChlidrenSuccessState());
      print(getAbsenceChildrenModel!.room!.length);
    }).catchError((error){
      print('error absence children $error');
      emit(GetAbsenceChlidrenErrorState());
    });
}
//Result

  ParentResult? getResultToParentModel;
GetResult({
    required int id
}){
  emit(GetResultParentLoadingState());
  DioHelper.getData(
      url: 'parent/results',
     token: tokenParent!,
     query: {
        'student_id':id
    }
  ).then((value) {
    print(value.data['results'][0][0]);
    getResultToParentModel=ParentResult.fromJson(value.data['results'][0][0]);
      emit(GetResultParentSuccessState());
  });
  print(tokenParent);
}
  //profile
  GetProfileModel? getProfileModel;
  GetProfile() {
    emit(GetProfileParentLoadingState());
    DioHelper.getData(
        url: 'profile/parent',
        token: tokenParent!
    ).then((value) {
      getProfileModel=GetProfileModel.fromJson(value.data);
      print(getProfileModel!.profile![0].name);
      emit(GetProfileParentSuccessState());
    });
  }


}