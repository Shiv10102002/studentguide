import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studentguide/theme.dart';

class ThemeController extends GetxController {
  final GetStorage _box = GetStorage();
  final _key = 'isDarkMode';

  var _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  ThemeMode get theme => _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  ThemeData get themeData =>
      _isDarkMode.value ? buildDarkThemeData() : buildLightThemeData();

  @override
  void onInit() {
    super.onInit();
    _isDarkMode.value = _box.read(_key) ?? _getSystemTheme();
    _listenToSystemTheme();
  }

  bool _getSystemTheme() {
    return WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  }

  void _listenToSystemTheme() {
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      final isSystemDarkMode =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      if (_isDarkMode.value != isSystemDarkMode) {
        _isDarkMode.value = isSystemDarkMode;
        _box.write(_key, _isDarkMode.value);
        Get.changeThemeMode(theme);
      }
    };
  }

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    _box.write(_key, _isDarkMode.value);
    Get.changeThemeMode(theme);
  }
}
