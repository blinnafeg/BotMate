import '../database.dart';

class CrmOrganizationsTable extends SupabaseTable<CrmOrganizationsRow> {
  @override
  String get tableName => 'crm_organizations';

  @override
  CrmOrganizationsRow createRow(Map<String, dynamic> data) =>
      CrmOrganizationsRow(data);
}

class CrmOrganizationsRow extends SupabaseDataRow {
  CrmOrganizationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CrmOrganizationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get subdomain => getField<String>('subdomain')!;
  set subdomain(String value) => setField<String>('subdomain', value);

  String? get ownerId => getField<String>('owner_id');
  set ownerId(String? value) => setField<String>('owner_id', value);

  String? get botToken => getField<String>('bot_token');
  set botToken(String? value) => setField<String>('bot_token', value);

  String? get welcomeMessage => getField<String>('welcome_message');
  set welcomeMessage(String? value) =>
      setField<String>('welcome_message', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get contactPhone => getField<String>('contact_phone');
  set contactPhone(String? value) => setField<String>('contact_phone', value);

  String? get contactEmail => getField<String>('contact_email');
  set contactEmail(String? value) => setField<String>('contact_email', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get botUsername => getField<String>('bot_username');
  set botUsername(String? value) => setField<String>('bot_username', value);

  String? get botWebhookUrl => getField<String>('bot_webhook_url');
  set botWebhookUrl(String? value) =>
      setField<String>('bot_webhook_url', value);

  String? get botStatus => getField<String>('bot_status');
  set botStatus(String? value) => setField<String>('bot_status', value);

  DateTime? get botConnectedAt => getField<DateTime>('bot_connected_at');
  set botConnectedAt(DateTime? value) =>
      setField<DateTime>('bot_connected_at', value);

  dynamic get workHours => getField<dynamic>('work_hours');
  set workHours(dynamic value) => setField<dynamic>('work_hours', value);
}
