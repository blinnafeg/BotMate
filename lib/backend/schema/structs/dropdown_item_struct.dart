// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DropdownItemStruct extends BaseStruct {
  DropdownItemStruct({
    String? id,
    String? name,
    String? phone,
  })  : _id = id,
        _name = name,
        _phone = phone;

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

  static DropdownItemStruct fromMap(Map<String, dynamic> data) =>
      DropdownItemStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        phone: data['phone'] as String?,
      );

  static DropdownItemStruct? maybeFromMap(dynamic data) => data is Map
      ? DropdownItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'phone': _phone,
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
      }.withoutNulls;

  static DropdownItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      DropdownItemStruct(
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
      );

  @override
  String toString() => 'DropdownItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DropdownItemStruct &&
        id == other.id &&
        name == other.name &&
        phone == other.phone;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, phone]);
}

DropdownItemStruct createDropdownItemStruct({
  String? id,
  String? name,
  String? phone,
}) =>
    DropdownItemStruct(
      id: id,
      name: name,
      phone: phone,
    );
