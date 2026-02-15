// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DateTime?> show24HourTimePicker(
  BuildContext context,
  Color? lightBg,
  Color? lightText,
  Color? lightPrimary,
  Color? darkBg,
  Color? darkText,
  Color? darkPrimary,
  bool withTime,
) async {
  // Add your function code here!
  bool isDark = Theme.of(context).brightness == Brightness.dark;

  final selectedPrimary =
      isDark ? (darkPrimary ?? Colors.blue) : (lightPrimary ?? Colors.blue);
  final selectedBg =
      isDark ? (darkBg ?? const Color(0xFF1D1B20)) : (lightBg ?? Colors.white);
  final selectedText =
      isDark ? (darkText ?? Colors.white) : (lightText ?? Colors.black);

  final customTheme = Theme.of(context).copyWith(
    useMaterial3: true,
    dialogTheme: DialogThemeData(
      backgroundColor: selectedBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: selectedBg,
      headerBackgroundColor: selectedPrimary,
      headerForegroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      surfaceTintColor: Colors.transparent,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: selectedBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      dialTextStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      hourMinuteTextStyle: const TextStyle(fontSize: 40),
      helpTextStyle: const TextStyle(fontSize: 14),
    ),
    colorScheme: ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: selectedPrimary,
      onPrimary: Colors.white,
      surface: selectedBg,
      onSurface: selectedText,
      secondary: selectedPrimary,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: selectedPrimary),
    ),
  );

  // ВЫБОР ДАТЫ
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
    locale: const Locale('ru', 'RU'),
    builder: (context, child) => Theme(data: customTheme, child: child!),
  );

  if (pickedDate == null) return null;

  // ЕСЛИ НУЖНА ТОЛЬКО ДАТА — ВОЗВРАЩАЕМ ЕЁ
  if (!withTime) {
    return DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
    );
  }

  // ВЫБОР ВРЕМЕНИ
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return Theme(
        data: customTheme,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
            textScaler: const TextScaler.linear(1.0),
          ),
          child: Localizations.override(
            context: context,
            locale: const Locale('ru', 'RU'),
            child: child!,
          ),
        ),
      );
    },
  );

  if (pickedTime == null) return null;

  return DateTime(
    pickedDate.year,
    pickedDate.month,
    pickedDate.day,
    pickedTime.hour,
    pickedTime.minute,
  );
}
