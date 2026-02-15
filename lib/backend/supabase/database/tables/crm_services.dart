import '../database.dart';

class CrmServicesTable extends SupabaseTable<CrmServicesRow> {
  @override
  String get tableName => 'crm_services';

  @override
  CrmServicesRow createRow(Map<String, dynamic> data) => CrmServicesRow(data);
}

class CrmServicesRow extends SupabaseDataRow {
  CrmServicesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CrmServicesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get organizationId => getField<String>('organization_id')!;
  set organizationId(String value) =>
      setField<String>('organization_id', value);

  String? get categoryId => getField<String>('category_id');
  set categoryId(String? value) => setField<String>('category_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int get durationMin => getField<int>('duration_min')!;
  set durationMin(int value) => setField<int>('duration_min', value);

  double get price => getField<double>('price')!;
  set price(double value) => setField<double>('price', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  bool? get onlineBookingEnabled => getField<bool>('online_booking_enabled');
  set onlineBookingEnabled(bool? value) =>
      setField<bool>('online_booking_enabled', value);

  int? get maxDailySlots => getField<int>('max_daily_slots');
  set maxDailySlots(int? value) => setField<int>('max_daily_slots', value);

  bool? get depositRequired => getField<bool>('deposit_required');
  set depositRequired(bool? value) => setField<bool>('deposit_required', value);

  double? get depositAmount => getField<double>('deposit_amount');
  set depositAmount(double? value) => setField<double>('deposit_amount', value);
}
