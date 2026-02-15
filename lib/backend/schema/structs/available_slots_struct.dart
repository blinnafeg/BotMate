// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvailableSlotsStruct extends BaseStruct {
  AvailableSlotsStruct({
    String? masterId,
    String? masterName,
    MasterWorkHoursStruct? masterWorkHours,
    List<OccupiedIntervalsStruct>? occupiedIntervals,
  })  : _masterId = masterId,
        _masterName = masterName,
        _masterWorkHours = masterWorkHours,
        _occupiedIntervals = occupiedIntervals;

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

  // "masterWorkHours" field.
  MasterWorkHoursStruct? _masterWorkHours;
  MasterWorkHoursStruct get masterWorkHours =>
      _masterWorkHours ?? MasterWorkHoursStruct();
  set masterWorkHours(MasterWorkHoursStruct? val) => _masterWorkHours = val;

  void updateMasterWorkHours(Function(MasterWorkHoursStruct) updateFn) {
    updateFn(_masterWorkHours ??= MasterWorkHoursStruct());
  }

  bool hasMasterWorkHours() => _masterWorkHours != null;

  // "occupiedIntervals" field.
  List<OccupiedIntervalsStruct>? _occupiedIntervals;
  List<OccupiedIntervalsStruct> get occupiedIntervals =>
      _occupiedIntervals ?? const [];
  set occupiedIntervals(List<OccupiedIntervalsStruct>? val) =>
      _occupiedIntervals = val;

  void updateOccupiedIntervals(
      Function(List<OccupiedIntervalsStruct>) updateFn) {
    updateFn(_occupiedIntervals ??= []);
  }

  bool hasOccupiedIntervals() => _occupiedIntervals != null;

  static AvailableSlotsStruct fromMap(Map<String, dynamic> data) =>
      AvailableSlotsStruct(
        masterId: data['masterId'] as String?,
        masterName: data['masterName'] as String?,
        masterWorkHours: data['masterWorkHours'] is MasterWorkHoursStruct
            ? data['masterWorkHours']
            : MasterWorkHoursStruct.maybeFromMap(data['masterWorkHours']),
        occupiedIntervals: getStructList(
          data['occupiedIntervals'],
          OccupiedIntervalsStruct.fromMap,
        ),
      );

  static AvailableSlotsStruct? maybeFromMap(dynamic data) => data is Map
      ? AvailableSlotsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'masterId': _masterId,
        'masterName': _masterName,
        'masterWorkHours': _masterWorkHours?.toMap(),
        'occupiedIntervals': _occupiedIntervals?.map((e) => e.toMap()).toList(),
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
        'masterWorkHours': serializeParam(
          _masterWorkHours,
          ParamType.DataStruct,
        ),
        'occupiedIntervals': serializeParam(
          _occupiedIntervals,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AvailableSlotsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvailableSlotsStruct(
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
        masterWorkHours: deserializeStructParam(
          data['masterWorkHours'],
          ParamType.DataStruct,
          false,
          structBuilder: MasterWorkHoursStruct.fromSerializableMap,
        ),
        occupiedIntervals: deserializeStructParam<OccupiedIntervalsStruct>(
          data['occupiedIntervals'],
          ParamType.DataStruct,
          true,
          structBuilder: OccupiedIntervalsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AvailableSlotsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AvailableSlotsStruct &&
        masterId == other.masterId &&
        masterName == other.masterName &&
        masterWorkHours == other.masterWorkHours &&
        listEquality.equals(occupiedIntervals, other.occupiedIntervals);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([masterId, masterName, masterWorkHours, occupiedIntervals]);
}

AvailableSlotsStruct createAvailableSlotsStruct({
  String? masterId,
  String? masterName,
  MasterWorkHoursStruct? masterWorkHours,
}) =>
    AvailableSlotsStruct(
      masterId: masterId,
      masterName: masterName,
      masterWorkHours: masterWorkHours ?? MasterWorkHoursStruct(),
    );
