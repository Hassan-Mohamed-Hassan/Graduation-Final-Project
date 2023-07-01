import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
   static late  SharedPreferences sharedPreferences;
   static getinit()async {
    sharedPreferences=await SharedPreferences.getInstance();
  }
   static bool? getBooleanData({
     required String key
}){
    return sharedPreferences.getBool(key);
}

static String? getStringData({
  required String key
}){
    return sharedPreferences.getString(key);
}

  static dynamic Get({
  required String key
})async{
   return  sharedPreferences.get(key);
  }

  static Future<bool> SaveData(
  {
  required String key,
  required String value,
}
      )async{
    return await sharedPreferences.setString(key, value);
  }

  static Future<bool>  RemoveData(
      {
    required String key,
      }
      )async{
   return await sharedPreferences.remove(key);
  }

}