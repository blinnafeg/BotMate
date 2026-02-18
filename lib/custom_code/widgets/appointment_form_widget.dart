// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:intl/intl.dart';

// Явно импортируем actions и functions
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;

class AppointmentFormWidget extends StatefulWidget {
  const AppointmentFormWidget({
    super.key,
    this.width,
    this.height,
    required this.initialStep,
    this.onAppointmentCreated,
    required this.organizationId,
  });

  final double? width;
  final double? height;
  final String initialStep;
  final Future Function()? onAppointmentCreated;
  final String organizationId;

  @override
  State<AppointmentFormWidget> createState() => _AppointmentFormWidgetState();
}

class _AppointmentFormWidgetState extends State<AppointmentFormWidget> {
  late String _currentStep;
  bool _isLoading = false;
  String _searchText = '';

  // Получаем доступ к WIDGETS-DATA через геттер
  WIDGETSDATAStruct get _widgetsData => FFAppState().WIDGETSDATA;

  // Геттеры для удобного доступа к данным
  BookingFormDataStruct get _formData => _widgetsData.bookingFormData;

  List<ServiceStruct> get _services => _formData.servicesList;
  List<ServiceStruct> get _selectedServices => _formData.selectedServices;
  List<MasterStruct> get _masters => _formData.mastersList;
  List<MasterStruct> get _selectedMasters => _formData.selectedMasters;
  List<ClientStruct> get _clients => _formData.clientsList;
  ClientStruct? get _selectedClient => _formData.selectedClient.isNotEmpty
      ? _formData.selectedClient.first
      : null;
  List<String> get _slots => _formData.availableSlots;
  String? get _selectedSlot =>
      _formData.selectedSlot.isNotEmpty ? _formData.selectedSlot.first : null;
  String? get _selectedDate =>
      _formData.selectedDate.isNotEmpty ? _formData.selectedDate.first : null;

  // Список шагов
  final List<Map<String, dynamic>> _steps = const [
    {'key': 'service', 'label': 'Услуги', 'icon': Icons.build},
    {'key': 'master', 'label': 'Мастера', 'icon': Icons.person},
    {'key': 'date', 'label': 'Дата', 'icon': Icons.calendar_today},
    {'key': 'slot', 'label': 'Время', 'icon': Icons.access_time},
    {'key': 'client', 'label': 'Клиент', 'icon': Icons.people},
  ];

