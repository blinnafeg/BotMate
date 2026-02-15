import '../database.dart';

class CrmMasterServicesTable extends SupabaseTable<CrmMasterServicesRow> {
  @override
  String get tableName => 'crm_master_services';

  @override
  CrmMasterServicesRow createRow(Map<String, dynamic> data) =>
      CrmMasterServicesRow(data);
}

class CrmMasterServicesRow extends SupabaseDataRow {
  CrmMasterServicesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CrmMasterServicesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get masterId => getField<String>('master_id')!;
  set masterId(String value) => setField<String>('master_id', value);

  String get serviceId => getField<String>('service_id')!;
  set serviceId(String value) => setField<String>('service_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
