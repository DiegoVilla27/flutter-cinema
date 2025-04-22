import 'package:flutter/material.dart';

/// A global key used to access the ScaffoldMessengerState, allowing for
/// the display of SnackBars and other material design widgets from
/// anywhere in the widget tree.
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
