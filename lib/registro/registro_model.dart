import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class RegistroModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nombrenewuser widget.
  final nombrenewuserKey = GlobalKey();
  TextEditingController? nombrenewuserController;
  String? nombrenewuserSelectedOption;
  String? Function(BuildContext, String?)? nombrenewuserControllerValidator;
  // State field(s) for emailAdress widget.
  TextEditingController? emailAdressController;
  String? Function(BuildContext, String?)? emailAdressControllerValidator;
  // State field(s) for Telefono widget.
  TextEditingController? telefonoController;
  String? Function(BuildContext, String?)? telefonoControllerValidator;
  // State field(s) for Edad widget.
  TextEditingController? edadController;
  String? Function(BuildContext, String?)? edadControllerValidator;
  // State field(s) for sexo widget.
  TextEditingController? sexoController;
  String? Function(BuildContext, String?)? sexoControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  void dispose() {
    emailAdressController?.dispose();
    telefonoController?.dispose();
    edadController?.dispose();
    sexoController?.dispose();
    passwordController?.dispose();
  }

  /// Additional helper methods are added here.
}
