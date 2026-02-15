// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsPageDataStruct extends BaseStruct {
  AppointmentsPageDataStruct({
    TodayStatsStruct? todayStats,
    WeekStatsStruct? weekStats,
    MonthForwardStatsStruct? monthForwardStats,
    MonthBackwardStatsStruct? monthBackwardStats,
    String? lastUpdated,
    MonthStatsStruct? monthStats,
  })  : _todayStats = todayStats,
        _weekStats = weekStats,
        _monthForwardStats = monthForwardStats,
        _monthBackwardStats = monthBackwardStats,
        _lastUpdated = lastUpdated,
        _monthStats = monthStats;

  // "todayStats" field.
  TodayStatsStruct? _todayStats;
  TodayStatsStruct get todayStats => _todayStats ?? TodayStatsStruct();
  set todayStats(TodayStatsStruct? val) => _todayStats = val;

  void updateTodayStats(Function(TodayStatsStruct) updateFn) {
    updateFn(_todayStats ??= TodayStatsStruct());
  }

  bool hasTodayStats() => _todayStats != null;

  // "weekStats" field.
  WeekStatsStruct? _weekStats;
  WeekStatsStruct get weekStats => _weekStats ?? WeekStatsStruct();
  set weekStats(WeekStatsStruct? val) => _weekStats = val;

  void updateWeekStats(Function(WeekStatsStruct) updateFn) {
    updateFn(_weekStats ??= WeekStatsStruct());
  }

  bool hasWeekStats() => _weekStats != null;

  // "monthForwardStats" field.
  MonthForwardStatsStruct? _monthForwardStats;
  MonthForwardStatsStruct get monthForwardStats =>
      _monthForwardStats ?? MonthForwardStatsStruct();
  set monthForwardStats(MonthForwardStatsStruct? val) =>
      _monthForwardStats = val;

  void updateMonthForwardStats(Function(MonthForwardStatsStruct) updateFn) {
    updateFn(_monthForwardStats ??= MonthForwardStatsStruct());
  }

  bool hasMonthForwardStats() => _monthForwardStats != null;

  // "monthBackwardStats" field.
  MonthBackwardStatsStruct? _monthBackwardStats;
  MonthBackwardStatsStruct get monthBackwardStats =>
      _monthBackwardStats ?? MonthBackwardStatsStruct();
  set monthBackwardStats(MonthBackwardStatsStruct? val) =>
      _monthBackwardStats = val;

  void updateMonthBackwardStats(Function(MonthBackwardStatsStruct) updateFn) {
    updateFn(_monthBackwardStats ??= MonthBackwardStatsStruct());
  }

  bool hasMonthBackwardStats() => _monthBackwardStats != null;

  // "lastUpdated" field.
  String? _lastUpdated;
  String get lastUpdated => _lastUpdated ?? '';
  set lastUpdated(String? val) => _lastUpdated = val;

  bool hasLastUpdated() => _lastUpdated != null;

  // "monthStats" field.
  MonthStatsStruct? _monthStats;
  MonthStatsStruct get monthStats => _monthStats ?? MonthStatsStruct();
  set monthStats(MonthStatsStruct? val) => _monthStats = val;

  void updateMonthStats(Function(MonthStatsStruct) updateFn) {
    updateFn(_monthStats ??= MonthStatsStruct());
  }

  bool hasMonthStats() => _monthStats != null;

  static AppointmentsPageDataStruct fromMap(Map<String, dynamic> data) =>
      AppointmentsPageDataStruct(
        todayStats: data['todayStats'] is TodayStatsStruct
            ? data['todayStats']
            : TodayStatsStruct.maybeFromMap(data['todayStats']),
        weekStats: data['weekStats'] is WeekStatsStruct
            ? data['weekStats']
            : WeekStatsStruct.maybeFromMap(data['weekStats']),
        monthForwardStats: data['monthForwardStats'] is MonthForwardStatsStruct
            ? data['monthForwardStats']
            : MonthForwardStatsStruct.maybeFromMap(data['monthForwardStats']),
        monthBackwardStats: data['monthBackwardStats']
                is MonthBackwardStatsStruct
            ? data['monthBackwardStats']
            : MonthBackwardStatsStruct.maybeFromMap(data['monthBackwardStats']),
        lastUpdated: data['lastUpdated'] as String?,
        monthStats: data['monthStats'] is MonthStatsStruct
            ? data['monthStats']
            : MonthStatsStruct.maybeFromMap(data['monthStats']),
      );

  static AppointmentsPageDataStruct? maybeFromMap(dynamic data) => data is Map
      ? AppointmentsPageDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'todayStats': _todayStats?.toMap(),
        'weekStats': _weekStats?.toMap(),
        'monthForwardStats': _monthForwardStats?.toMap(),
        'monthBackwardStats': _monthBackwardStats?.toMap(),
        'lastUpdated': _lastUpdated,
        'monthStats': _monthStats?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'todayStats': serializeParam(
          _todayStats,
          ParamType.DataStruct,
        ),
        'weekStats': serializeParam(
          _weekStats,
          ParamType.DataStruct,
        ),
        'monthForwardStats': serializeParam(
          _monthForwardStats,
          ParamType.DataStruct,
        ),
        'monthBackwardStats': serializeParam(
          _monthBackwardStats,
          ParamType.DataStruct,
        ),
        'lastUpdated': serializeParam(
          _lastUpdated,
          ParamType.String,
        ),
        'monthStats': serializeParam(
          _monthStats,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AppointmentsPageDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AppointmentsPageDataStruct(
        todayStats: deserializeStructParam(
          data['todayStats'],
          ParamType.DataStruct,
          false,
          structBuilder: TodayStatsStruct.fromSerializableMap,
        ),
        weekStats: deserializeStructParam(
          data['weekStats'],
          ParamType.DataStruct,
          false,
          structBuilder: WeekStatsStruct.fromSerializableMap,
        ),
        monthForwardStats: deserializeStructParam(
          data['monthForwardStats'],
          ParamType.DataStruct,
          false,
          structBuilder: MonthForwardStatsStruct.fromSerializableMap,
        ),
        monthBackwardStats: deserializeStructParam(
          data['monthBackwardStats'],
          ParamType.DataStruct,
          false,
          structBuilder: MonthBackwardStatsStruct.fromSerializableMap,
        ),
        lastUpdated: deserializeParam(
          data['lastUpdated'],
          ParamType.String,
          false,
        ),
        monthStats: deserializeStructParam(
          data['monthStats'],
          ParamType.DataStruct,
          false,
          structBuilder: MonthStatsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AppointmentsPageDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppointmentsPageDataStruct &&
        todayStats == other.todayStats &&
        weekStats == other.weekStats &&
        monthForwardStats == other.monthForwardStats &&
        monthBackwardStats == other.monthBackwardStats &&
        lastUpdated == other.lastUpdated &&
        monthStats == other.monthStats;
  }

  @override
  int get hashCode => const ListEquality().hash([
        todayStats,
        weekStats,
        monthForwardStats,
        monthBackwardStats,
        lastUpdated,
        monthStats
      ]);
}

AppointmentsPageDataStruct createAppointmentsPageDataStruct({
  TodayStatsStruct? todayStats,
  WeekStatsStruct? weekStats,
  MonthForwardStatsStruct? monthForwardStats,
  MonthBackwardStatsStruct? monthBackwardStats,
  String? lastUpdated,
  MonthStatsStruct? monthStats,
}) =>
    AppointmentsPageDataStruct(
      todayStats: todayStats ?? TodayStatsStruct(),
      weekStats: weekStats ?? WeekStatsStruct(),
      monthForwardStats: monthForwardStats ?? MonthForwardStatsStruct(),
      monthBackwardStats: monthBackwardStats ?? MonthBackwardStatsStruct(),
      lastUpdated: lastUpdated,
      monthStats: monthStats ?? MonthStatsStruct(),
    );
