import 'package:flutter_cinema/core/theme/app_theme.dart';
import 'package:flutter_cinema/core/theme/app_theme_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides a [StateNotifierProvider] for managing theme state using
/// [AppThemeNotifierProvider] and [AppTheme].
///
/// This provider allows the application to reactively update its theme
/// based on the state managed by [AppThemeNotifierProvider].
final appThemeNotifierProvider =
    StateNotifierProvider<AppThemeNotifierProvider, AppTheme>(
      (ref) => AppThemeNotifierProvider(),
    );

/// ----------------------------------------------------------- ///

/// A [StateNotifier] that manages theme-related state changes.
///
/// This class provides methods to toggle dark mode and change the
/// color palette of the theme. It extends [StateNotifier] with a
/// state of type [AppTheme].
class AppThemeNotifierProvider extends StateNotifier<AppTheme> {
  AppThemeNotifierProvider() : super(AppTheme());

  /// Toggles the dark mode setting in the current state.
  ///
  /// This method updates the state by inverting the current value of
  /// the `isDarkMode` property.
  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  /// Updates the current state with a new color palette.
  ///
  /// This method modifies the `selectedColor` property of the state
  /// by copying the existing state and applying the new color.
  ///
  /// [color] is the new color palette to be set.
  void setSelectedColor(EColorsType color) {
    state = state.copyWith(selectedColor: color);
  }
}
