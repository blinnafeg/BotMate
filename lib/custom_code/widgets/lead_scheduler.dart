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

import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LeadScheduler extends StatefulWidget {
  const LeadScheduler({
    super.key,
    this.width,
    this.height,
    required this.organizationId,
    required this.primaryColor,
    this.secondaryColor,
    required this.backgroundColor,
    required this.cardColor,
    required this.textColor,
    required this.gridColor,
    this.masterId,
    this.onBookingChanged,
  });

  final double? width;
  final double? height;
  final String organizationId;
  final Color primaryColor;
  final Color? secondaryColor;
  final Color backgroundColor;
  final Color cardColor;
  final Color textColor;
  final Color gridColor;
  final String? masterId;
  final Future<void> Function(
    String id,
    DateTime startTime,
    DateTime endTime,
  )? onBookingChanged;

  @override
  State<LeadScheduler> createState() => _LeadSchedulerState();
}

class _LeadSchedulerState extends State<LeadScheduler> {
  late final SupabaseClient _supabase;

  // ============ СОСТОЯНИЕ ============
  String viewMode = 'day';
  DateTime selectedDate = DateTime.now();
  String? selectedMasterId;
  Map<String, dynamic>? organization;
  Map<String, dynamic>? settings;
  List<Map<String, dynamic>> masters = [];
  List<Map<String, dynamic>> services = [];
  List<Map<String, dynamic>> appointments = [];
  List<Map<String, dynamic>> clients = [];

  bool isLoading = true;
  String? error;

  // ============ НАСТРОЙКИ ОТОБРАЖЕНИЯ ============
  late double hourHeight;
  late int startHour;
  late int endHour;
  late int bookingInterval;
  late String defaultView;
  late bool showWeekends;
  late String density;
  late String deviceType;

  RealtimeChannel? _appointmentsChannel;

  @override
  void initState() {
    super.initState();
    _supabase = Supabase.instance.client;
    _loadData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initSettings();
  }

  void _initSettings() {
    final width = MediaQuery.of(context).size.width;

    if (width < 479) {
      deviceType = 'mobile';
      hourHeight = 60;
    } else if (width >= 479 && width < 767) {
      deviceType = 'tablet';
      hourHeight = 70;
    } else if (width >= 767 && width < 991) {
      deviceType = 'tabletLandscape';
      hourHeight = 75;
    } else {
      deviceType = 'desktop';
      hourHeight = 80;
    }

    bookingInterval = 15;
    defaultView = 'day';
    showWeekends = true;
    density = deviceType == 'mobile' ? 'compact' : 'comfortable';
    startHour = 9;
    endHour = 21;
  }

  bool get isMobile => deviceType == 'mobile';
  bool get isTablet => deviceType == 'tablet';
  bool get isDesktop =>
      deviceType == 'desktop' || deviceType == 'tabletLandscape';

