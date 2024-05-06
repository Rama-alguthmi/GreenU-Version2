import 'package:shared_preferences/shared_preferences.dart';

class SharePrefServices {
  static saveLoggeIn(bool val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('userLoggedIn', val);
  }

  static getLoggeIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('userLoggedIn');
  }

  static saveUserData(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('userData', data);
  }

  // static getUserData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var userRaw = pref.getString("userData");
  //   if (userRaw != null) {
  //     var user = UserModel.fromMap(jsonDecode(userRaw) as Map<String, dynamic>);
  //     return user;
  //   } else {
  //     return null;
  //   }
  // }
}
