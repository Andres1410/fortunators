import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nombre widget.
  final nombreKey = GlobalKey();
  TextEditingController? nombreController;
  String? nombreSelectedOption;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  // State field(s) for passwordlogin widget.
  final passwordloginKey = GlobalKey();
  TextEditingController? passwordloginController;
  String? passwordloginSelectedOption;
  late bool passwordloginVisibility;
  String? Function(BuildContext, String?)? passwordloginControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordloginVisibility = false;
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
