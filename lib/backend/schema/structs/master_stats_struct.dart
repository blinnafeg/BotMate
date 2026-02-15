// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MasterStatsStruct extends BaseStruct {
  MasterStatsStruct({
    String? masterId,
    String? masterName,
    String? masterPhone,
    int? appointmentsCount,
    int? totalRevenue,
    int? completedCount,
    int? pendingCount,
    int? confirmedCount,
  })  : _masterId = masterId,
        _masterName = masterName,
        _masterPhone = masterPhone,
        _appointmentsCount = appointmentsCount,
        _totalRevenue = totalRevenue,
        _completedCount = completedCount,
        _pendingCount = pendingCount,
        _confirmedCount = confirmedCount;

  // "masterId" field.
  String? _masterId;
  String get masterId => _masterId ?? '';
  set masterId(String? val) => _masterId = val;

  bool hasMasterId() => _masterId != null;

  // "masterName" field.
  String? _masterName;
  String get masterName => _masterName ?? '';
  set masterName(String? val) => _masterName = val;

  bool hasMasterName() => _masterName != null;

  // "masterPhone" field.
  String? _masterPhone;
  String get masterPhone => _masterPhone ?? '';
  set masterPhone(String? val) => _masterPhone = val;

  bool hasMasterPhone() => _masterPhone != null;

  // "appointmentsCount" field.
  int? _appointmentsCount;
  int get appointmentsCount => _appointmentsCount ?? 0;
  set appointmentsCount(int? val) => _appointmentsCount = val;

  void incrementAppointmentsCount(int amount) =>
      appointmentsCount = appointmentsCount + amount;

  bool hasAppointmentsCount() => _appointmentsCount != null;

  // "totalRevenue" field.
  int? _totalRevenue;
  int get totalRevenue => _totalRevenue ?? 0;
  set totalRevenue(int? val) => _totalRevenue = val;

  void incrementTotalRevenue(int amount) =>
      totalRevenue = totalRevenue + amount;

  bool hasTotalRevenue() => _totalRevenue != null;

  // "completedCount" field.
  int? _completedCount;
  int get completedCount => _completedCount ?? 0;
  set completedCount(int? val) => _completedCount = val;

  void incrementCompletedCount(int amount) =>
      completedCount = completedCount + amount;

  bool hasCompletedCount() => _completedCount != null;

  // "pendingCount" field.
  int? _pendingCount;
  int get pendingCount => _pendingCount ?? 0;
  set pendingCount(int? val) => _pendingCount = val;

  void incrementPendingCount(int amount) =>
      pendingCount = pendingCount + amount;

  bool hasPendingCount() => _pendingCount != null;

  // "confirmedCount" field.
  int? _confirmedCount;
  int get confirmedCount => _confirmedCount ?? 0;
  set confirmedCount(int? val) => _confirmedCount = val;

  void incrementConfirmedCount(int amount) =>
      confirmedCount = confirmedCount + amount;

  bool hasConfirmedCount() => _confirmedCount != null;

  static MasterStatsStruct fromMap(Map<String, dynamic> data) =>
      MasterStatsStruct(
        masterId: data['masterId'] as String?,
        masterName: data['masterName'] as String?,
        masterPhone: data['masterPhone'] as String?,
        appointmentsCount: castToType<int>(data['appointmentsCount']),
        totalRevenue: castToType<int>(data['totalRevenue']),
        completedCount: castToType<int>(data['completedCount']),
        pendingCount: castToType<int>(data['pendingCount']),
        confirmedCount: castToType<int>(data['confirmedCount']),
      );

  static MasterStatsStruct? maybeFromMap(dynamic data) => data is Map
      ? MasterStatsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'masterId': _masterId,
        'masterName': _masterName,
        'masterPhone': _masterPhone,
        'appointmentsCount': _appointmentsCount,
        'totalRevenue': _totalRevenue,
        'completedCount': _completedCount,
        'pendingCount': _pendingCount,
        'confirmedCount': _confirmedCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'masterId': serializeParam(
          _masterId,
          ParamType.String,
        ),
        'masterName': serializeParam(
          _masterName,
          ParamType.String,
        ),
        'masterPhone': serializeParam(
          _masterPhone,
          ParamType.String,
        ),
        'appointmentsCount': serializeParam(
          _appointmentsCount,
          ParamType.int,
        ),
        'totalRevenue': serializeParam(
          _totalRevenue,
          ParamType.int,
        ),
        'completedCount': serializeParam(
          _completedCount,
          ParamType.int,
        ),
        'pendingCount': serializeParam(
          _pendingCount,
          ParamType.int,
        ),
        'confirmedCount': serializeParam(
          _confirmedCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static MasterStatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MasterStatsStruct(
        masterId: deserializeParam(
          data['masterId'],
          ParamType.String,
          false,
        ),
        masterName: deserializeParam(
          data['masterName'],
          ParamType.String,
          false,
        ),
        masterPhone: deserializeParam(
          data['masterPhone'],
          ParamType.String,
          false,
        ),
        appointmentsCount: deserializeParam(
          data['appointmentsCount'],
          ParamType.int,
          false,
        ),
        totalRevenue: deserializeParam(
          data['totalRevenue'],
          ParamType.int,
          false,
        ),
        completedCount: deserializeParam(
          data['completedCount'],
          ParamType.int,
          false,
        ),
        pendingCount: deserializeParam(
          data['pendingCount'],
          ParamType.int,
          false,
        ),
        confirmedCount: deserializeParam(
          data['confirmedCount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MasterStatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MasterStatsStruct &&
        masterId == other.masterId &&
        masterName == other.masterName &&
        masterPhone == other.masterPhone &&
        appointmentsCount == other.appointmentsCount &&
        totalRevenue == other.totalRevenue &&
        completedCount == other.completedCount &&
        pendingCount == other.pendingCount &&
        confirmedCount == other.confirmedCount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        masterId,
        masterName,
        masterPhone,
        appointmentsCount,
        totalRevenue,
        completedCount,
        pendingCount,
        confirmedCount
      ]);
}

MasterStatsStruct createMasterStatsStruct({
  String? masterId,
  String? masterName,
  String? masterPhone,
  int? appointmentsCount,
  int? totalRevenue,
  int? completedCount,
  int? pendingCount,
  int? confirmedCount,
}) =>
    MasterStatsStruct(
      masterId: masterId,
      masterName: masterName,
      masterPhone: masterPhone,
      appointmentsCount: appointmentsCount,
      totalRevenue: totalRevenue,
      completedCount: completedCount,
      pendingCount: pendingCount,
      confirmedCount: confirmedCount,
    );