  Future<void> _loadData() async {
    setState(() => isLoading = true);

    try {
      final orgResponse = await _supabase
          .from('crm_organizations')
          .select()
          .eq('id', widget.organizationId)
          .single();
      setState(() => organization = orgResponse);

      final settingsResponse = await _supabase
          .from('crm_settings')
          .select()
          .eq('organization_id', widget.organizationId)
          .maybeSingle();
      if (settingsResponse != null) {
        setState(() {
          settings = Map<String, dynamic>.from(settingsResponse);
          _applySettings();
        });
      }

      final mastersResponse = await _supabase
          .from('crm_masters')
          .select()
          .eq('organization_id', widget.organizationId)
          .eq('is_active', true);
      setState(() {
        masters = List<Map<String, dynamic>>.from(mastersResponse);
      });

      selectedMasterId = widget.masterId ??
          (masters.isNotEmpty ? masters.first['id'] as String? : null);

      final servicesResponse = await _supabase
          .from('crm_services')
          .select('*, crm_service_categories(*)')
          .eq('organization_id', widget.organizationId)
          .eq('is_active', true);
      setState(
          () => services = List<Map<String, dynamic>>.from(servicesResponse));

      await _loadAppointments();
    } catch (e) {
      setState(() => error = 'Ошибка загрузки: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _applySettings() {
    if (settings == null) return;
    try {
      final workHours = settings!['work_hours'] as Map?;
      if (workHours != null) {
        final today =
            _getWeekdayNameRU(DateTime.now().weekday - 1).toLowerCase();
        final todaySettings = workHours[today] as Map?;
        if (todaySettings != null) {
          final startStr = todaySettings['начало'] as String? ?? '09:00';
          final endStr = todaySettings['конец'] as String? ?? '21:00';
          startHour = int.tryParse(startStr.split(':')[0]) ?? 9;
          endHour = int.tryParse(endStr.split(':')[0]) ?? 21;
        }
      }

      final bookingSettings = settings!['booking_settings'] as Map?;
      if (bookingSettings != null) {
        bookingInterval = bookingSettings['интервал_записи'] as int? ?? 15;
      }

      final uiSettings = settings!['ui_settings'] as Map?;
      if (uiSettings != null) {
        defaultView = uiSettings['вид_по_умолчанию'] as String? ?? 'day';
        showWeekends = uiSettings['показывать_выходные'] as bool? ?? true;
        density = uiSettings['плотность'] as String? ??
            (isMobile ? 'compact' : 'comfortable');
      }
      viewMode = defaultView;
    } catch (e) {
      debugPrint('Error applying settings: $e');
    }
  }

  Future<void> _loadAppointments() async {
    try {
      final startDate = DateTime(selectedDate.year, selectedDate.month - 1, 1);
      final endDate = DateTime(selectedDate.year, selectedDate.month + 2, 0);

      final startDateStr = startDate.toIso8601String().split('T')[0];
      final endDateStr = endDate.toIso8601String().split('T')[0];

      var query = _supabase
          .from('crm_appointments')
          .select('''
            *,
            crm_clients!inner (
              id,
              name,
              phone,
              telegram_id
            ),
            crm_masters!inner (
              id,
              name,
              phone
            ),
            crm_services!inner (
              id,
              name,
              duration_min,
              price
            )
          ''')
          .eq('organization_id', widget.organizationId)
          .gte('appointment_date', startDateStr)
          .lte('appointment_date', endDateStr);

      if (selectedMasterId != null) {
        query = query.eq('master_id', selectedMasterId!);
      }

      final response = await query;
      setState(() {
        appointments = List<Map<String, dynamic>>.from(response);
      });

      _subscribeToRealtime();
    } catch (e) {
      debugPrint('Error loading appointments: $e');
    }
  }

  void _subscribeToRealtime() {
    _appointmentsChannel?.unsubscribe();
    _appointmentsChannel = _supabase
        .channel('appointments-${widget.organizationId}')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'crm_appointments',
          callback: (payload) {
            _loadAppointments();
          },
        )
        .subscribe();
  }

  List<Map<String, dynamic>> _getProcessedAppointments(DateTime date) {
    final dateStr = date.toIso8601String().split('T')[0];

    return appointments
        .where((apt) => apt['appointment_date'] == dateStr)
        .map((apt) {
      final timeStr = apt['appointment_time'] as String? ?? '09:00:00';
      final timeParts = timeStr.split(':').map(int.parse).toList();

      final startDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        timeParts[0],
        timeParts[1],
        timeParts.length > 2 ? timeParts[2] : 0,
      );

      final service = apt['crm_services'] as Map<String, dynamic>?;
      final duration = service?['duration_min'] as int? ?? 60;
      final endDateTime = startDateTime.add(Duration(minutes: duration));

      final client = apt['crm_clients'] as Map<String, dynamic>?;
      final master = apt['crm_masters'] as Map<String, dynamic>?;

      return {
        'id': apt['id'].toString(),
        'start_at': startDateTime,
        'end_at': endDateTime,
        'client_name': client?['name'] as String? ?? 'Клиент',
        'client_phone': client?['phone'] as String? ?? '',
        'master_name': master?['name'] as String? ?? 'Мастер',
        'master_id': master?['id'] as String?,
        'service_name': service?['name'] as String? ?? 'Услуга',
        'service_id': service?['id'] as String?,
        'status': apt['status'] ?? 'pending',
        'notes': apt['notes'] ?? '',
        'price': service?['price'] ?? 0,
        'duration': duration,
      };
    }).toList()
      ..sort((a, b) =>
          (a['start_at'] as DateTime).compareTo(b['start_at'] as DateTime));
  }

  String _getWeekdayNameRU(int index) {
    const weekdays = [
      'понедельник',
      'вторник',
      'среда',
      'четверг',
      'пятница',
      'суббота',
      'воскресенье'
    ];
    return weekdays[index];
  }

  String _getWeekdayNameShort(int index) {
    const weekdays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    return weekdays[index];
  }

