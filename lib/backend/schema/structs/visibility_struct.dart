// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisibilityStruct extends BaseStruct {
  VisibilityStruct({
    bool? centerTopHeader,
    bool? centerTopSearch,
    bool? centerTopCreat,
    bool? todayRecordsListview,
    bool? weakRecordsListview,
    bool? monthCurentRecordsListview,
  })  : _centerTopHeader = centerTopHeader,
        _centerTopSearch = centerTopSearch,
        _centerTopCreat = centerTopCreat,
        _todayRecordsListview = todayRecordsListview,
        _weakRecordsListview = weakRecordsListview,
        _monthCurentRecordsListview = monthCurentRecordsListview;

  // "CENTER-TOP-HEADER" field.
  bool? _centerTopHeader;
  bool get centerTopHeader => _centerTopHeader ?? false;
  set centerTopHeader(bool? val) => _centerTopHeader = val;

  bool hasCenterTopHeader() => _centerTopHeader != null;

  // "CENTER-TOP-SEARCH" field.
  bool? _centerTopSearch;
  bool get centerTopSearch => _centerTopSearch ?? false;
  set centerTopSearch(bool? val) => _centerTopSearch = val;

  bool hasCenterTopSearch() => _centerTopSearch != null;

  // "CENTER-TOP-CREAT" field.
  bool? _centerTopCreat;
  bool get centerTopCreat => _centerTopCreat ?? false;
  set centerTopCreat(bool? val) => _centerTopCreat = val;

  bool hasCenterTopCreat() => _centerTopCreat != null;

  // "TODAY-RECORDS-LISTVIEW" field.
  bool? _todayRecordsListview;
  bool get todayRecordsListview => _todayRecordsListview ?? false;
  set todayRecordsListview(bool? val) => _todayRecordsListview = val;

  bool hasTodayRecordsListview() => _todayRecordsListview != null;

  // "WEAK-RECORDS-LISTVIEW" field.
  bool? _weakRecordsListview;
  bool get weakRecordsListview => _weakRecordsListview ?? false;
  set weakRecordsListview(bool? val) => _weakRecordsListview = val;

  bool hasWeakRecordsListview() => _weakRecordsListview != null;

  // "MONTH-CURENT-RECORDS-LISTVIEW" field.
  bool? _monthCurentRecordsListview;
  bool get monthCurentRecordsListview => _monthCurentRecordsListview ?? false;
  set monthCurentRecordsListview(bool? val) =>
      _monthCurentRecordsListview = val;

  bool hasMonthCurentRecordsListview() => _monthCurentRecordsListview != null;

  static VisibilityStruct fromMap(Map<String, dynamic> data) =>
      VisibilityStruct(
        centerTopHeader: data['CENTER-TOP-HEADER'] as bool?,
        centerTopSearch: data['CENTER-TOP-SEARCH'] as bool?,
        centerTopCreat: data['CENTER-TOP-CREAT'] as bool?,
        todayRecordsListview: data['TODAY-RECORDS-LISTVIEW'] as bool?,
        weakRecordsListview: data['WEAK-RECORDS-LISTVIEW'] as bool?,
        monthCurentRecordsListview:
            data['MONTH-CURENT-RECORDS-LISTVIEW'] as bool?,
      );

  static VisibilityStruct? maybeFromMap(dynamic data) => data is Map
      ? VisibilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'CENTER-TOP-HEADER': _centerTopHeader,
        'CENTER-TOP-SEARCH': _centerTopSearch,
        'CENTER-TOP-CREAT': _centerTopCreat,
        'TODAY-RECORDS-LISTVIEW': _todayRecordsListview,
        'WEAK-RECORDS-LISTVIEW': _weakRecordsListview,
        'MONTH-CURENT-RECORDS-LISTVIEW': _monthCurentRecordsListview,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CENTER-TOP-HEADER': serializeParam(
          _centerTopHeader,
          ParamType.bool,
        ),
        'CENTER-TOP-SEARCH': serializeParam(
          _centerTopSearch,
          ParamType.bool,
        ),
        'CENTER-TOP-CREAT': serializeParam(
          _centerTopCreat,
          ParamType.bool,
        ),
        'TODAY-RECORDS-LISTVIEW': serializeParam(
          _todayRecordsListview,
          ParamType.bool,
        ),
        'WEAK-RECORDS-LISTVIEW': serializeParam(
          _weakRecordsListview,
          ParamType.bool,
        ),
        'MONTH-CURENT-RECORDS-LISTVIEW': serializeParam(
          _monthCurentRecordsListview,
          ParamType.bool,
        ),
      }.withoutNulls;

  static VisibilityStruct fromSerializableMap(Map<String, dynamic> data) =>
      VisibilityStruct(
        centerTopHeader: deserializeParam(
          data['CENTER-TOP-HEADER'],
          ParamType.bool,
          false,
        ),
        centerTopSearch: deserializeParam(
          data['CENTER-TOP-SEARCH'],
          ParamType.bool,
          false,
        ),
        centerTopCreat: deserializeParam(
          data['CENTER-TOP-CREAT'],
          ParamType.bool,
          false,
        ),
        todayRecordsListview: deserializeParam(
          data['TODAY-RECORDS-LISTVIEW'],
          ParamType.bool,
          false,
        ),
        weakRecordsListview: deserializeParam(
          data['WEAK-RECORDS-LISTVIEW'],
          ParamType.bool,
          false,
        ),
        monthCurentRecordsListview: deserializeParam(
          data['MONTH-CURENT-RECORDS-LISTVIEW'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'VisibilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VisibilityStruct &&
        centerTopHeader == other.centerTopHeader &&
        centerTopSearch == other.centerTopSearch &&
        centerTopCreat == other.centerTopCreat &&
        todayRecordsListview == other.todayRecordsListview &&
        weakRecordsListview == other.weakRecordsListview &&
        monthCurentRecordsListview == other.monthCurentRecordsListview;
  }

  @override
  int get hashCode => const ListEquality().hash([
        centerTopHeader,
        centerTopSearch,
        centerTopCreat,
        todayRecordsListview,
        weakRecordsListview,
        monthCurentRecordsListview
      ]);
}

VisibilityStruct createVisibilityStruct({
  bool? centerTopHeader,
  bool? centerTopSearch,
  bool? centerTopCreat,
  bool? todayRecordsListview,
  bool? weakRecordsListview,
  bool? monthCurentRecordsListview,
}) =>
    VisibilityStruct(
      centerTopHeader: centerTopHeader,
      centerTopSearch: centerTopSearch,
      centerTopCreat: centerTopCreat,
      todayRecordsListview: todayRecordsListview,
      weakRecordsListview: weakRecordsListview,
      monthCurentRecordsListview: monthCurentRecordsListview,
    );
