import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.light;
    } else {
      return themeMode == ThemeMode.light;
    }
  }

// final isDarkModeProvider = Provider <bool>((ref) {
//   final themeMode = ref.watch(themeModeProvider.state).state;
//      if (themeMode == ThemeMode.system) {
//       final brightness = SchedulerBinding.instance.window.platformBrightness;
//       return brightness == Brightness.light;
//     } else {
//       return themeMode == ThemeMode.light;
//     }
//   // return themeMode == ThemeMode.dark;
// });
  toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
