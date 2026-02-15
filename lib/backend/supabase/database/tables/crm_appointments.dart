import '../database.dart';

class CrmAppointmentsTable extends SupabaseTable<CrmAppointmentsRow> {
  @override
  String get tableName => 'crm_appointments';

  @override
  CrmAppointmentsRow createRow(Map<String, dynamic> data) =>
      CrmAppointmentsRow(data);
}

class CrmAppointmentsRow extends SupabaseDataRow {
  CrmAppointmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CrmAppointmentsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get organizationId => getField<String>('organization_id')!;
  set organizationId(String value) =>
      setField<String>('organization_id', value);

  String get clientId => getField<String>('client_id')!;
  set clientId(String value) => setField<String>('client_id', value);

  String get masterId => getField<String>('master_id')!;
  set masterId(String value) => setField<String>('master_id', value);

  String get serviceId => getField<String>('service_id')!;
  set serviceId(String value) => setField<String>('service_id', value);

  DateTime get appointmentDate => getField<DateTime>('appointment_date')!;
  set appointmentDate(DateTime value) =>
      setField<DateTime>('appointment_date', value);

  PostgresTime get appointmentTime =>
      getField<PostgresTime>('appointment_time')!;
  set appointmentTime(PostgresTime value) =>
      setField<PostgresTime>('appointment_time', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
