
import '../../../Models/Parent/AddChildrenModel.dart';
import '../../../Models/Parent/GetChildernModel.dart';

abstract class ParentStates {}
class initialParentState extends ParentStates{}
class ChangeContainerState extends ParentStates{}

//children
class GetChildrenLoadingState extends ParentStates{}
class GetChildrenSucessState extends ParentStates{
 final GetChildrenModel model;
 GetChildrenSucessState(this.model);
}
class GetChildrenErrorState extends ParentStates{}

class AddChildrenLoadingState extends ParentStates{}
class AddChildrenSucessState extends ParentStates{
  final AddChildrenModel model;
  AddChildrenSucessState(this.model);
}
class AddChildrenErrorState extends ParentStates{}

class DeleteChildrenLoadingState extends ParentStates{}
class DeleteChildrenSucessState extends ParentStates{}
class DeleteChildrenErrorState extends ParentStates{}
//Exams
class GetExamsChildrenLoadingState extends ParentStates{}
class GetExamsChildrenSuccessState extends ParentStates{}
class GetExamsChildrenErrorState extends ParentStates{}

//Absence
class GetAbsenceChlidrenLoadingState extends ParentStates{}
class GetAbsenceChlidrenSuccessState extends ParentStates{}
class GetAbsenceChlidrenErrorState extends ParentStates{}

//Result
class GetResultParentLoadingState extends ParentStates{}
class GetResultParentSuccessState extends ParentStates{}
class GetResultParentErrorState extends ParentStates{}


//profile
class GetProfileParentLoadingState extends ParentStates{}
class GetProfileParentSuccessState extends ParentStates{}
class GetProfileParentErrorState extends ParentStates{}

