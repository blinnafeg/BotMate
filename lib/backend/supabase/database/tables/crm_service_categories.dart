import '../database.dart';

class CrmServiceCategoriesTable extends SupabaseTable<CrmServiceCategoriesRow> {
  @override
  String get tableName => 'crm_service_categories';

  @override
  CrmServiceCategoriesRow createRow(Map<String, dynamic> data) =>
      CrmServiceCategoriesRow(data);
}

class CrmServiceCategoriesRow extends SupabaseDataRow {
  CrmServiceCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CrmServiceCategoriesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get organizationId => getField<String>('organization_id')!;
  set organizationId(String value) =>
      setField<String>('organization_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
