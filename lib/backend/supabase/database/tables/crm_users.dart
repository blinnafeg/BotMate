import '../database.dart';

class CrmUsersTable extends SupabaseTable<CrmUsersRow> {
  @override
  String get tableName => 'crm_users';

  @override
  CrmUsersRow createRow(Map<String, dynamic> data) => CrmUsersRow(data);
}

class CrmUsersRow extends SupabaseDataRow {
  CrmUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CrmUsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get fullName => getField<String>('full_name')!;
  set fullName(String value) => setField<String>('full_name', value);

  String get role => getField<String>('role')!;
  set role(String value) => setField<String>('role', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String? get organizationId => getField<String>('organization_id');
  set organizationId(String? value) =>
      setField<String>('organization_id', value);

  String get hashedPassword => getField<String>('hashed_password')!;
  set hashedPassword(String value) =>
      setField<String>('hashed_password', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get telegramUsername => getField<String>('telegram_username');
  set telegramUsername(String? value) =>
      setField<String>('telegram_username', value);

  DateTime? get lastLoginAt => getField<DateTime>('last_login_at');
  set lastLoginAt(DateTime? value) =>
      setField<DateTime>('last_login_at', value);
}
