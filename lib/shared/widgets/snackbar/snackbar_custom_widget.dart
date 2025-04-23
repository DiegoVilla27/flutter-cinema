import 'package:flutter/material.dart';
import 'package:flutter_cinema/core/states/scaffold/scaffold_key_state.dart';

enum SnackbarType { info, success, error, warning }

/// A utility class for displaying custom SnackBars with predefined styles
/// based on the SnackbarType. Provides methods to build and display SnackBars
/// with specific icons, colors, and durations.
///
/// The `open` method displays a SnackBar with a specified title and type,
/// optionally accepting a custom duration. The SnackBar includes an icon
/// corresponding to the type, a bold title, and a close button.
class SnackBarCustom {
  static const _colors = {
    SnackbarType.info: Colors.blue,
    SnackbarType.success: Colors.green,
    SnackbarType.warning: Colors.orange,
    SnackbarType.error: Colors.red,
  };

  static const _icons = {
    SnackbarType.info: Icons.info_rounded,
    SnackbarType.success: Icons.check_circle,
    SnackbarType.warning: Icons.warning_rounded,
    SnackbarType.error: Icons.error_rounded,
  };

  static SnackBar _buildSnackBar(
    String title,
    SnackbarType type, {
    Duration? duration,
  }) {
    duration ??= const Duration(seconds: 8);

    return SnackBar(
      padding: const EdgeInsets.all(10.0),
      content: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(_icons[type], color: _colors[type]),
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
          GestureDetector(
            onTap:
                () => scaffoldMessengerKey.currentState?.hideCurrentSnackBar(),
            child: Icon(Icons.close_rounded, color: Colors.black, size: 18.0),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );
  }

  static open(String title, SnackbarType type, {Duration? duration}) {
    scaffoldMessengerKey.currentState
      ?..clearSnackBars()
      ..showSnackBar(_buildSnackBar(title, type, duration: duration));
  }
}
