// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsStruct extends BaseStruct {
  AppointmentsStruct({
    String? id,
    String? appointmentDate,
    String? appointmentTime,
    String? timeInterval,
    String? status,
    String? notes,
    String? createdAt,
    String? updatedAt,
    ServiceStruct? service,
    ClientStruct? client,
    MasterStruct? master,
  })  : _id = id,
        _appointmentDate = appointmentDate,
        _appointmentTime = appointmentTime,
        _timeInterval = timeInterval,
        _status = status,
        _notes = notes,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _service = service,
        _client = client,
        _master = master;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "appointment_date" field.
  String? _appointmentDate;
  String get appointmentDate => _appointmentDate ?? '';
  set appointmentDate(String? val) => _appointmentDate = val;

  bool hasAppointmentDate() => _appointmentDate != null;

  // "appointment_time" field.
  String? _appointmentTime;
  String get appointmentTime => _appointmentTime ?? '';
  set appointmentTime(String? val) => _appointmentTime = val;

  bool hasAppointmentTime() => _appointmentTime != null;

  // "time_interval" field.
  String? _timeInterval;
  String get timeInterval => _timeInterval ?? '';
  set timeInterval(String? val) => _timeInterval = val;

  bool hasTimeInterval() => _timeInterval != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "service" field.
  ServiceStruct? _service;
  ServiceStruct get service => _service ?? ServiceStruct();
  set service(ServiceStruct? val) => _service = val;

  void updateService(Function(ServiceStruct) updateFn) {
    updateFn(_service ??= ServiceStruct());
  }

  bool hasService() => _service != null;

  // "client" field.
  ClientStruct? _client;
  ClientStruct get client => _client ?? ClientStruct();
  set client(ClientStruct? val) => _client = val;

  void updateClient(Function(ClientStruct) updateFn) {
    updateFn(_client ??= ClientStruct());
  }

  bool hasClient() => _client != null;

  // "master" field.
  MasterStruct? _master;
  MasterStruct get master => _master ?? MasterStruct();
  set master(MasterStruct? val) => _master = val;

  void updateMaster(Function(MasterStruct) updateFn) {
    updateFn(_master ??= MasterStruct());
  }

  bool hasMaster() => _master != null;

  static AppointmentsStruct fromMap(Map<String, dynamic> data) =>
      AppointmentsStruct(
        id: data['id'] as String?,
        appointmentDate: data['appointment_date'] as String?,
        appointmentTime: data['appointment_time'] as String?,
        timeInterval: data['time_interval'] as String?,
        status: data['status'] as String?,
        notes: data['notes'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        service: data['service'] is ServiceStruct
            ? data['service']
            : ServiceStruct.maybeFromMap(data['service']),
        client: data['client'] is ClientStruct
            ? data['client']
            : ClientStruct.maybeFromMap(data['client']),
        master: data['master'] is MasterStruct
            ? data['master']
            : MasterStruct.maybeFromMap(data['master']),
      );

  static AppointmentsStruct? maybeFromMap(dynamic data) => data is Map
      ? AppointmentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'appointment_date': _appointmentDate,
        'appointment_time': _appointmentTime,
        'time_interval': _timeInterval,
        'status': _status,
        'notes': _notes,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'service': _service?.toMap(),
        'client': _client?.toMap(),
        'master': _master?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'appointment_date': serializeParam(
          _appointmentDate,
          ParamType.String,
        ),
        'appointment_time': serializeParam(
          _appointmentTime,
          ParamType.String,
        ),
        'time_interval': serializeParam(
          _timeInterval,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'service': serializeParam(
          _service,
          ParamType.DataStruct,
        ),
        'client': serializeParam(
          _client,
          ParamType.DataStruct,
        ),
        'master': serializeParam(
          _master,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AppointmentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppointmentsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        appointmentDate: deserializeParam(
          data['appointment_date'],
          ParamType.String,
          false,
        ),
        appointmentTime: deserializeParam(
          data['appointment_time'],
          ParamType.String,
          false,
        ),
        timeInterval: deserializeParam(
          data['time_interval'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        service: deserializeStructParam(
          data['service'],
          ParamType.DataStruct,
          false,
          structBuilder: ServiceStruct.fromSerializableMap,
        ),
        client: deserializeStructParam(
          data['client'],
          ParamType.DataStruct,
          false,
          structBuilder: ClientStruct.fromSerializableMap,
        ),
        master: deserializeStructParam(
          data['master'],
          ParamType.DataStruct,
          false,
          structBuilder: MasterStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AppointmentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppointmentsStruct &&
        id == other.id &&
        appointmentDate == other.appointmentDate &&
        appointmentTime == other.appointmentTime &&
        timeInterval == other.timeInterval &&
        status == other.status &&
        notes == other.notes &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        service == other.service &&
        client == other.client &&
        master == other.master;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        appointmentDate,
        appointmentTime,
        timeInterval,
        status,
        notes,
        createdAt,
        updatedAt,
        service,
        client,
        master
      ]);
}

AppointmentsStruct createAppointmentsStruct({
  String? id,
  String? appointmentDate,
  String? appointmentTime,
  String? timeInterval,
  String? status,
  String? notes,
  String? createdAt,
  String? updatedAt,
  ServiceStruct? service,
  ClientStruct? client,
  MasterStruct? master,
}) =>
    AppointmentsStruct(
      id: id,
      appointmentDate: appointmentDate,
      appointmentTime: appointmentTime,
      timeInterval: timeInterval,
      status: status,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
      service: service ?? ServiceStruct(),
      client: client ?? ClientStruct(),
      master: master ?? MasterStruct(),
    );