  @override
  void initState() {
    super.initState();
    _currentStep = widget.initialStep;
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    setState(() => _isLoading = true);

    try {
      // Загружаем услуги если их нет
      if (_services.isEmpty) {
        final services = await actions.loadServices(
          widget.organizationId,
        );
        FFAppState().updateWIDGETSDATAStruct(
            (e) => e.updateBookingFormData((f) => f..servicesList = services));
      }

      // Загружаем клиентов если их нет
      if (_clients.isEmpty) {
        final clients = await actions.loadClients(
          widget.organizationId,
        );
        FFAppState().updateWIDGETSDATAStruct(
            (e) => e.updateBookingFormData((f) => f..clientsList = clients));
      }
    } catch (e) {
      print('Error loading initial data: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Вспомогательный метод для обновления BookingFormData
  void _updateBookingFormData(void Function(BookingFormDataStruct) updateFn) {
    FFAppState()
        .updateWIDGETSDATAStruct((e) => e.updateBookingFormData(updateFn));
    setState(() {});
  }

  // Переход к следующему шагу
  void _nextStep() {
    final currentIndex = _steps.indexWhere((s) => s['key'] == _currentStep);
    if (currentIndex < _steps.length - 1) {
      setState(() {
        _currentStep = _steps[currentIndex + 1]['key'];
      });
    }
  }

  // Переход к предыдущему шагу
  void _previousStep() {
    final currentIndex = _steps.indexWhere((s) => s['key'] == _currentStep);
    if (currentIndex > 0) {
      setState(() {
        _currentStep = _steps[currentIndex - 1]['key'];
      });
    }
  }

  // Проверка, можно ли перейти к следующему шагу
  bool _canGoNext() {
    switch (_currentStep) {
      case 'service':
        return _selectedServices.isNotEmpty;
      case 'master':
        return _selectedMasters.isNotEmpty;
      case 'date':
        return _selectedDate != null;
      case 'slot':
        return _selectedSlot != null;
      case 'client':
        return _selectedClient != null;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildStepIndicator(),
                Expanded(
                  child: _buildStepContent(),
                ),
                _buildNavigationButtons(),
              ],
            ),
    );
  }

  Widget _buildStepIndicator() {
    final currentIndex = _steps.indexWhere((s) => s['key'] == _currentStep);

    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(_steps.length, (index) {
          final step = _steps[index];
          final isActive = index <= currentIndex;

          return Expanded(
            child: Row(
              children: [
                if (index > 0)
                  Expanded(
                    child: Container(
                      height: 2,
                      color: isActive
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).alternate,
                  ),
                  child: Icon(
                    step['icon'] as IconData,
                    color: isActive
                        ? Colors.white
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 16,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 'service':
        return _buildServiceStep();
      case 'master':
        return _buildMasterStep();
      case 'date':
        return _buildDateStep();
      case 'slot':
        return _buildSlotStep();
      case 'client':
        return _buildClientStep();
      default:
        return Container();
    }
  }

  Widget _buildServiceStep() {
    if (_services.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Загрузка услуг...'),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _services.length,
      itemBuilder: (context, index) {
        final service = _services[index];
        final isSelected = _selectedServices.contains(service);

        return InkWell(
          onTap: () {
            _updateBookingFormData((e) {
              if (isSelected) {
                e.updateSelectedServices((list) => list.remove(service));
              } else {
                e.updateSelectedServices((list) => list.add(service));
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
                  : FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).alternate,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  service.name,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  '${service.durationMin} мин • ${service.price} ₽',
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMasterStep() {
    if (_selectedServices.isEmpty) {
      return Center(
        child: Text('Сначала выберите услуги'),
      );
    }

    if (_masters.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() => _isLoading = true);
                try {
                  final masters = await actions.loadMastersForServices(
                    widget.organizationId,
                    _selectedServices,
                  );
                  _updateBookingFormData((e) {
                    e.mastersList = masters;
                  });
                } catch (e) {
                  print('Error loading masters: $e');
                } finally {
                  setState(() => _isLoading = false);
                }
              },
              child: Text('Загрузить мастеров'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: _masters.length,
      itemBuilder: (context, index) {
        final master = _masters[index];
        final isSelected = _selectedMasters.contains(master);

        return InkWell(
          onTap: () {
            _updateBookingFormData((e) {
              if (isSelected) {
                e.updateSelectedMasters((list) => list.remove(master));
              } else {
                e.updateSelectedMasters((list) => list.add(master));
              }
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected
                  ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
                  : FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).alternate,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        master.name,
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                      if (master.specialization.isNotEmpty)
                        Text(
                          master.specialization.join(', '),
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDateStep() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Выберите дату',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 90)),
              );
              if (date != null) {
                final dateStr = DateFormat('yyyy-MM-dd').format(date);
                _updateBookingFormData((e) {
                  e.selectedDate = [dateStr];
                  e.availableSlots = []; // Очищаем старые слоты
                });
              }
            },
            child: Text(_selectedDate ?? 'Выбрать дату'),
          ),
        ],
      ),
    );
  }

  Widget _buildSlotStep() {
    if (_selectedDate == null) {
      return Center(
        child: Text('Сначала выберите дату'),
      );
    }

    if (_selectedMasters.isEmpty) {
      return Center(
        child: Text('Сначала выберите мастеров'),
      );
    }

    if (_slots.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() => _isLoading = true);
                try {
                  final slots = await actions.loadAvailableSlots(
                    widget.organizationId,
                    _selectedMasters.first.id,
                    _selectedDate!,
                  );
                  _updateBookingFormData((e) {
                    e.availableSlots = slots;
                  });
                } catch (e) {
                  print('Error loading slots: $e');
                } finally {
                  setState(() => _isLoading = false);
                }
              },
              child: Text('Загрузить свободное время'),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _slots.length,
      itemBuilder: (context, index) {
        final slot = _slots[index];
        final isSelected = slot == _selectedSlot;

        return InkWell(
          onTap: () {
            _updateBookingFormData((e) {
              e.selectedSlot = [slot];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
                  : FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).alternate,
              ),
            ),
            child: Center(
              child: Text(
                slot,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildClientStep() {
    if (_clients.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    // Фильтруем клиентов по поисковому тексту
    final filteredClients = functions.searchClients(_clients, _searchText);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Поиск клиента...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: filteredClients.length,
            itemBuilder: (context, index) {
              final client = filteredClients[index];
              final isSelected = client == _selectedClient;

              return InkWell(
                onTap: () {
                  _updateBookingFormData((e) {
                    e.selectedClient = [client];
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              client.name,
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            if (client.phone.isNotEmpty)
                              Text(
                                client.phone,
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check_circle,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    final isLastStep = _currentStep == 'client';

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentStep != 'service')
            FFButtonWidget(
              onPressed: _previousStep,
              text: 'Назад',
              options: FFButtonOptions(
                width: 100,
                height: 40,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
            ),
          if (_currentStep == 'service') const Spacer(),
          FFButtonWidget(
            onPressed: _canGoNext()
                ? isLastStep
                    ? _createAppointment
                    : _nextStep
                : null,
            text: isLastStep ? 'Создать' : 'Далее',
            options: FFButtonOptions(
              width: 100,
              height: 40,
              color: _canGoNext()
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).alternate,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    color: _canGoNext() ? Colors.white : null,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _createAppointment() async {
    if (_selectedServices.isEmpty ||
        _selectedMasters.isEmpty ||
        _selectedClient == null ||
        _selectedDate == null ||
        _selectedSlot == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Заполните все поля'),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
      return;
    }

    setState(() => _isLoading = true);
    try {
      await actions.createAppointment(
        widget.organizationId,
        _selectedClient!.id,
        _selectedServices.first.id,
        _selectedMasters.first.id,
        _selectedDate!,
        _selectedSlot!,
        '',
        () async {
          // Очищаем форму
          _updateBookingFormData((e) {
            e.selectedServices = [];
            e.selectedMasters = [];
            e.selectedClient = [];
            e.selectedDate = [];
            e.selectedSlot = [];
            e.availableSlots = [];
          });

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Запись создана'),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }

          if (widget.onAppointmentCreated != null) {
            await widget.onAppointmentCreated!();
          }
        },
        (error) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
          }
        },
      );
    } catch (e) {
      print('Error creating appointment: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка при создании записи'),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
