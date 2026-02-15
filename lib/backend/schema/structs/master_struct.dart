// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MasterStruct extends BaseStruct {
  MasterStruct({
    String? id,
    String? name,
    String? phone,
    String? telegramId,
    List<String>? specialization,
    bool? isActive,
  })  : _id = id,
        _name = name,
        _phone = phone,
        _telegramId = telegramId,
        _specialization = specialization,
        _isActive = isActive;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "telegramId" field.
  String? _telegramId;
  String get telegramId => _telegramId ?? '';
  set telegramId(String? val) => _telegramId = val;

  bool hasTelegramId() => _telegramId != null;

  // "specialization" field.
  List<String>? _specialization;
  List<String> get specialization => _specialization ?? const [];
  set specialization(List<String>? val) => _specialization = val;

  void updateSpecialization(Function(List<String>) updateFn) {
    updateFn(_specialization ??= []);
  }

  bool hasSpecialization() => _specialization != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  set isActive(bool? val) => _isActive = val;

  bool hasIsActive() => _isActive != null;

  static MasterStruct fromMap(Map<String, dynamic> data) => MasterStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        telegramId: data['telegramId'] as String?,
        specialization: getDataList(data['specialization']),
        isActive: data['isActive'] as bool?,
      );

  static MasterStruct? maybeFromMap(dynamic data) =>
      data is Map ? MasterStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'phone': _phone,
        'telegramId': _telegramId,
        'specialization': _specialization,
        'isActive': _isActive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'telegramId': serializeParam(
          _telegramId,
          ParamType.String,
        ),
        'specialization': serializeParam(
          _specialization,
          ParamType.String,
          isList: true,
        ),
        'isActive': serializeParam(
          _isActive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MasterStruct fromSerializableMap(Map<String, dynamic> data) =>
      MasterStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        telegramId: deserializeParam(
          data['telegramId'],
          ParamType.String,
          false,
        ),
        specialization: deserializeParam<String>(
          data['specialization'],
          ParamType.String,
          true,
        ),
        isActive: deserializeParam(
          data['isActive'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MasterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MasterStruct &&
        id == other.id &&
        name == other.name &&
        phone == other.phone &&
        telegramId == other.telegramId &&
        listEquality.equals(specialization, other.specialization) &&
        isActive == other.isActive;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, phone, telegramId, specialization, isActive]);
}

MasterStruct createMasterStruct({
  String? id,
  String? name,
  String? phone,
  String? telegramId,
  bool? isActive,
}) =>
    MasterStruct(
      id: id,
      name: name,
      phone: phone,
      telegramId: telegramId,
      isActive: isActive,
    );
