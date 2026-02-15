import '../database.dart';

class CrmMasterScheduleTable extends SupabaseTable<CrmMasterScheduleRow> {
  @override
  String get tableName => 'crm_master_schedule';

  @override
  CrmMasterScheduleRow createRow(Map<String, dynamic> data) =>
      CrmMasterScheduleRow(data);
}

class CrmMasterScheduleRow extends SupabaseDataRow {
  CrmMasterScheduleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CrmMasterScheduleTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get masterId => getField<String>('master_id')!;
  set masterId(String value) => setField<String>('master_id', value);

  int get dayOfWeek => getField<int>('day_of_week')!;
  set dayOfWeek(int value) => setField<int>('day_of_week', value);

  PostgresTime get startTime => getField<PostgresTime>('start_time')!;
  set startTime(PostgresTime value) =>
      setField<PostgresTime>('start_time', value);

  PostgresTime get endTime => getField<PostgresTime>('end_time')!;
  set endTime(PostgresTime value) => setField<PostgresTime>('end_time', value);

  PostgresTime? get breakStart => getField<PostgresTime>('break_start');
  set breakStart(PostgresTime? value) =>
      setField<PostgresTime>('break_start', value);

  PostgresTime? get breakEnd => getField<PostgresTime>('break_end');
  set breakEnd(PostgresTime? value) =>
      setField<PostgresTime>('break_end', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
