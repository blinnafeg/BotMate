// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientStruct extends BaseStruct {
  ClientStruct({
    String? id,
    String? name,
    String? phone,
    String? telegramId,
    String? createdAt,
  })  : _id = id,
        _name = name,
        _phone = phone,
        _telegramId = telegramId,
        _createdAt = createdAt;

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

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static ClientStruct fromMap(Map<String, dynamic> data) => ClientStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        telegramId: data['telegramId'] as String?,
        createdAt: data['createdAt'] as String?,
      );

  static ClientStruct? maybeFromMap(dynamic data) =>
      data is Map ? ClientStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'phone': _phone,
        'telegramId': _telegramId,
        'createdAt': _createdAt,
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
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClientStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClientStruct(
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
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClientStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClientStruct &&
        id == other.id &&
        name == other.name &&
        phone == other.phone &&
        telegramId == other.telegramId &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, phone, telegramId, createdAt]);
}

ClientStruct createClientStruct({
  String? id,
  String? name,
  String? phone,
  String? telegramId,
  String? createdAt,
}) =>
    ClientStruct(
      id: id,
      name: name,
      phone: phone,
      telegramId: telegramId,
      createdAt: createdAt,
    );
