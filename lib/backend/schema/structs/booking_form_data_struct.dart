// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingFormDataStruct extends BaseStruct {
  BookingFormDataStruct({
    List<ServiceStruct>? services,
    List<ClientStruct>? clients,
    List<MasterStruct>? mastersForService,
    List<String>? availableSlots,
    String? selectedServiceId,
    String? selectedClientId,
    String? selectedMasterId,
    String? selectedDate,
    String? selectedTime,
    String? notes,
    bool? isLoadingServices,
    bool? isLoadingMasters,
    bool? isLoadingSlots,
    bool? isCreating,
  })  : _services = services,
        _clients = clients,
        _mastersForService = mastersForService,
        _availableSlots = availableSlots,
        _selectedServiceId = selectedServiceId,
        _selectedClientId = selectedClientId,
        _selectedMasterId = selectedMasterId,
        _selectedDate = selectedDate,
        _selectedTime = selectedTime,
        _notes = notes,
        _isLoadingServices = isLoadingServices,
        _isLoadingMasters = isLoadingMasters,
        _isLoadingSlots = isLoadingSlots,
        _isCreating = isCreating;

  // "services" field.
  List<ServiceStruct>? _services;
  List<ServiceStruct> get services => _services ?? const [];
  set services(List<ServiceStruct>? val) => _services = val;

  void updateServices(Function(List<ServiceStruct>) updateFn) {
    updateFn(_services ??= []);
  }

  bool hasServices() => _services != null;

  // "clients" field.
  List<ClientStruct>? _clients;
  List<ClientStruct> get clients => _clients ?? const [];
  set clients(List<ClientStruct>? val) => _clients = val;

  void updateClients(Function(List<ClientStruct>) updateFn) {
    updateFn(_clients ??= []);
  }

  bool hasClients() => _clients != null;

  // "mastersForService" field.
  List<MasterStruct>? _mastersForService;
  List<MasterStruct> get mastersForService => _mastersForService ?? const [];
  set mastersForService(List<MasterStruct>? val) => _mastersForService = val;

  void updateMastersForService(Function(List<MasterStruct>) updateFn) {
    updateFn(_mastersForService ??= []);
  }

  bool hasMastersForService() => _mastersForService != null;

  // "availableSlots" field.
  List<String>? _availableSlots;
  List<String> get availableSlots => _availableSlots ?? const [];
  set availableSlots(List<String>? val) => _availableSlots = val;

  void updateAvailableSlots(Function(List<String>) updateFn) {
    updateFn(_availableSlots ??= []);
  }

  bool hasAvailableSlots() => _availableSlots != null;

  // "selectedServiceId" field.
  String? _selectedServiceId;
  String get selectedServiceId => _selectedServiceId ?? '';
  set selectedServiceId(String? val) => _selectedServiceId = val;

  bool hasSelectedServiceId() => _selectedServiceId != null;

  // "selectedClientId" field.
  String? _selectedClientId;
  String get selectedClientId => _selectedClientId ?? '';
  set selectedClientId(String? val) => _selectedClientId = val;

  bool hasSelectedClientId() => _selectedClientId != null;

  // "selectedMasterId" field.
  String? _selectedMasterId;
  String get selectedMasterId => _selectedMasterId ?? '';
  set selectedMasterId(String? val) => _selectedMasterId = val;

  bool hasSelectedMasterId() => _selectedMasterId != null;

  // "selectedDate" field.
  String? _selectedDate;
  String get selectedDate => _selectedDate ?? '';
  set selectedDate(String? val) => _selectedDate = val;

  bool hasSelectedDate() => _selectedDate != null;

  // "selectedTime" field.
  String? _selectedTime;
  String get selectedTime => _selectedTime ?? '';
  set selectedTime(String? val) => _selectedTime = val;

  bool hasSelectedTime() => _selectedTime != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  // "isLoadingServices" field.
  bool? _isLoadingServices;
  bool get isLoadingServices => _isLoadingServices ?? false;
  set isLoadingServices(bool? val) => _isLoadingServices = val;

  bool hasIsLoadingServices() => _isLoadingServices != null;

  // "isLoadingMasters" field.
  bool? _isLoadingMasters;
  bool get isLoadingMasters => _isLoadingMasters ?? false;
  set isLoadingMasters(bool? val) => _isLoadingMasters = val;

  bool hasIsLoadingMasters() => _isLoadingMasters != null;

  // "isLoadingSlots" field.
  bool? _isLoadingSlots;
  bool get isLoadingSlots => _isLoadingSlots ?? false;
  set isLoadingSlots(bool? val) => _isLoadingSlots = val;

  bool hasIsLoadingSlots() => _isLoadingSlots != null;

  // "isCreating" field.
  bool? _isCreating;
  bool get isCreating => _isCreating ?? false;
  set isCreating(bool? val) => _isCreating = val;

  bool hasIsCreating() => _isCreating != null;

  static BookingFormDataStruct fromMap(Map<String, dynamic> data) =>
      BookingFormDataStruct(
        services: getStructList(
          data['services'],
          ServiceStruct.fromMap,
        ),
        clients: getStructList(
          data['clients'],
          ClientStruct.fromMap,
        ),
        mastersForService: getStructList(
          data['mastersForService'],
          MasterStruct.fromMap,
        ),
        availableSlots: getDataList(data['availableSlots']),
        selectedServiceId: data['selectedServiceId'] as String?,
        selectedClientId: data['selectedClientId'] as String?,
        selectedMasterId: data['selectedMasterId'] as String?,
        selectedDate: data['selectedDate'] as String?,
        selectedTime: data['selectedTime'] as String?,
        notes: data['notes'] as String?,
        isLoadingServices: data['isLoadingServices'] as bool?,
        isLoadingMasters: data['isLoadingMasters'] as bool?,
        isLoadingSlots: data['isLoadingSlots'] as bool?,
        isCreating: data['isCreating'] as bool?,
      );

  static BookingFormDataStruct? maybeFromMap(dynamic data) => data is Map
      ? BookingFormDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'services': _services?.map((e) => e.toMap()).toList(),
        'clients': _clients?.map((e) => e.toMap()).toList(),
        'mastersForService': _mastersForService?.map((e) => e.toMap()).toList(),
        'availableSlots': _availableSlots,
        'selectedServiceId': _selectedServiceId,
        'selectedClientId': _selectedClientId,
        'selectedMasterId': _selectedMasterId,
        'selectedDate': _selectedDate,
        'selectedTime': _selectedTime,
        'notes': _notes,
        'isLoadingServices': _isLoadingServices,
        'isLoadingMasters': _isLoadingMasters,
        'isLoadingSlots': _isLoadingSlots,
        'isCreating': _isCreating,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'services': serializeParam(
          _services,
          ParamType.DataStruct,
          isList: true,
        ),
        'clients': serializeParam(
          _clients,
          ParamType.DataStruct,
          isList: true,
        ),
        'mastersForService': serializeParam(
          _mastersForService,
          ParamType.DataStruct,
          isList: true,
        ),
        'availableSlots': serializeParam(
          _availableSlots,
          ParamType.String,
          isList: true,
        ),
        'selectedServiceId': serializeParam(
          _selectedServiceId,
          ParamType.String,
        ),
        'selectedClientId': serializeParam(
          _selectedClientId,
          ParamType.String,
        ),
        'selectedMasterId': serializeParam(
          _selectedMasterId,
          ParamType.String,
        ),
        'selectedDate': serializeParam(
          _selectedDate,
          ParamType.String,
        ),
        'selectedTime': serializeParam(
          _selectedTime,
          ParamType.String,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'isLoadingServices': serializeParam(
          _isLoadingServices,
          ParamType.bool,
        ),
        'isLoadingMasters': serializeParam(
          _isLoadingMasters,
          ParamType.bool,
        ),
        'isLoadingSlots': serializeParam(
          _isLoadingSlots,
          ParamType.bool,
        ),
        'isCreating': serializeParam(
          _isCreating,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BookingFormDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookingFormDataStruct(
        services: deserializeStructParam<ServiceStruct>(
          data['services'],
          ParamType.DataStruct,
          true,
          structBuilder: ServiceStruct.fromSerializableMap,
        ),
        clients: deserializeStructParam<ClientStruct>(
          data['clients'],
          ParamType.DataStruct,
          true,
          structBuilder: ClientStruct.fromSerializableMap,
        ),
        mastersForService: deserializeStructParam<MasterStruct>(
          data['mastersForService'],
          ParamType.DataStruct,
          true,
          structBuilder: MasterStruct.fromSerializableMap,
        ),
        availableSlots: deserializeParam<String>(
          data['availableSlots'],
          ParamType.String,
          true,
        ),
        selectedServiceId: deserializeParam(
          data['selectedServiceId'],
          ParamType.String,
          false,
        ),
        selectedClientId: deserializeParam(
          data['selectedClientId'],
          ParamType.String,
          false,
        ),
        selectedMasterId: deserializeParam(
          data['selectedMasterId'],
          ParamType.String,
          false,
        ),
        selectedDate: deserializeParam(
          data['selectedDate'],
          ParamType.String,
          false,
        ),
        selectedTime: deserializeParam(
          data['selectedTime'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        isLoadingServices: deserializeParam(
          data['isLoadingServices'],
          ParamType.bool,
          false,
        ),
        isLoadingMasters: deserializeParam(
          data['isLoadingMasters'],
          ParamType.bool,
          false,
        ),
        isLoadingSlots: deserializeParam(
          data['isLoadingSlots'],
          ParamType.bool,
          false,
        ),
        isCreating: deserializeParam(
          data['isCreating'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BookingFormDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BookingFormDataStruct &&
        listEquality.equals(services, other.services) &&
        listEquality.equals(clients, other.clients) &&
        listEquality.equals(mastersForService, other.mastersForService) &&
        listEquality.equals(availableSlots, other.availableSlots) &&
        selectedServiceId == other.selectedServiceId &&
        selectedClientId == other.selectedClientId &&
        selectedMasterId == other.selectedMasterId &&
        selectedDate == other.selectedDate &&
        selectedTime == other.selectedTime &&
        notes == other.notes &&
        isLoadingServices == other.isLoadingServices &&
        isLoadingMasters == other.isLoadingMasters &&
        isLoadingSlots == other.isLoadingSlots &&
        isCreating == other.isCreating;
  }

  @override
  int get hashCode => const ListEquality().hash([
        services,
        clients,
        mastersForService,
        availableSlots,
        selectedServiceId,
        selectedClientId,
        selectedMasterId,
        selectedDate,
        selectedTime,
        notes,
        isLoadingServices,
        isLoadingMasters,
        isLoadingSlots,
        isCreating
      ]);
}

BookingFormDataStruct createBookingFormDataStruct({
  String? selectedServiceId,
  String? selectedClientId,
  String? selectedMasterId,
  String? selectedDate,
  String? selectedTime,
  String? notes,
  bool? isLoadingServices,
  bool? isLoadingMasters,
  bool? isLoadingSlots,
  bool? isCreating,
}) =>
    BookingFormDataStruct(
      selectedServiceId: selectedServiceId,
      selectedClientId: selectedClientId,
      selectedMasterId: selectedMasterId,
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      notes: notes,
      isLoadingServices: isLoadingServices,
      isLoadingMasters: isLoadingMasters,
      isLoadingSlots: isLoadingSlots,
      isCreating: isCreating,
    );
