import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  String valueSharedPreferences = 'isPressed';
  SharedPreferencesAsync asyncSharedPreferences = SharedPreferencesAsync();

  Future<void> saveIfPressedState(value) async {
    return await asyncSharedPreferences.setBool(valueSharedPreferences, value);
  }

  Future<bool> getIfPressedState() async {
    bool? isButtonPressed;
    isButtonPressed = await 
        asyncSharedPreferences.getBool(valueSharedPreferences); 
    return isButtonPressed ?? false;
  }
}
