import '../database.dart';

class CrmMastersTable extends SupabaseTable<CrmMastersRow> {
  @override
  String get tableName => 'crm_masters';

  @override
  CrmMastersRow createRow(Map<String, dynamic> data) => CrmMastersRow(data);
}

class CrmMastersRow extends SupabaseDataRow {
  CrmMastersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CrmMastersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get organizationId => getField<String>('organization_id')!;
  set organizationId(String value) =>
      setField<String>('organization_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  int? get telegramId => getField<int>('telegram_id');
  set telegramId(int? value) => setField<int>('telegram_id', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  List<String> get specialization => getListField<String>('specialization');
  set specialization(List<String>? value) =>
      setListField<String>('specialization', value);
}
