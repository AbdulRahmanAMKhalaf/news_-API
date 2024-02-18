import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper{
  static SharedPreferences ?pref;
 static Future initialPreference()async{
  return pref=await SharedPreferences.getInstance();
 }
 static  Future setDate({
    required String key,
   required dynamic value
})async{
   if(value==int){
     return await pref!.setInt(key, value);
   }
   else
     if(value == double){
       return await pref!.setDouble(key, value);
     }
     else
     if(value == String){
       return await pref!.setString(key, value);
     }
     else
     if(value == bool){
       return await pref!.setBool(key, value);
     }
     else
       return await pref!.setStringList(key, value);
 }
 static Future getData({
    required String key
})async{
  return await pref!.get(key);
 }
}