  String _getMonthName(int month) {
    const months = [
      'января',
      'февраля',
      'марта',
      'апреля',
      'мая',
      'июня',
      'июля',
      'августа',
      'сентября',
      'октября',
      'ноября',
      'декабря'
    ];
    return months[month - 1];
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Map<String, int> _getWorkHoursForDay(int weekdayIndex) {
    if (settings == null) return {'start': 9, 'end': 21};
    try {
      final workHours = settings!['work_hours'] as Map?;
      if (workHours == null) return {'start': 9, 'end': 21};

      final dayName = _getWeekdayNameRU(weekdayIndex).toLowerCase();
      final daySettings = workHours[dayName] as Map?;
      if (daySettings == null) return {'start': 9, 'end': 21};

      final startStr = daySettings['начало'] as String? ?? '09:00';
      final endStr = daySettings['конец'] as String? ?? '21:00';

      final start = int.tryParse(startStr.split(':')[0]) ?? 9;
      final end = int.tryParse(endStr.split(':')[0]) ?? 21;

      return {'start': start, 'end': end};
    } catch (e) {
      return {'start': 9, 'end': 21};
    }
  }

  bool _isWorkDay(DateTime date) {
    final workHours = _getWorkHoursForDay(date.weekday - 1);
    return workHours['end']! - workHours['start']! > 0;
  }

  Color _getStatusColor(String? status) {
    switch (status?.toString().toLowerCase() ?? 'pending') {
      case 'confirmed':
        return Colors.green.shade600;
      case 'cancelled':
        return Colors.red.shade600;
      case 'completed':
        return Colors.blue.shade600;
      case 'pending':
      default:
        return widget.primaryColor;
    }
  }

  String _getStatusText(String? status) {
    switch (status?.toString().toLowerCase() ?? 'pending') {
      case 'confirmed':
        return 'Подтверждено';
      case 'cancelled':
        return 'Отменено';
      case 'completed':
        return 'Выполнено';
      case 'pending':
      default:
        return 'Ожидание';
    }
  }

  String _getInitials(String name) {
    final parts = name.split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildLoading();
    }
    if (error != null) {
      return _buildError();
    }

    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.backgroundColor,
      child: Column(
        children: [
          _buildHeader(),
          if (isDesktop && masters.length > 1) _buildMasterSelector(),
          Expanded(
            child: Row(
              children: [
                if (isMobile && masters.length > 1) _buildMobileMasterDrawer(),
                Expanded(child: _buildView()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: widget.primaryColor),
            const SizedBox(height: 16),
            Text('Загрузка расписания...',
                style: TextStyle(color: widget.textColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildError() {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline,
                size: 48, color: widget.textColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text(error!,
                style: TextStyle(color: widget.textColor),
                textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadData,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(120, 48),
              ),
              child: const Text('Повторить'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(isMobile ? 8 : 12),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: widget.gridColor.withOpacity(0.3))),
      ),
      child: Row(
        children: [
          _buildNavButton(Icons.chevron_left, _previousDate),
          Expanded(
            child: Text(
              _getDateTitle(),
              style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 14 : 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          _buildNavButton(Icons.chevron_right, _nextDate),
          const SizedBox(width: 8),
          if (isDesktop) ...[
            _buildTab('День', 'day'),
            const SizedBox(width: 8),
            _buildTab('Неделя', 'week'),
            const SizedBox(width: 8),
            _buildTab('Месяц', 'month'),
          ] else
            _buildMobileViewSelector(),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.gridColor.withOpacity(0.1),
      ),
      child: IconButton(
        icon: Icon(icon, color: widget.textColor, size: isMobile ? 20 : 24),
        onPressed: onTap,
        constraints: BoxConstraints(
          minWidth: isMobile ? 36 : 48,
          minHeight: isMobile ? 36 : 48,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildTab(String title, String mode) {
    final active = viewMode == mode;
    return GestureDetector(
      onTap: () => setState(() => viewMode = mode),
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 16,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? widget.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: active ? widget.primaryColor : widget.gridColor),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: active ? Colors.white : widget.textColor,
            fontSize: isMobile ? 11 : 12,
            fontWeight: active ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }

  Widget _buildMobileViewSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: widget.gridColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMobileTab(Icons.today, 'day'),
          _buildMobileTab(Icons.date_range, 'week'),
          _buildMobileTab(Icons.calendar_month, 'month'),
        ],
      ),
    );
  }

  Widget _buildMobileTab(IconData icon, String mode) {
    final active = viewMode == mode;
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: active ? widget.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20),
        color: active ? Colors.white : widget.textColor,
        onPressed: () => setState(() => viewMode = mode),
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        padding: EdgeInsets.zero,
      ),
    );
  }

  String _getDateTitle() {
    if (viewMode == 'day') {
      return isMobile
          ? DateFormat('d MMM').format(selectedDate)
          : '${selectedDate.day} ${_getMonthName(selectedDate.month)} ${selectedDate.year}';
    } else if (viewMode == 'week') {
      final start =
          selectedDate.subtract(Duration(days: selectedDate.weekday - 1));
      final end = start.add(const Duration(days: 6));
      return isMobile
          ? '${start.day} - ${end.day} ${_getMonthName(end.month)}'
          : '${start.day} ${_getMonthName(start.month)} - ${end.day} ${_getMonthName(end.month)} ${end.year}';
    } else {
      return isMobile
          ? DateFormat('MMMM yyyy').format(selectedDate)
          : '${_getMonthName(selectedDate.month)} ${selectedDate.year}';
    }
  }

  void _previousDate() {
    setState(() {
      if (viewMode == 'day') {
        selectedDate = selectedDate.subtract(const Duration(days: 1));
      } else if (viewMode == 'week') {
        selectedDate = selectedDate.subtract(const Duration(days: 7));
      } else {
        selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
      }
      _loadAppointments();
    });
  }

  void _nextDate() {
    setState(() {
      if (viewMode == 'day') {
        selectedDate = selectedDate.add(const Duration(days: 1));
      } else if (viewMode == 'week') {
        selectedDate = selectedDate.add(const Duration(days: 7));
      } else {
        selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
      }
      _loadAppointments();
    });
  }

  Widget _buildMasterSelector() {
    if (masters.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 8 : 12, vertical: isMobile ? 6 : 8),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: widget.gridColor.withOpacity(0.3))),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                'Мастер:',
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: isMobile ? 13 : 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            _buildMasterChip(null, 'Все'),
            ...masters.map((master) => _buildMasterChip(
                  master['id'] as String,
                  master['name'] as String,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildMasterChip(String? id, String name) {
    final isSelected = (id == null && selectedMasterId == null) ||
        (id != null && selectedMasterId == id);
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.white : widget.textColor,
            fontSize: isMobile ? 12 : 13,
            fontWeight: isSelected ? FontWeight.w600 : null,
          ),
        ),
        selected: isSelected,
        onSelected: (_) {
          setState(() {
            selectedMasterId = id;
            _loadAppointments();
          });
        },
        backgroundColor: widget.cardColor,
        selectedColor: widget.primaryColor,
        checkmarkColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 8 : 12, vertical: isMobile ? 4 : 6),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  Widget _buildMobileMasterDrawer() {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        border:
            Border(right: BorderSide(color: widget.gridColor.withOpacity(0.3))),
      ),
      child: ListView.builder(
        itemCount: masters.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildMobileMasterChip(null, '👥', selectedMasterId == null);
          }
          final master = masters[index - 1];
          return _buildMobileMasterChip(
            master['id'] as String,
            _getInitials(master['name'] as String),
            selectedMasterId == master['id'],
          );
        },
      ),
    );
  }

