import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { language, isLogin, id }

class SharedPrefController {
  SharedPrefController._();

  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  late SharedPreferences _preferences;

  Future<void> initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  void changeLanguage({required String lanCode}) {
    _preferences.setString(PrefKeys.language.name, lanCode);
  }

  void saveLogin(bool b) {
    _preferences.setBool(PrefKeys.isLogin.name, b);
  }

  void saveId(int id) {
    _preferences.setInt(PrefKeys.id.name, id);
  }

  T? getValue<T>(String key) {
    if (_preferences.containsKey(key)) {
      return _preferences.get(key) as T;
    }
    return null;
  }

  Future<bool> removeValueFor(String key) async {
    if (_preferences.containsKey(key)) {
      await _preferences.remove(key);
    }
    return false;
  }

  void clear() {
    _preferences.clear();
  }
}
