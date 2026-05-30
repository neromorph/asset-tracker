import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the current theme mode.
/// Defaults to system theme.
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
