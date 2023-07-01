import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/student/Bloc/cubit.dart';
import 'package:untitled15/network/local/CacheHelper.dart';

import '../../../Models/GetProfileModel.dart';
import '../../../Models/UserModel.dart';
import '../../../network/Remote/diohelper.dart';
import 'LoginState.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() :super(initialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool secure = true;
  var RegisterType;

  void ChangeRegisterType(value) {
    RegisterType = value;
    emit(ChangeLoginTypeState());
  }

  void changeIcon() {
    secure = !secure;
    emit(changeIconState());
  }

  UserModel? login;

  Future LoginData({
    required String email,
    required String password,
    required String registerType
  }) async {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: 'login',
        query:
        {
          'email': email,
          'password': password,
          'register_type': registerType
        }
    ).then((value) {
      login = UserModel.fromJson(value.data);
      print(login!.message);
      emit(LoginSucessState(login!));
      if (login!.loginType == "schools") {
        tokenSchool = login!.authorisation!.token;
        tokenLogout = login!.authorisation!.token;
        typeProfile = 'school';
        CacheHelper.SaveData(key: 'tokenSchool', value: '$tokenSchool');
        CacheHelper.SaveData(key: 'tokenLogout', value: '$tokenSchool');
        CacheHelper.SaveData(key: 'typeProfile', value: '$typeProfile');
        GetProfile(type: 'school', token: tokenSchool);
      }
      else if (login!.loginType == "teachers") {
        tokenTeacher = login!.authorisation!.token;
        tokenLogout = login!.authorisation!.token;
        typeProfile = 'teacher';
        CacheHelper.SaveData(key: 'tokenTeacher', value: '$tokenTeacher');
        CacheHelper.SaveData(key: 'tokenLogout', value: '$tokenTeacher');
        CacheHelper.SaveData(key: 'typeProfile', value: '$typeProfile');
        GetProfile(type: 'teacher', token: tokenTeacher);
      }
      else if (login!.loginType == "students") {
        tokenStudent = login!.authorisation!.token;
        tokenLogout = login!.authorisation!.token;
        typeProfile = 'student';
        CacheHelper.SaveData(key: 'tokenStudent', value: '$tokenStudent');
        CacheHelper.SaveData(key: 'tokenLogout', value: '$tokenStudent');
        CacheHelper.SaveData(key: 'typeProfile', value: '$typeProfile');
        GetProfile(type: 'student', token: tokenStudent);
      }
      else if (login!.loginType == "parents") {
        tokenParent = login!.authorisation!.token;
        tokenLogout = login!.authorisation!.token;
        typeProfile = 'parent';
        CacheHelper.SaveData(key: 'tokenParent', value: '$tokenParent');
        CacheHelper.SaveData(key: 'tokenLogout', value: '$tokenParent');
        CacheHelper.SaveData(key: 'typeProfile', value: '$typeProfile');
        GetProfile(type: 'parent', token: tokenParent);
      }
    }).catchError((error) {
      print('error ${error.toString()}');
      emit(LoginErrorState());
    });
  }

  void Logout() {
    print(tokenLogout);
    emit(LogoutLoadingState());
    DioHelper.postData(
        url: 'logout',
        token: tokenLogout
    ).then((value) {
      CacheHelper.SaveData(key: 'tokenSchool', value: 'null');
      CacheHelper.SaveData(key: 'tokenStudent', value: 'null');
      CacheHelper.SaveData(key: 'tokenTeacher', value: 'null');
      CacheHelper.SaveData(key: 'tokenParent', value: 'null');
      emit(LogoutSuccessState());
      profileData = null;
      print((CacheHelper.getStringData(key: 'tokenStudent')));
    }).catchError((error) {
      print('error logout $error');
      emit(LogoutErrorState());
    });
  }

  //profile
  GetProfileModel? getProfileModel;

  Future GetProfile({type, token}) async {
    emit(GetProfileLoadingState());
    DioHelper.getData(
        url: 'profile/${typeProfile}',
        token: tokenLogout!
    ).then((value) async {
      profileData = GetProfileModel.fromJson(value.data);
    }).catchError((error) {
      print('error get profil $error');
      emit(GetProfileErrorState());
    });
    emit(GetProfileSuccessState());
  }


  void UpdateProfile({
    required String name,
    required String email,
    required String phone,
    required String address
  }) {
    emit(UpdateProfileLoadingState());
    DioHelper.postData(
        url: 'profile/$typeProfile',
        token: tokenLogout,
        query: {
          'name': name,
          'email': email,
          'phone': phone,
          'address': address
        }
    ).then((value) async {
      await GetProfile();
      print(profileData!.status);
      emit(UpdateProfileSuccessState());
    }).catchError((error) {
      print('error edit profile $error');
      emit(UpdateProfileErrorState());
    });
  }

  File? imageData;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var selected = File(image.path);
      emit(ImageState());
      imageData = selected;
      print(imageData!.path);
      print(imageData!.absolute);
      print('yes');
    } else {
      print('No');
    }
  }

  EditPhoto({
    required File photo,
  }) async {
    emit(UpdatePhotoLoadingState());
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(photo.openRead()));

    // get file length
    var length = await photo.length();


    // string to uri
    var uri = Uri.parse("http://192.168.43.200:8000/api/photo/$typeProfile");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('photo', stream, length,
        filename: basename(photo.path));


    // add file to multipart
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',

      'Authorization': 'Bearer $tokenLogout',
    });
    request.files.add(multipartFile);


    // send
    var response = await request.send();
    print(response.statusCode);
    emit(UpdatePhotoSuccessState());
    GetProfile();

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }


  void RegisterData(
      {
        required String name,
        required String email,
        required String password,
        required String RegisterType

      }
      ){
    emit(RegisterLoadingState());

    DioHelper.postData(
        url: 'register',
        query:
        {
          'email':email,
          'password':password,
          'register_type':RegisterType,
          'name':name,
        }
    ).then((value) {
      login=UserModel.fromJson(value.data);
      print(login!.message);
      emit(RegisterSucessState(login!));
      if(login!.loginType=="schools"){
        tokenSchool=login!.authorisation!.token;
        tokenLogout=login!.authorisation!.token;
        typeProfile='school';
        CacheHelper.SaveData(key:'tokenSchool',value:'$tokenSchool');
        CacheHelper.SaveData(key:'tokenLogout',value:'$tokenSchool');
        CacheHelper.SaveData(key:'typeProfile',value:'$typeProfile');
        GetProfile(type: 'school',token:tokenSchool);

      }
      else if(login!.loginType=="teachers"){
        tokenTeacher=login!.authorisation!.token;
        tokenLogout=login!.authorisation!.token;
        typeProfile='teacher';
        CacheHelper.SaveData(key:'tokenTeacher',value:'$tokenTeacher');
        CacheHelper.SaveData(key:'tokenLogout',value:'$tokenTeacher');
        CacheHelper.SaveData(key:'typeProfile',value:'$typeProfile');
        GetProfile(type: 'teacher',token:tokenTeacher);
      }
      else if(login!.loginType=="students"){
        tokenStudent=login!.authorisation!.token;
        tokenLogout=login!.authorisation!.token;
        typeProfile='student';
        CacheHelper.SaveData(key:'tokenStudent',value:'$tokenStudent');
        CacheHelper.SaveData(key:'tokenLogout',value:'$tokenStudent');
        CacheHelper.SaveData(key:'typeProfile',value:'$typeProfile');
        GetProfile(type: 'student',token:tokenStudent);

      }
      else if(login!.loginType=="parents"){
        tokenParent=login!.authorisation!.token;
        tokenLogout=login!.authorisation!.token;
        typeProfile='parent';
        CacheHelper.SaveData(key:'tokenParent',value:'$tokenParent');
        CacheHelper.SaveData(key:'tokenLogout',value:'$tokenParent');
        CacheHelper.SaveData(key:'typeProfile',value:'$typeProfile');
        GetProfile(type: 'parent',token:tokenParent);
      }
    }).catchError((error){
      print('error ${error.toString()}');
      emit(RegisterErrorState());
    });
  }

}