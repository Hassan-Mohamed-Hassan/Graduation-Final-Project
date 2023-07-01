
import '../../../Models/UserModel.dart';

abstract class LoginStates{}
class initialLoginState extends LoginStates{}
class changeIconState extends LoginStates{}
class ChangeLoginTypeState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSucessState extends LoginStates{
 final UserModel model;
  LoginSucessState(this.model);
}
class LoginErrorState extends LoginStates{}

//register
class RegisterLoadingState extends LoginStates{}
class RegisterSucessState extends LoginStates{
 final UserModel model;
 RegisterSucessState(this.model);
}
class RegisterErrorState extends LoginStates{}

//LOGOUT

class LogoutLoadingState extends LoginStates{}
class LogoutSuccessState extends LoginStates{}
class LogoutErrorState extends LoginStates{}
//profile

class GetProfileLoadingState extends LoginStates{}
class GetProfileSuccessState extends LoginStates{}
class GetProfileErrorState extends LoginStates{}

class UpdateProfileLoadingState extends LoginStates{}
class UpdateProfileSuccessState extends LoginStates{}
class UpdateProfileErrorState extends LoginStates{}

class UpdatePhotoLoadingState extends LoginStates{}
class UpdatePhotoSuccessState extends LoginStates{}
class UpdatePhotoErrorState extends LoginStates{}
class ImageState extends LoginStates{}