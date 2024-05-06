// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preference_example/cache/shared_not_initilazed.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKey { action }

class SharedManager {
  SharedPreferences? sharedPreferences;

  SharedManager();

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void _checkSharedPreferences() {
    if (sharedPreferences == null) throw SharedNotInitilazed();
  }

  Future<void> saveString(SharedKey key, String value) async {
    _checkSharedPreferences();
    await sharedPreferences?.setString(key.name, value);
  }

  String? getString(SharedKey key) {
    _checkSharedPreferences();
    return sharedPreferences?.getString(key.name);
  }

  Future<bool> remove(SharedKey key) async {
    _checkSharedPreferences();
    return (await sharedPreferences?.remove(key.name)) ?? false;
  }
}
