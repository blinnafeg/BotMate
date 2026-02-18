import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _WIDGETappointmentscentertopVISIBILITY =
          prefs.getBool('ff_WIDGETappointmentscentertopVISIBILITY') ??
              _WIDGETappointmentscentertopVISIBILITY;
    });
    _safeInit(() {
      _WIDGETservicerecordVISIBILITY =
          prefs.getBool('ff_WIDGETservicerecordVISIBILITY') ??
              _WIDGETservicerecordVISIBILITY;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _WIDGETappointmentscentertopVISIBILITY = true;
  bool get WIDGETappointmentscentertopVISIBILITY =>
      _WIDGETappointmentscentertopVISIBILITY;
  set WIDGETappointmentscentertopVISIBILITY(bool value) {
    _WIDGETappointmentscentertopVISIBILITY = value;
    prefs.setBool('ff_WIDGETappointmentscentertopVISIBILITY', value);
  }

  bool _WIDGETservicerecordVISIBILITY = false;
  bool get WIDGETservicerecordVISIBILITY => _WIDGETservicerecordVISIBILITY;
  set WIDGETservicerecordVISIBILITY(bool value) {
    _WIDGETservicerecordVISIBILITY = value;
    prefs.setBool('ff_WIDGETservicerecordVISIBILITY', value);
  }

  String _SETTINGrecordscalendarRecordsDAYWEAKMUNTHS = '';
  String get SETTINGrecordscalendarRecordsDAYWEAKMUNTHS =>
      _SETTINGrecordscalendarRecordsDAYWEAKMUNTHS;
  set SETTINGrecordscalendarRecordsDAYWEAKMUNTHS(String value) {
    _SETTINGrecordscalendarRecordsDAYWEAKMUNTHS = value;
  }

  VisibilityStruct _VISIBILITY = VisibilityStruct.fromSerializableMap(jsonDecode(
      '{\"CENTER-TOP-HEADER\":\"true\",\"TODAY-RECORDS-LISTVIEW\":\"true\"}'));
  VisibilityStruct get VISIBILITY => _VISIBILITY;
  set VISIBILITY(VisibilityStruct value) {
    _VISIBILITY = value;
  }

  void updateVISIBILITYStruct(Function(VisibilityStruct) updateFn) {
    updateFn(_VISIBILITY);
  }

  WidgetsDataStruct _WIDGETSDATA = WidgetsDataStruct();
  WidgetsDataStruct get WIDGETSDATA => _WIDGETSDATA;
  set WIDGETSDATA(WidgetsDataStruct value) {
    _WIDGETSDATA = value;
  }

  void updateWIDGETSDATAStruct(Function(WidgetsDataStruct) updateFn) {
    updateFn(_WIDGETSDATA);
  }

  WidgetsStylesStruct _WIDGETSSTYLES = WidgetsStylesStruct();
  WidgetsStylesStruct get WIDGETSSTYLES => _WIDGETSSTYLES;
  set WIDGETSSTYLES(WidgetsStylesStruct value) {
    _WIDGETSSTYLES = value;
  }

  void updateWIDGETSSTYLESStruct(Function(WidgetsStylesStruct) updateFn) {
    updateFn(_WIDGETSSTYLES);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
