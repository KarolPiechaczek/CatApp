import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  String valueSharedPreferences = 'isPressed';

  Future<bool> saveIfPressedState(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(valueSharedPreferences, value);
  }

  Future<bool> getIfPressedState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isButtonPressed = sharedPreferences.getBool(valueSharedPreferences);
    if (isButtonPressed != null){
      isButtonPressed = sharedPreferences.getBool(valueSharedPreferences) as bool;
    } else{
      isButtonPressed = false;
    }
    return isButtonPressed;
  }
}
