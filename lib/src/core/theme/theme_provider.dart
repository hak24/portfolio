import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  static const _themePreferenceKey = 'theme_mode';
  late SharedPreferences _prefs;

  ThemeNotifier() : super(ThemeMode.system) {
    _initializeTheme();
  }

  Future<void> _initializeTheme() async {
    _prefs = await SharedPreferences.getInstance();
    final savedTheme = _prefs.getString(_themePreferenceKey);
    if (savedTheme != null) {
      state = ThemeMode.values.firstWhere(
        (theme) => theme.toString() == savedTheme,
        orElse: () => ThemeMode.system,
      );
    }
  }

  Future<void> toggleTheme() async {
    final newTheme = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
      ThemeMode.system => ThemeMode.light,
    };
    
    state = newTheme;
    await _prefs.setString(_themePreferenceKey, newTheme.toString());
  }

  bool get isDarkMode {
    if (state == ThemeMode.system) {
      // Get the system theme
      final window = WidgetsBinding.instance.window;
      final brightness = window.platformBrightness;
      return brightness == Brightness.dark;
    }
    return state == ThemeMode.dark;
  }
} 