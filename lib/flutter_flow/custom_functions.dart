import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';

String getWeekDay(String? dateString) {
  // Если дата пустая - возвращаем пустую строку
  if (dateString == null || dateString.isEmpty) {
    return '';
  }

  try {
    // Парсим строку в DateTime
    DateTime date;

    // Если дата в формате "2026-02-16"
    if (dateString.length == 10) {
      List<String> parts = dateString.split('-');
      if (parts.length == 3) {
        int year = int.parse(parts[0]);
        int month = int.parse(parts[1]);
        int day = int.parse(parts[2]);
        date = DateTime(year, month, day);
      } else {
        date = DateTime.parse(dateString);
      }
    } else {
      date = DateTime.parse(dateString);
    }

    // Массив дней недели на русском
    List<String> weekDays = [
      'понедельник',
      'вторник',
      'среда',
      'четверг',
      'пятница',
      'суббота',
      'воскресенье'
    ];

    // В DateTime неделя начинается с воскресенья (0)
    // Нам нужно: понедельник = 0, воскресенье = 6
    int weekday = date.weekday; // 1 = понедельник, 7 = воскресенье

    // Преобразуем в индекс массива (0-6)
    int index = weekday - 1;

    return weekDays[index];
  } catch (e) {
    print('Error parsing date: $e');
    return '';
  }
}

String formatDateRussian(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return '';
  }

  try {
    // Парсим строку в DateTime
    DateTime date;

    // Если дата в формате "2026-02-16"
    if (dateString.length == 10) {
      List<String> parts = dateString.split('-');
      if (parts.length == 3) {
        int year = int.parse(parts[0]);
        int month = int.parse(parts[1]);
        int day = int.parse(parts[2]);
        date = DateTime(year, month, day);
      } else {
        date = DateTime.parse(dateString);
      }
    } else {
      date = DateTime.parse(dateString);
    }

    // Массив месяцев на русском в родительном падеже
    List<String> months = [
      'ЯНВАРЯ',
      'ФЕВРАЛЯ',
      'МАРТА',
      'АПРЕЛЯ',
      'МАЯ',
      'ИЮНЯ',
      'ИЮЛЯ',
      'АВГУСТА',
      'СЕНТЯБРЯ',
      'ОКТЯБРЯ',
      'НОЯБРЯ',
      'ДЕКАБРЯ'
    ];

    // Получаем день (без ведущего нуля)
    int day = date.day;

    // Получаем месяц (1-12)
    int month = date.month;

    // Формируем строку
    return '$day ${months[month - 1]}';
  } catch (e) {
    print('Error formatting date: $e');
    return dateString;
  }
}

List<String> getCalendarDates(
  String? viewType,
  AppointmentsPageDataStruct? appointmentsData,
) {
  if (appointmentsData == null) {
    return [];
  }

  final List<String> result = [];

  if (viewType == 'week') {
    for (var slot in appointmentsData.weekStats.dailySlots) {
      // Берем ТОЛЬКО первые 10 символов (yyyy-MM-dd)
      final fullDate = slot.date;
      final shortDate = fullDate.substring(0, 10);
      result.add(shortDate);
    }
  } else {
    for (var slot in appointmentsData.monthStats.dailySlots) {
      // Берем ТОЛЬКО первые 10 символов (yyyy-MM-dd)
      final fullDate = slot.date;
      final shortDate = fullDate.substring(0, 10);
      result.add(shortDate);
    }
  }

  return result;
}

String? getCalendarTitle(
  String? viewType,
  AppointmentsPageDataStruct? appointmentsData,
) {
  if (appointmentsData == null) {
    return '';
  }

// Получаем даты через существующую функцию
  final dates = getCalendarDates(viewType, appointmentsData);

  if (dates.isEmpty) {
    return '';
  }

  try {
    final firstDate = DateTime.parse(dates.first);
    final lastDate = DateTime.parse(dates.last);

    if (viewType == 'week') {
      // Формат: "17 - 23 ФЕВРАЛЯ"
      final firstDay = firstDate.day;
      final lastDay = lastDate.day;
      final month = DateFormat('MMMM', 'ru').format(firstDate).toUpperCase();
      return '$firstDay - $lastDay $month';
    } else {
      // Формат: "ФЕВРАЛЬ 2026"
      return DateFormat('MMMM yyyy', 'ru').format(firstDate).toUpperCase();
    }
  } catch (e) {
    print('Error in getCalendarTitle: $e');
    return '';
  }
}

dynamic getDaySlotByDate(
  String? dateString,
  String? viewType,
  AppointmentsPageDataStruct? appointmentsData,
) {
  if (appointmentsData == null) {
    return null;
  }

  // Проверяем dateString на null и пустоту
  if (dateString == null || dateString.isEmpty) {
    return null;
  }

  final isWeek = viewType == 'week';

  if (isWeek) {
    // Для недели - использовать weekStats
    final weekStats = appointmentsData.weekStats;
    if (weekStats == null) return null;

    final dailySlots = weekStats.dailySlots;
    if (dailySlots == null) return null;

    for (var slot in dailySlots) {
      // ⭐ ИСПРАВЛЕНО: Используем startsWith для сравнения
      if (slot.date.startsWith(dateString)) {
        return {
          'date': slot.date,
          'bookedSlots': slot.bookedSlots ?? 0,
          'totalSlots': slot.totalSlots ?? 0,
          'workloadByTime': slot.workloadByTime ?? 0.0,
        };
      }
    }
  } else {
    // Для месяца - использовать monthStats
    final monthStats = appointmentsData.monthStats;
    if (monthStats == null) return null;

    final dailySlots = monthStats.dailySlots;
    if (dailySlots == null) return null;

    for (var slot in dailySlots) {
      // ⭐ ИСПРАВЛЕНО: Используем startsWith для сравнения
      if (slot.date.startsWith(dateString)) {
        return {
          'date': slot.date,
          'bookedSlots': slot.bookedSlots ?? 0,
          'totalSlots': slot.totalSlots ?? 0,
          'workloadByTime': slot.workloadByTime ?? 0.0,
        };
      }
    }
  }

  return null;
}

String? getTargetDate(
  String viewType,
  int offset,
) {
  final now = DateTime.now();

  if (viewType == 'week') {
    // Смещаем на offset недель
    final target = now.add(Duration(days: offset * 7));
    return DateFormat('yyyy-MM-dd').format(target);
  } else {
    // Смещаем на offset месяцев
    final target = DateTime(
      now.year,
      now.month + offset,
      now.day,
    );
    return DateFormat('yyyy-MM-dd').format(target);
  }
}
