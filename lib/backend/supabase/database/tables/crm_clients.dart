import '../database.dart';

class CrmClientsTable extends SupabaseTable<CrmClientsRow> {
  @override
  String get tableName => 'crm_clients';

  @override
  CrmClientsRow createRow(Map<String, dynamic> data) => CrmClientsRow(data);
}

class CrmClientsRow extends SupabaseDataRow {
  CrmClientsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CrmClientsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get telegramId => getField<int>('telegram_id');
  set telegramId(int? value) => setField<int>('telegram_id', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
