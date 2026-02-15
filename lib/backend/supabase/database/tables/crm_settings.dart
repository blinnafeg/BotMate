import '../database.dart';

class CrmSettingsTable extends SupabaseTable<CrmSettingsRow> {
  @override
  String get tableName => 'crm_settings';

  @override
  CrmSettingsRow createRow(Map<String, dynamic> data) => CrmSettingsRow(data);
}

class CrmSettingsRow extends SupabaseDataRow {
  CrmSettingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CrmSettingsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get organizationId => getField<String>('organization_id')!;
  set organizationId(String value) =>
      setField<String>('organization_id', value);

  dynamic get workHours => getField<dynamic>('work_hours')!;
  set workHours(dynamic value) => setField<dynamic>('work_hours', value);

  dynamic get bookingSettings => getField<dynamic>('booking_settings')!;
  set bookingSettings(dynamic value) =>
      setField<dynamic>('booking_settings', value);

  dynamic get notificationSettings =>
      getField<dynamic>('notification_settings')!;
  set notificationSettings(dynamic value) =>
      setField<dynamic>('notification_settings', value);

  dynamic get paymentSettings => getField<dynamic>('payment_settings')!;
  set paymentSettings(dynamic value) =>
      setField<dynamic>('payment_settings', value);

  dynamic get uiSettings => getField<dynamic>('ui_settings')!;
  set uiSettings(dynamic value) => setField<dynamic>('ui_settings', value);

  dynamic get integrationSettings => getField<dynamic>('integration_settings')!;
  set integrationSettings(dynamic value) =>
      setField<dynamic>('integration_settings', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);
}
