import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  static late SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  // 获取字符串
  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  // 获取list
  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  // 获取bool
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  // 删除
  Future remove(String key) async {
    await _prefs.remove(key);
  }
}
