// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceStruct extends BaseStruct {
  ServiceStruct({
    String? id,
    String? name,
    String? description,
    int? durationMin,
    int? bufferTimeMin,
    int? price,
    String? photoUrl,
    String? categoryId,
    String? categoryName,
    String? categoryIcon,
    bool? onlineBookingEnabled,
    bool? depositRequired,
    int? depositAmount,
  })  : _id = id,
        _name = name,
        _description = description,
        _durationMin = durationMin,
        _bufferTimeMin = bufferTimeMin,
        _price = price,
        _photoUrl = photoUrl,
        _categoryId = categoryId,
        _categoryName = categoryName,
        _categoryIcon = categoryIcon,
        _onlineBookingEnabled = onlineBookingEnabled,
        _depositRequired = depositRequired,
        _depositAmount = depositAmount;

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "duration_min" field.
  int? _durationMin;
  int get durationMin => _durationMin ?? 0;
  set durationMin(int? val) => _durationMin = val;

  void incrementDurationMin(int amount) => durationMin = durationMin + amount;

  bool hasDurationMin() => _durationMin != null;

  // "bufferTimeMin" field.
  int? _bufferTimeMin;
  int get bufferTimeMin => _bufferTimeMin ?? 0;
  set bufferTimeMin(int? val) => _bufferTimeMin = val;

  void incrementBufferTimeMin(int amount) =>
      bufferTimeMin = bufferTimeMin + amount;

  bool hasBufferTimeMin() => _bufferTimeMin != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "categoryId" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  set categoryId(String? val) => _categoryId = val;

  bool hasCategoryId() => _categoryId != null;

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  set categoryName(String? val) => _categoryName = val;

  bool hasCategoryName() => _categoryName != null;

  // "categoryIcon" field.
  String? _categoryIcon;
  String get categoryIcon => _categoryIcon ?? '';
  set categoryIcon(String? val) => _categoryIcon = val;

  bool hasCategoryIcon() => _categoryIcon != null;

  // "onlineBookingEnabled" field.
  bool? _onlineBookingEnabled;
  bool get onlineBookingEnabled => _onlineBookingEnabled ?? false;
  set onlineBookingEnabled(bool? val) => _onlineBookingEnabled = val;

  bool hasOnlineBookingEnabled() => _onlineBookingEnabled != null;

  // "depositRequired" field.
  bool? _depositRequired;
  bool get depositRequired => _depositRequired ?? false;
  set depositRequired(bool? val) => _depositRequired = val;

  bool hasDepositRequired() => _depositRequired != null;

  // "depositAmount" field.
  int? _depositAmount;
  int get depositAmount => _depositAmount ?? 0;
  set depositAmount(int? val) => _depositAmount = val;

  void incrementDepositAmount(int amount) =>
      depositAmount = depositAmount + amount;

  bool hasDepositAmount() => _depositAmount != null;

  static ServiceStruct fromMap(Map<String, dynamic> data) => ServiceStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        durationMin: castToType<int>(data['duration_min']),
        bufferTimeMin: castToType<int>(data['bufferTimeMin']),
        price: castToType<int>(data['price']),
        photoUrl: data['photoUrl'] as String?,
        categoryId: data['categoryId'] as String?,
        categoryName: data['categoryName'] as String?,
        categoryIcon: data['categoryIcon'] as String?,
        onlineBookingEnabled: data['onlineBookingEnabled'] as bool?,
        depositRequired: data['depositRequired'] as bool?,
        depositAmount: castToType<int>(data['depositAmount']),
      );

  static ServiceStruct? maybeFromMap(dynamic data) =>
      data is Map ? ServiceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'duration_min': _durationMin,
        'bufferTimeMin': _bufferTimeMin,
        'price': _price,
        'photoUrl': _photoUrl,
        'categoryId': _categoryId,
        'categoryName': _categoryName,
        'categoryIcon': _categoryIcon,
        'onlineBookingEnabled': _onlineBookingEnabled,
        'depositRequired': _depositRequired,
        'depositAmount': _depositAmount,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'duration_min': serializeParam(
          _durationMin,
          ParamType.int,
        ),
        'bufferTimeMin': serializeParam(
          _bufferTimeMin,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'photoUrl': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'categoryId': serializeParam(
          _categoryId,
          ParamType.String,
        ),
        'categoryName': serializeParam(
          _categoryName,
          ParamType.String,
        ),
        'categoryIcon': serializeParam(
          _categoryIcon,
          ParamType.String,
        ),
        'onlineBookingEnabled': serializeParam(
          _onlineBookingEnabled,
          ParamType.bool,
        ),
        'depositRequired': serializeParam(
          _depositRequired,
          ParamType.bool,
        ),
        'depositAmount': serializeParam(
          _depositAmount,
          ParamType.int,
        ),
      }.withoutNulls;

  static ServiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServiceStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        durationMin: deserializeParam(
          data['duration_min'],
          ParamType.int,
          false,
        ),
        bufferTimeMin: deserializeParam(
          data['bufferTimeMin'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        photoUrl: deserializeParam(
          data['photoUrl'],
          ParamType.String,
          false,
        ),
        categoryId: deserializeParam(
          data['categoryId'],
          ParamType.String,
          false,
        ),
        categoryName: deserializeParam(
          data['categoryName'],
          ParamType.String,
          false,
        ),
        categoryIcon: deserializeParam(
          data['categoryIcon'],
          ParamType.String,
          false,
        ),
        onlineBookingEnabled: deserializeParam(
          data['onlineBookingEnabled'],
          ParamType.bool,
          false,
        ),
        depositRequired: deserializeParam(
          data['depositRequired'],
          ParamType.bool,
          false,
        ),
        depositAmount: deserializeParam(
          data['depositAmount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiceStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        durationMin == other.durationMin &&
        bufferTimeMin == other.bufferTimeMin &&
        price == other.price &&
        photoUrl == other.photoUrl &&
        categoryId == other.categoryId &&
        categoryName == other.categoryName &&
        categoryIcon == other.categoryIcon &&
        onlineBookingEnabled == other.onlineBookingEnabled &&
        depositRequired == other.depositRequired &&
        depositAmount == other.depositAmount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        description,
        durationMin,
        bufferTimeMin,
        price,
        photoUrl,
        categoryId,
        categoryName,
        categoryIcon,
        onlineBookingEnabled,
        depositRequired,
        depositAmount
      ]);
}

ServiceStruct createServiceStruct({
  String? id,
  String? name,
  String? description,
  int? durationMin,
  int? bufferTimeMin,
  int? price,
  String? photoUrl,
  String? categoryId,
  String? categoryName,
  String? categoryIcon,
  bool? onlineBookingEnabled,
  bool? depositRequired,
  int? depositAmount,
}) =>
    ServiceStruct(
      id: id,
      name: name,
      description: description,
      durationMin: durationMin,
      bufferTimeMin: bufferTimeMin,
      price: price,
      photoUrl: photoUrl,
      categoryId: categoryId,
      categoryName: categoryName,
      categoryIcon: categoryIcon,
      onlineBookingEnabled: onlineBookingEnabled,
      depositRequired: depositRequired,
      depositAmount: depositAmount,
    );
