// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingFormDataStruct extends BaseStruct {
  BookingFormDataStruct({
    List<ServiceStruct>? servicesList,
    List<ServiceStruct>? selectedServices,
    List<MasterStruct>? mastersList,
    List<MasterStruct>? selectedMasters,
    List<ClientStruct>? clientsList,
    List<ClientStruct>? selectedClient,
    List<String>? availableSlots,
    List<String>? selectedSlot,
    List<String>? selectedDate,
    bool? calendarWeekView,
  })  : _servicesList = servicesList,
        _selectedServices = selectedServices,
        _mastersList = mastersList,
        _selectedMasters = selectedMasters,
        _clientsList = clientsList,
        _selectedClient = selectedClient,
        _availableSlots = availableSlots,
        _selectedSlot = selectedSlot,
        _selectedDate = selectedDate,
        _calendarWeekView = calendarWeekView;

  // "servicesList" field.
  List<ServiceStruct>? _servicesList;
  List<ServiceStruct> get servicesList => _servicesList ?? const [];
  set servicesList(List<ServiceStruct>? val) => _servicesList = val;

  void updateServicesList(Function(List<ServiceStruct>) updateFn) {
    updateFn(_servicesList ??= []);
  }

  bool hasServicesList() => _servicesList != null;

  // "selectedServices" field.
  List<ServiceStruct>? _selectedServices;
  List<ServiceStruct> get selectedServices => _selectedServices ?? const [];
  set selectedServices(List<ServiceStruct>? val) => _selectedServices = val;

  void updateSelectedServices(Function(List<ServiceStruct>) updateFn) {
    updateFn(_selectedServices ??= []);
  }

  bool hasSelectedServices() => _selectedServices != null;

  // "mastersList" field.
  List<MasterStruct>? _mastersList;
  List<MasterStruct> get mastersList => _mastersList ?? const [];
  set mastersList(List<MasterStruct>? val) => _mastersList = val;

  void updateMastersList(Function(List<MasterStruct>) updateFn) {
    updateFn(_mastersList ??= []);
  }

  bool hasMastersList() => _mastersList != null;

  // "selectedMasters" field.
  List<MasterStruct>? _selectedMasters;
  List<MasterStruct> get selectedMasters => _selectedMasters ?? const [];
  set selectedMasters(List<MasterStruct>? val) => _selectedMasters = val;

  void updateSelectedMasters(Function(List<MasterStruct>) updateFn) {
    updateFn(_selectedMasters ??= []);
  }

  bool hasSelectedMasters() => _selectedMasters != null;

  // "clientsList" field.
  List<ClientStruct>? _clientsList;
  List<ClientStruct> get clientsList => _clientsList ?? const [];
  set clientsList(List<ClientStruct>? val) => _clientsList = val;

  void updateClientsList(Function(List<ClientStruct>) updateFn) {
    updateFn(_clientsList ??= []);
  }

  bool hasClientsList() => _clientsList != null;

  // "selectedClient" field.
  List<ClientStruct>? _selectedClient;
  List<ClientStruct> get selectedClient => _selectedClient ?? const [];
  set selectedClient(List<ClientStruct>? val) => _selectedClient = val;

  void updateSelectedClient(Function(List<ClientStruct>) updateFn) {
    updateFn(_selectedClient ??= []);
  }

  bool hasSelectedClient() => _selectedClient != null;

  // "availableSlots" field.
  List<String>? _availableSlots;
  List<String> get availableSlots => _availableSlots ?? const [];
  set availableSlots(List<String>? val) => _availableSlots = val;

  void updateAvailableSlots(Function(List<String>) updateFn) {
    updateFn(_availableSlots ??= []);
  }

  bool hasAvailableSlots() => _availableSlots != null;

  // "selectedSlot" field.
  List<String>? _selectedSlot;
  List<String> get selectedSlot => _selectedSlot ?? const [];
  set selectedSlot(List<String>? val) => _selectedSlot = val;

  void updateSelectedSlot(Function(List<String>) updateFn) {
    updateFn(_selectedSlot ??= []);
  }

  bool hasSelectedSlot() => _selectedSlot != null;

  // "selectedDate" field.
  List<String>? _selectedDate;
  List<String> get selectedDate => _selectedDate ?? const [];
  set selectedDate(List<String>? val) => _selectedDate = val;

  void updateSelectedDate(Function(List<String>) updateFn) {
    updateFn(_selectedDate ??= []);
  }

  bool hasSelectedDate() => _selectedDate != null;

  // "calendarWeekView" field.
  bool? _calendarWeekView;
  bool get calendarWeekView => _calendarWeekView ?? false;
  set calendarWeekView(bool? val) => _calendarWeekView = val;

  bool hasCalendarWeekView() => _calendarWeekView != null;

  static BookingFormDataStruct fromMap(Map<String, dynamic> data) =>
      BookingFormDataStruct(
        servicesList: getStructList(
          data['servicesList'],
          ServiceStruct.fromMap,
        ),
        selectedServices: getStructList(
          data['selectedServices'],
          ServiceStruct.fromMap,
        ),
        mastersList: getStructList(
          data['mastersList'],
          MasterStruct.fromMap,
        ),
        selectedMasters: getStructList(
          data['selectedMasters'],
          MasterStruct.fromMap,
        ),
        clientsList: getStructList(
          data['clientsList'],
          ClientStruct.fromMap,
        ),
        selectedClient: getStructList(
          data['selectedClient'],
          ClientStruct.fromMap,
        ),
        availableSlots: getDataList(data['availableSlots']),
        selectedSlot: getDataList(data['selectedSlot']),
        selectedDate: getDataList(data['selectedDate']),
        calendarWeekView: data['calendarWeekView'] as bool?,
      );

  static BookingFormDataStruct? maybeFromMap(dynamic data) => data is Map
      ? BookingFormDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'servicesList': _servicesList?.map((e) => e.toMap()).toList(),
        'selectedServices': _selectedServices?.map((e) => e.toMap()).toList(),
        'mastersList': _mastersList?.map((e) => e.toMap()).toList(),
        'selectedMasters': _selectedMasters?.map((e) => e.toMap()).toList(),
        'clientsList': _clientsList?.map((e) => e.toMap()).toList(),
        'selectedClient': _selectedClient?.map((e) => e.toMap()).toList(),
        'availableSlots': _availableSlots,
        'selectedSlot': _selectedSlot,
        'selectedDate': _selectedDate,
        'calendarWeekView': _calendarWeekView,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'servicesList': serializeParam(
          _servicesList,
          ParamType.DataStruct,
          isList: true,
        ),
        'selectedServices': serializeParam(
          _selectedServices,
          ParamType.DataStruct,
          isList: true,
        ),
        'mastersList': serializeParam(
          _mastersList,
          ParamType.DataStruct,
          isList: true,
        ),
        'selectedMasters': serializeParam(
          _selectedMasters,
          ParamType.DataStruct,
          isList: true,
        ),
        'clientsList': serializeParam(
          _clientsList,
          ParamType.DataStruct,
          isList: true,
        ),
        'selectedClient': serializeParam(
          _selectedClient,
          ParamType.DataStruct,
          isList: true,
        ),
        'availableSlots': serializeParam(
          _availableSlots,
          ParamType.String,
          isList: true,
        ),
        'selectedSlot': serializeParam(
          _selectedSlot,
          ParamType.String,
          isList: true,
        ),
        'selectedDate': serializeParam(
          _selectedDate,
          ParamType.String,
          isList: true,
        ),
        'calendarWeekView': serializeParam(
          _calendarWeekView,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BookingFormDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookingFormDataStruct(
        servicesList: deserializeStructParam<ServiceStruct>(
          data['servicesList'],
          ParamType.DataStruct,
          true,
          structBuilder: ServiceStruct.fromSerializableMap,
        ),
        selectedServices: deserializeStructParam<ServiceStruct>(
          data['selectedServices'],
          ParamType.DataStruct,
          true,
          structBuilder: ServiceStruct.fromSerializableMap,
        ),
        mastersList: deserializeStructParam<MasterStruct>(
          data['mastersList'],
          ParamType.DataStruct,
          true,
          structBuilder: MasterStruct.fromSerializableMap,
        ),
        selectedMasters: deserializeStructParam<MasterStruct>(
          data['selectedMasters'],
          ParamType.DataStruct,
          true,
          structBuilder: MasterStruct.fromSerializableMap,
        ),
        clientsList: deserializeStructParam<ClientStruct>(
          data['clientsList'],
          ParamType.DataStruct,
          true,
          structBuilder: ClientStruct.fromSerializableMap,
        ),
        selectedClient: deserializeStructParam<ClientStruct>(
          data['selectedClient'],
          ParamType.DataStruct,
          true,
          structBuilder: ClientStruct.fromSerializableMap,
        ),
        availableSlots: deserializeParam<String>(
          data['availableSlots'],
          ParamType.String,
          true,
        ),
        selectedSlot: deserializeParam<String>(
          data['selectedSlot'],
          ParamType.String,
          true,
        ),
        selectedDate: deserializeParam<String>(
          data['selectedDate'],
          ParamType.String,
          true,
        ),
        calendarWeekView: deserializeParam(
          data['calendarWeekView'],
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
        listEquality.equals(servicesList, other.servicesList) &&
        listEquality.equals(selectedServices, other.selectedServices) &&
        listEquality.equals(mastersList, other.mastersList) &&
        listEquality.equals(selectedMasters, other.selectedMasters) &&
        listEquality.equals(clientsList, other.clientsList) &&
        listEquality.equals(selectedClient, other.selectedClient) &&
        listEquality.equals(availableSlots, other.availableSlots) &&
        listEquality.equals(selectedSlot, other.selectedSlot) &&
        listEquality.equals(selectedDate, other.selectedDate) &&
        calendarWeekView == other.calendarWeekView;
  }

  @override
  int get hashCode => const ListEquality().hash([
        servicesList,
        selectedServices,
        mastersList,
        selectedMasters,
        clientsList,
        selectedClient,
        availableSlots,
        selectedSlot,
        selectedDate,
        calendarWeekView
      ]);
}

BookingFormDataStruct createBookingFormDataStruct({
  bool? calendarWeekView,
}) =>
    BookingFormDataStruct(
      calendarWeekView: calendarWeekView,
    );
