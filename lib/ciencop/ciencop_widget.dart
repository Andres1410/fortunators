import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ciencop_model.dart';
export 'ciencop_model.dart';

class CiencopWidget extends StatefulWidget {
  const CiencopWidget({
    Key? key,
    this.users,
    this.saldo,
  }) : super(key: key);

  final String? users;
  final String? saldo;

  @override
  _CiencopWidgetState createState() => _CiencopWidgetState();
}

class _CiencopWidgetState extends State<CiencopWidget> {
  late CiencopModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CiencopModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ciencop'});
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF14181B),
        body: Visibility(
          visible: responsiveVisibility(
            context: context,
            tablet: false,
            desktop: false,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 2.2,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              color: Color(0xFF14181B),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/fortuimage.png',
                ).image,
              ),
            ),
            child: Visibility(
              visible: responsiveVisibility(
                context: context,
                tablet: false,
                desktop: false,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tablet: false,
                      desktop: false,
                    ))
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(0.08, 0.03),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 0.0, 0.0),
                                child: Image.asset(
                                  'assets/images/sala.png',
                                  width: 752.4,
                                  height: 350.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(-0.79, -0.85),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    400.0, 0.0, 0.0, 140.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'zjk2lkdy' /* online */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Color(0xFF010101),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 200.0,
                                decoration: BoxDecoration(),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.7),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  300.0, 280.0, 0.0, 0.0),
                              child: Image.asset(
                                'assets/images/fortunat.png',
                                width: 190.0,
                                height: 20.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.93, -0.48),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  390.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/linegreen.png',
                                      width: 8.0,
                                      height: 251.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.76, -0.6),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  500.0, 230.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.76, -0.6),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  90.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.76, -0.6),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  90.0, 60.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.76, -0.6),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  90.0, 160.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.76, -0.6),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  90.0, 220.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.76, -0.6),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  500.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.76, -0.6),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  500.0, 80.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.76, -0.6),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  500.0, 160.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/fortuna.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