  Widget _buildMobileMasterChip(String? id, String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? widget.primaryColor : widget.cardColor,
        border: Border.all(
          color: isSelected ? widget.primaryColor : widget.gridColor,
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : widget.textColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            selectedMasterId = id;
            _loadAppointments();
          });
        },
        constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildView() {
    if (!_isWorkDay(selectedDate) && viewMode == 'day') {
      return _buildDayOff();
    }
    switch (viewMode) {
      case 'day':
        return _buildDayView();
      case 'week':
        return _buildWeekView();
      case 'month':
        return _buildMonthView();
      default:
        return _buildDayView();
    }
  }

  Widget _buildDayOff() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.beach_access,
              size: 64, color: widget.textColor.withOpacity(0.3)),
          const SizedBox(height: 16),
          Text(
            'Выходной день',
            style: TextStyle(
              color: widget.textColor,
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Организация не работает',
            style: TextStyle(color: widget.textColor.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }

  Widget _buildDayView() {
    final dayAppointments = _getProcessedAppointments(selectedDate);
    final workHours = _getWorkHoursForDay(selectedDate.weekday - 1);
    final startHour = workHours['start']!;
    final endHour = workHours['end']!;
    final visibleHours = endHour - startHour;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: widget.backgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: isMobile ? 50 : 60,
              child: _buildTimeLabels(startHour, endHour),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ClipRect(
                  child: SizedBox(
                    height: visibleHours * hourHeight,
                    child: Stack(
                      children: [
                        _buildTimeGrid(startHour, endHour),
                        ..._buildAppointmentCards(
                          dayAppointments,
                          constraints.maxWidth - (isMobile ? 50 : 60),
                          startHour,
                        ),
                        _buildCurrentTimeIndicator(startHour, endHour),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTimeLabels(int startHour, int endHour) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(endHour - startHour, (index) {
          final hour = startHour + index;
          return Container(
            height: hourHeight,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: isMobile ? 2 : 4),
            child: Text(
              '${hour.toString().padLeft(2, '0')}:00',
              style: TextStyle(
                fontSize: isMobile ? 9 : 10,
                color: widget.textColor.withOpacity(0.5),
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTimeGrid(int startHour, int endHour) {
    return Column(
      children: List.generate(endHour - startHour, (index) {
        return Container(
          height: hourHeight,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: widget.gridColor.withOpacity(0.2), width: 0.5),
              left: BorderSide(
                  color: widget.gridColor.withOpacity(0.2), width: 0.5),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCurrentTimeIndicator(int startHour, int endHour) {
    final now = DateTime.now();
    if (!_isSameDay(selectedDate, now)) return const SizedBox.shrink();

    final minutesSinceStart = (now.hour - startHour) * 60 + now.minute;
    final totalMinutes = (endHour - startHour) * 60;

    if (minutesSinceStart < 0 || minutesSinceStart > totalMinutes) {
      return const SizedBox.shrink();
    }

    final top = (minutesSinceStart / 60) * hourHeight;

    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              color: Colors.red.shade400,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAppointmentCards(
    List<Map<String, dynamic>> appointments,
    double width,
    int startHour,
  ) {
    return appointments.map((apt) {
      final start = apt['start_at'] as DateTime;
      final end = apt['end_at'] as DateTime;

      final top = ((start.hour + start.minute / 60) - startHour) * hourHeight;
      final height = (end.difference(start).inMinutes / 60) * hourHeight;

      return Positioned(
        top: top,
        left: 10,
        right: 10,
        height: height < 30 ? 30 : height,
        child: _AppointmentCard(
          appointment: apt,
          width: width - 20,
          height: height < 30 ? 30 : height,
          color: _getStatusColor(apt['status'] as String?),
          isMobile: isMobile,
          onTap: () => _showAppointmentDetails(apt),
        ),
      );
    }).toList();
  }

  Widget _buildWeekView() {
    final startOfWeek =
        selectedDate.subtract(Duration(days: selectedDate.weekday - 1));
    return isMobile || isTablet
        ? _buildWeekViewMobile(startOfWeek)
        : _buildWeekViewDesktop(startOfWeek);
  }

  Widget _buildWeekViewDesktop(DateTime startOfWeek) {
    final workHours = _getWorkHoursForDay(0);
    final startHour = workHours['start']!;
    final endHour = workHours['end']!;
    final visibleHours = endHour - startHour;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 60, right: 12, top: 12),
          child: Row(
            children: List.generate(7, (index) {
              final date = startOfWeek.add(Duration(days: index));
              final isToday = _isSameDay(date, DateTime.now());
              final isWorkDay = _isWorkDay(date);

              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color:
                        isToday ? widget.primaryColor.withOpacity(0.1) : null,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _getWeekdayNameShort(index),
                        style: TextStyle(
                          color: isWorkDay
                              ? widget.textColor
                              : widget.textColor.withOpacity(0.3),
                          fontWeight: isToday ? FontWeight.bold : null,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          color: isWorkDay
                              ? widget.textColor
                              : widget.textColor.withOpacity(0.3),
                          fontWeight:
                              isToday ? FontWeight.bold : FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60,
                  child: Column(
                    children: List.generate(visibleHours, (index) {
                      final hour = startHour + index;
                      return Container(
                        height: hourHeight,
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '${hour.toString().padLeft(2, '0')}:00',
                          style: TextStyle(
                            fontSize: 11,
                            color: widget.textColor.withOpacity(0.5),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: List.generate(7, (index) {
                      final date = startOfWeek.add(Duration(days: index));
                      final dayAppointments = _getProcessedAppointments(date);
                      final isWorkDay = _isWorkDay(date);

                      return Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                  color: widget.gridColor.withOpacity(0.2)),
                              right: BorderSide(
                                  color: widget.gridColor.withOpacity(0.2)),
                            ),
                            color: !isWorkDay
                                ? widget.gridColor.withOpacity(0.05)
                                : null,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children:
                                    List.generate(visibleHours, (hourIndex) {
                                  return Container(
                                    height: hourHeight,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: widget.gridColor
                                                .withOpacity(0.1)),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              ..._buildWeekAppointmentCards(
                                dayAppointments,
                                startHour,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildWeekAppointmentCards(
    List<Map<String, dynamic>> appointments,
    int startHour,
  ) {
    return appointments.map((apt) {
      final start = apt['start_at'] as DateTime;
      final end = apt['end_at'] as DateTime;

      final top = ((start.hour + start.minute / 60) - startHour) * hourHeight;
      final height = (end.difference(start).inMinutes / 60) * hourHeight;

      return Positioned(
        top: top,
        left: 2,
        right: 2,
        height: height < 40 ? 40 : height,
        child: GestureDetector(
          onTap: () => _showAppointmentDetails(apt),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 1),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: _getStatusColor(apt['status'] as String?),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  apt['client_name'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (height > 40)
                  Text(
                    apt['service_name'] as String,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildWeekViewMobile(DateTime startOfWeek) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        final date = startOfWeek.add(Duration(days: index));
        final isWorkDay = _isWorkDay(date);
        final isToday = _isSameDay(date, DateTime.now());
        final dayAppointments = _getProcessedAppointments(date);

        return Card(
          margin: const EdgeInsets.all(4),
          color: widget.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: ExpansionTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isToday
                    ? widget.primaryColor
                    : widget.gridColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getWeekdayNameShort(index),
                    style: TextStyle(
                      color: isToday ? Colors.white : widget.textColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${date.day}',
                    style: TextStyle(
                      color: isToday ? Colors.white : widget.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            title: Text(
              '${dayAppointments.length} записей',
              style: TextStyle(color: widget.textColor),
            ),
            subtitle: Text(
              isWorkDay ? 'Рабочий день' : 'Выходной',
              style: TextStyle(
                color: isWorkDay ? Colors.green : Colors.red,
                fontSize: 12,
              ),
            ),
            children: isWorkDay
                ? dayAppointments
                    .map((apt) => _buildMobileAppointmentTile(apt))
                    .toList()
                : [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          'Выходной день',
                          style: TextStyle(
                              color: widget.textColor.withOpacity(0.5)),
                        ),
                      ),
                    )
                  ],
          ),
        );
      },
    );
  }

  Widget _buildMonthView() {
    final firstDay = DateTime(selectedDate.year, selectedDate.month, 1);
    final firstWeekday = firstDay.weekday - 1;
    final daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    final daysFromPrevMonth = firstWeekday < 0 ? 0 : firstWeekday;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: List.generate(7, (index) {
              return Expanded(
                child: Text(
                  _getWeekdayNameShort(index),
                  style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 12 : 13,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: isMobile ? 0.9 : 1.0,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              final dayNumber = index - daysFromPrevMonth + 1;
              if (dayNumber < 1 || dayNumber > daysInMonth) {
                return Container();
              }

              final date =
                  DateTime(selectedDate.year, selectedDate.month, dayNumber);
              final dayAppointments = _getProcessedAppointments(date);
              final isToday = _isSameDay(date, DateTime.now());
              final isSelected = _isSameDay(date, selectedDate);
              final isWorkDay = _isWorkDay(date);

              return _buildMonthDayCell(
                date: date,
                dayNumber: dayNumber,
                appointments: dayAppointments,
                isToday: isToday,
                isSelected: isSelected,
                isWorkDay: isWorkDay,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMonthDayCell({
    required DateTime date,
    required int dayNumber,
    required List<Map<String, dynamic>> appointments,
    required bool isToday,
    required bool isSelected,
    required bool isWorkDay,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = date;
          if (isMobile || isTablet) viewMode = 'day';
        });
        if (isDesktop) _loadAppointments();
      },
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? widget.primaryColor
                : isToday
                    ? widget.primaryColor.withOpacity(0.5)
                    : widget.gridColor.withOpacity(0.2),
            width: isSelected ? 2 : (isToday ? 1 : 0.5),
          ),
          color: isSelected
              ? widget.primaryColor.withOpacity(0.1)
              : isToday
                  ? widget.primaryColor.withOpacity(0.05)
                  : !isWorkDay
                      ? widget.gridColor.withOpacity(0.05)
                      : null,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(isMobile ? 2 : 4),
              child: Text(
                dayNumber.toString(),
                style: TextStyle(
                  color: !isWorkDay
                      ? widget.textColor.withOpacity(0.3)
                      : isSelected
                          ? widget.primaryColor
                          : widget.textColor,
                  fontWeight: isSelected || isToday ? FontWeight.bold : null,
                  fontSize: isMobile ? 12 : 13,
                ),
              ),
            ),
            if (isDesktop && appointments.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  itemCount: appointments.length > 2 ? 2 : appointments.length,
                  itemBuilder: (context, i) {
                    final apt = appointments[i];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: _getStatusColor(apt['status'] as String?),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        apt['client_name'] as String? ?? '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 9),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ),
            if (isDesktop && appointments.length > 2)
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 2),
                child: Text(
                  '+${appointments.length - 2}',
                  style: TextStyle(
                    color: widget.textColor.withOpacity(0.5),
                    fontSize: 9,
                  ),
                ),
              ),
            if ((isMobile || isTablet) && appointments.isNotEmpty)
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: widget.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '${appointments.length}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileAppointmentTile(Map<String, dynamic> appointment) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _getStatusColor(appointment['status'] as String?),
        child: Text(
          _getInitials(appointment['client_name'] as String),
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
      title: Text(
        appointment['client_name'] as String,
        style: TextStyle(color: widget.textColor, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.cut,
                  size: 14, color: widget.textColor.withOpacity(0.6)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  appointment['service_name'] as String,
                  style: TextStyle(color: widget.textColor.withOpacity(0.7)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Icon(Icons.access_time,
                  size: 14, color: widget.textColor.withOpacity(0.6)),
              const SizedBox(width: 4),
              Text(
                '${_formatTime(appointment['start_at'] as DateTime)} - ${_formatTime(appointment['end_at'] as DateTime)}',
                style: TextStyle(
                    color: widget.textColor.withOpacity(0.5), fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      onTap: () => _showAppointmentDetails(appointment),
    );
  }

  void _showAppointmentDetails(Map<String, dynamic> appointment) {
    showDialog(
      context: context,
      builder: (context) => _AppointmentDetailsDialog(
        appointment: appointment,
        widget: widget,
        isMobile: isMobile,
        onEdit: () {
          Navigator.pop(context);
          _showEditAppointment(appointment);
        },
        onConfirm: () async {
          await _updateAppointmentStatus(appointment['id'], 'confirmed');
          Navigator.pop(context);
        },
        onCancel: () async {
          await _updateAppointmentStatus(appointment['id'], 'cancelled');
          Navigator.pop(context);
        },
        onComplete: () async {
          await _updateAppointmentStatus(appointment['id'], 'completed');
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showEditAppointment(Map<String, dynamic> appointment) {
    showDialog(
      context: context,
      builder: (context) => _EditAppointmentDialog(
        appointment: appointment,
        widget: widget,
        isMobile: isMobile,
        services: services,
        masters: masters,
        onSave: (updatedData) async {
          await _updateAppointment(appointment['id'], updatedData);
          Navigator.pop(context);
        },
      ),
    );
  }

  Future<void> _updateAppointmentStatus(String id, String status) async {
    try {
      await _supabase
          .from('crm_appointments')
          .update({'status': status}).eq('id', id);
      await _loadAppointments();
    } catch (e) {
      debugPrint('Error updating status: $e');
    }
  }

  Future<void> _updateAppointment(String id, Map<String, dynamic> data) async {
    try {
      await _supabase.from('crm_appointments').update(data).eq('id', id);
      await _loadAppointments();
      if (widget.onBookingChanged != null) {}
    } catch (e) {
      debugPrint('Error updating appointment: $e');
    }
  }

  @override
  void dispose() {
    _appointmentsChannel?.unsubscribe();
    super.dispose();
  }
}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard({
    required this.appointment,
    required this.width,
    required this.height,
    required this.color,
    required this.isMobile,
    this.onTap,
  });

  final Map<String, dynamic> appointment;
  final double width;
  final double height;
  final Color color;
  final bool isMobile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 6 : 8,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Row(
                children: [
                  Container(
                    width: isMobile ? 5 : 6,
                    height: isMobile ? 5 : 6,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      appointment['client_name'] as String? ?? 'Клиент',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            if (height > (isMobile ? 35 : 40)) ...[
              const SizedBox(height: 2),
              Flexible(
                child: Text(
                  appointment['service_name'] as String? ?? 'Услуга',
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text(
                  _formatTime(appointment['start_at'] as DateTime),
                  style: const TextStyle(color: Colors.white60, fontSize: 9),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class _AppointmentDetailsDialog extends StatelessWidget {
  const _AppointmentDetailsDialog({
    required this.appointment,
    required this.widget,
    required this.isMobile,
    required this.onEdit,
    required this.onConfirm,
    required this.onCancel,
    required this.onComplete,
  });

  final Map<String, dynamic> appointment;
  final LeadScheduler widget;
  final bool isMobile;
  final VoidCallback onEdit;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final VoidCallback onComplete;

  Color _getStatusColor(String? status) {
    switch (status?.toString().toLowerCase() ?? 'pending') {
      case 'confirmed':
        return Colors.green.shade600;
      case 'cancelled':
        return Colors.red.shade600;
      case 'completed':
        return Colors.blue.shade600;
      case 'pending':
      default:
        return widget.primaryColor;
    }
  }

  String _getStatusText(String? status) {
    switch (status?.toString().toLowerCase() ?? 'pending') {
      case 'confirmed':
        return 'Подтверждено';
      case 'cancelled':
        return 'Отменено';
      case 'completed':
        return 'Выполнено';
      case 'pending':
      default:
        return 'Ожидание';
    }
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final status = appointment['status'] as String?;
    final currentStatus = status?.toLowerCase() ?? 'pending';

    return Dialog(
      backgroundColor: widget.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? double.infinity : 500,
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: EdgeInsets.all(isMobile ? 16 : 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getStatusColor(status),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _getStatusText(status),
                    style: TextStyle(
                      color: widget.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 14 : 16,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: widget.textColor),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(Icons.person, 'Клиент',
                        appointment['client_name'] as String),
                    _buildDetailRow(Icons.phone, 'Телефон',
                        appointment['client_phone'] as String),
                    _buildDetailRow(Icons.build, 'Услуга',
                        appointment['service_name'] as String),
                    _buildDetailRow(
                      Icons.access_time,
                      'Время',
                      '${_formatTime(appointment['start_at'] as DateTime)} - ${_formatTime(appointment['end_at'] as DateTime)}',
                    ),
                    _buildDetailRow(Icons.person_outline, 'Мастер',
                        appointment['master_name'] as String),
                    _buildDetailRow(Icons.attach_money, 'Стоимость',
                        '${appointment['price']} ₽'),
                    if (appointment['notes'] != null &&
                        (appointment['notes'] as String).isNotEmpty)
                      _buildDetailRow(Icons.note, 'Заметки',
                          appointment['notes'] as String),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (currentStatus == 'pending')
                  _buildActionButton(
                    label: 'Подтвердить',
                    icon: Icons.check,
                    color: Colors.green,
                    onPressed: onConfirm,
                  ),
                if (currentStatus == 'confirmed')
                  _buildActionButton(
                    label: 'Завершить',
                    icon: Icons.done_all,
                    color: Colors.blue,
                    onPressed: onComplete,
                  ),
                if (currentStatus != 'cancelled' &&
                    currentStatus != 'completed')
                  _buildActionButton(
                    label: 'Отменить',
                    icon: Icons.cancel,
                    color: Colors.red,
                    onPressed: onCancel,
                  ),
                _buildActionButton(
                  label: 'Редактировать',
                  icon: Icons.edit,
                  color: widget.primaryColor,
                  onPressed: onEdit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,
              size: isMobile ? 14 : 16,
              color: widget.textColor.withOpacity(0.5)),
          const SizedBox(width: 12),
          SizedBox(
            width: isMobile ? 70 : 80,
            child: Text(
              label,
              style: TextStyle(
                color: widget.textColor.withOpacity(0.5),
                fontSize: isMobile ? 13 : 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: widget.textColor,
                fontSize: isMobile ? 13 : 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 16,
          vertical: isMobile ? 10 : 12,
        ),
      ),
    );
  }
}

class _EditAppointmentDialog extends StatefulWidget {
  const _EditAppointmentDialog({
    required this.appointment,
    required this.widget,
    required this.isMobile,
    required this.services,
    required this.masters,
    required this.onSave,
  });

  final Map<String, dynamic> appointment;
  final LeadScheduler widget;
  final bool isMobile;
  final List<Map<String, dynamic>> services;
  final List<Map<String, dynamic>> masters;
  final Function(Map<String, dynamic>) onSave;

  @override
  State<_EditAppointmentDialog> createState() => _EditAppointmentDialogState();
}

class _EditAppointmentDialogState extends State<_EditAppointmentDialog> {
  late TextEditingController _notesController;
  late String? _selectedServiceId;
  late String? _selectedMasterId;
  late String _selectedStatus;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _notesController =
        TextEditingController(text: widget.appointment['notes'] as String?);
    _selectedServiceId = widget.appointment['service_id'] as String?;
    _selectedMasterId = widget.appointment['master_id'] as String?;

    _selectedStatus = widget.appointment['status'] as String? ?? 'pending';

    final startAt = widget.appointment['start_at'] as DateTime;
    _selectedDate = DateTime(startAt.year, startAt.month, startAt.day);
    _selectedTime = TimeOfDay(hour: startAt.hour, minute: startAt.minute);
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: widget.widget.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: widget.isMobile ? double.infinity : 500,
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: EdgeInsets.all(widget.isMobile ? 16 : 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.edit, color: widget.widget.textColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Редактирование записи',
                    style: TextStyle(
                      color: widget.widget.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: widget.isMobile ? 16 : 18,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: widget.widget.textColor),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Услуга',
                      style: TextStyle(
                        color: widget.widget.textColor.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: widget.widget.backgroundColor,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: widget.widget.gridColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedServiceId,
                          isExpanded: true,
                          dropdownColor: widget.widget.cardColor,
                          style: TextStyle(
                            color: widget.widget.textColor,
                            fontSize: 12,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: widget.widget.textColor.withOpacity(0.5),
                            size: 20,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          items: widget.services.map((service) {
                            return DropdownMenuItem(
                              value: service['id'] as String,
                              child: Text(
                                service['name'] as String,
                                style: const TextStyle(fontSize: 12),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() => _selectedServiceId = value);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Мастер',
                      style: TextStyle(
                        color: widget.widget.textColor.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: widget.widget.backgroundColor,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: widget.widget.gridColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedMasterId,
                          isExpanded: true,
                          dropdownColor: widget.widget.cardColor,
                          style: TextStyle(
                            color: widget.widget.textColor,
                            fontSize: 12,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: widget.widget.textColor.withOpacity(0.5),
                            size: 20,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          items: widget.masters.map((master) {
                            return DropdownMenuItem(
                              value: master['id'] as String,
                              child: Text(
                                master['name'] as String,
                                style: const TextStyle(fontSize: 12),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() => _selectedMasterId = value);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Статус',
                      style: TextStyle(
                        color: widget.widget.textColor.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: widget.widget.backgroundColor,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: widget.widget.gridColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedStatus,
                          isExpanded: true,
                          dropdownColor: widget.widget.cardColor,
                          style: TextStyle(
                            color: widget.widget.textColor,
                            fontSize: 12,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: widget.widget.textColor.withOpacity(0.5),
                            size: 20,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          items: const [
                            DropdownMenuItem(
                              value: 'pending',
                              child: Text('Ожидание',
                                  style: TextStyle(fontSize: 12)),
                            ),
                            DropdownMenuItem(
                              value: 'confirmed',
                              child: Text('Подтверждено',
                                  style: TextStyle(fontSize: 12)),
                            ),
                            DropdownMenuItem(
                              value: 'completed',
                              child: Text('Выполнено',
                                  style: TextStyle(fontSize: 12)),
                            ),
                            DropdownMenuItem(
                              value: 'cancelled',
                              child: Text('Отменено',
                                  style: TextStyle(fontSize: 12)),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null)
                              setState(() => _selectedStatus = value);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Дата',
                                style: TextStyle(
                                  color:
                                      widget.widget.textColor.withOpacity(0.7),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: _selectedDate,
                                    firstDate: DateTime.now()
                                        .subtract(const Duration(days: 365)),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365)),
                                  );
                                  if (picked != null) {
                                    setState(() => _selectedDate = picked);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: widget.widget.gridColor),
                                    borderRadius: BorderRadius.circular(5),
                                    color: widget.widget.backgroundColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_today,
                                          size: 16,
                                          color: widget.widget.textColor),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${_selectedDate.day}.${_selectedDate.month}.${_selectedDate.year}',
                                        style: TextStyle(
                                            color: widget.widget.textColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Время',
                                style: TextStyle(
                                  color:
                                      widget.widget.textColor.withOpacity(0.7),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () async {
                                  final picked = await showTimePicker(
                                    context: context,
                                    initialTime: _selectedTime,
                                  );
                                  if (picked != null) {
                                    setState(() => _selectedTime = picked);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: widget.widget.gridColor),
                                    borderRadius: BorderRadius.circular(5),
                                    color: widget.widget.backgroundColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          size: 16,
                                          color: widget.widget.textColor),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}',
                                        style: TextStyle(
                                            color: widget.widget.textColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Заметки',
                      style: TextStyle(
                        color: widget.widget.textColor.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _notesController,
                      maxLines: 3,
                      style: TextStyle(color: widget.widget.textColor),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: widget.widget.backgroundColor,
                        hintText: 'Дополнительная информация',
                        hintStyle: TextStyle(
                            color: widget.widget.textColor.withOpacity(0.5)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // ============ ИСПРАВЛЕННЫЕ КНОПКИ ============
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: widget.widget.backgroundColor,
                    foregroundColor: widget.widget.textColor,
                    side: BorderSide(
                      color: widget.widget.gridColor,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    minimumSize: const Size(80, 48),
                  ),
                  child: const Text(
                    'Отмена',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final newDateTime = DateTime(
                      _selectedDate.year,
                      _selectedDate.month,
                      _selectedDate.day,
                      _selectedTime.hour,
                      _selectedTime.minute,
                    );

                    widget.onSave({
                      'service_id': _selectedServiceId,
                      'master_id': _selectedMasterId,
                      'status': _selectedStatus,
                      'appointment_date':
                          '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
                      'appointment_time':
                          '${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}:00',
                      'notes': _notesController.text,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.widget.secondaryColor ??
                        widget.widget.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    minimumSize: const Size(100, 48),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
