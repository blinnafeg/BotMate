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
    bool? mounthFourwardRecordsListview,
  })  : _centerTopHeader = centerTopHeader,
        _centerTopSearch = centerTopSearch,
        _centerTopCreat = centerTopCreat,
        _todayRecordsListview = todayRecordsListview,
        _weakRecordsListview = weakRecordsListview,
        _mounthFourwardRecordsListview = mounthFourwardRecordsListview;

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

  // "MOUNTH-FOURWARD-RECORDS-LISTVIEW" field.
  bool? _mounthFourwardRecordsListview;
  bool get mounthFourwardRecordsListview =>
      _mounthFourwardRecordsListview ?? false;
  set mounthFourwardRecordsListview(bool? val) =>
      _mounthFourwardRecordsListview = val;

  bool hasMounthFourwardRecordsListview() =>
      _mounthFourwardRecordsListview != null;

  static VisibilityStruct fromMap(Map<String, dynamic> data) =>
      VisibilityStruct(
        centerTopHeader: data['CENTER-TOP-HEADER'] as bool?,
        centerTopSearch: data['CENTER-TOP-SEARCH'] as bool?,
        centerTopCreat: data['CENTER-TOP-CREAT'] as bool?,
        todayRecordsListview: data['TODAY-RECORDS-LISTVIEW'] as bool?,
        weakRecordsListview: data['WEAK-RECORDS-LISTVIEW'] as bool?,
        mounthFourwardRecordsListview:
            data['MOUNTH-FOURWARD-RECORDS-LISTVIEW'] as bool?,
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
        'MOUNTH-FOURWARD-RECORDS-LISTVIEW': _mounthFourwardRecordsListview,
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
        'MOUNTH-FOURWARD-RECORDS-LISTVIEW': serializeParam(
          _mounthFourwardRecordsListview,
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
        mounthFourwardRecordsListview: deserializeParam(
          data['MOUNTH-FOURWARD-RECORDS-LISTVIEW'],
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
        mounthFourwardRecordsListview == other.mounthFourwardRecordsListview;
  }

  @override
  int get hashCode => const ListEquality().hash([
        centerTopHeader,
        centerTopSearch,
        centerTopCreat,
        todayRecordsListview,
        weakRecordsListview,
        mounthFourwardRecordsListview
      ]);
}

VisibilityStruct createVisibilityStruct({
  bool? centerTopHeader,
  bool? centerTopSearch,
  bool? centerTopCreat,
  bool? todayRecordsListview,
  bool? weakRecordsListview,
  bool? mounthFourwardRecordsListview,
}) =>
    VisibilityStruct(
      centerTopHeader: centerTopHeader,
      centerTopSearch: centerTopSearch,
      centerTopCreat: centerTopCreat,
      todayRecordsListview: todayRecordsListview,
      weakRecordsListview: weakRecordsListview,
      mounthFourwardRecordsListview: mounthFourwardRecordsListview,
    );
