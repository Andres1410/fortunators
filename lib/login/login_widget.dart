import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fortunators/global/global.dart';
import 'package:fortunators/widgets/progress_dialog.dart';

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
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'login'});
    _model.nombreController ??= TextEditingController();
    _model.passwordloginController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

//login con firebase
  validateForm() {
    if (!_model.nombreController.text.contains("@")) {
      Fluttertoast.showToast(msg: "El correo electronico no es valido...");
    } else if (_model.passwordloginController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Contraseña es requerida...");
    } else {
      loginUser();
    }
  }

  Future<dynamic> loginUser() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Procesando, Por favor espere...",
          );
        });
    try {
      final User? firebaseUser = (await fAuth
              .signInWithEmailAndPassword(
        email: _model.nombreController!.text.trim(),
        password: _model.passwordloginController.text.trim(),
      )
              .catchError((msg) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Error: " + msg.toString());
      }))
          .user;
      if (firebaseUser != null) {
        currentFirebaseUser = firebaseUser;
        Fluttertoast.showToast(msg: "Inicio sesion exitoso...");
        context.goNamedAuth('MY_Card', mounted);
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Un error ocurrio al loguearse...");
      }
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
    /*final User? firebaseUser = (await fAuth
            .signInWithEmailAndPassword(
      email: _model.nombreController!.text.trim(),
      password: _model.passwordloginController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: " + msg.toString());
    }))
        .user;*/
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF14181B),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              color: Color(0xFF14181B),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/INICIO_DE_SESION.png',
                ).image,
              ),
            ),
            child: Visibility(
              visible: responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0x990F1113),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/INICIO_DE_SESION.png',
                    ).image,
                  ),
                ),
                child: Visibility(
                  visible: responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 0.0, 290.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-8.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'LOGIN_PAGE_Icon_ayu7o4pd_ON_TAP');
                                    logFirebaseEvent('Icon_navigate_to');

                                    context.pushNamed('conection');
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.angleLeft,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.4, 0.0),
                                child: Image.asset(
                                  'assets/images/Group_1885_3.png',
                                  width: 110.0,
                                  height: 110.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 15.0, 50.0, 30.0),
                          child: Autocomplete<String>(
                            initialValue: TextEditingValue(),
                            optionsBuilder: (textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return [
                                FFLocalizations.of(context).getText(
                                  '41lm5sf2' /* Option 1 */,
                                )
                              ].where((option) {
                                final lowercaseOption = option.toLowerCase();
                                return lowercaseOption.contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            optionsViewBuilder: (context, onSelected, options) {
                              return AutocompleteOptionsList(
                                textFieldKey: _model.nombreKey,
                                textController: _model.nombreController!,
                                options: options.toList(),
                                onSelected: onSelected,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                textHighlightStyle: TextStyle(),
                                elevation: 4.0,
                                optionBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                optionHighlightColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                maxHeight: 200.0,
                              );
                            },
                            onSelected: (String selection) {
                              setState(() =>
                                  _model.nombreSelectedOption = selection);
                              FocusScope.of(context).unfocus();
                            },
                            fieldViewBuilder: (
                              context,
                              textEditingController,
                              focusNode,
                              onEditingComplete,
                            ) {
                              _model.nombreController = textEditingController;
                              return TextFormField(
                                key: _model.nombreKey,
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onEditingComplete,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.nombreController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    '5wh9zxn0' /*  */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText2Family,
                                        color: FlutterFlowTheme.of(context)
                                            .textColor,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2Family),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FFAppState().nameState
                                          ? Color(0xDAFF0F13)
                                          : Colors.white,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF290206),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFCFF6A00),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFCFF6A00),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFF1D1D1D),
                                  suffixIcon: _model
                                          .nombreController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.nombreController?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                textAlign: TextAlign.center,
                                validator: _model.nombreControllerValidator
                                    .asValidator(context),
                              );
                            },
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.1, -5.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50.0, 20.0, 50.0, 10.0),
                                child: Autocomplete<String>(
                                  initialValue: TextEditingValue(),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return [
                                      FFLocalizations.of(context).getText(
                                        'k759gv50' /* Option 1 */,
                                      )
                                    ].where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return AutocompleteOptionsList(
                                      textFieldKey: _model.passwordloginKey,
                                      textController:
                                          _model.passwordloginController!,
                                      options: options.toList(),
                                      onSelected: onSelected,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                      textHighlightStyle: TextStyle(),
                                      elevation: 4.0,
                                      optionBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      optionHighlightColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      maxHeight: 200.0,
                                    );
                                  },
                                  onSelected: (String selection) {
                                    setState(() =>
                                        _model.passwordloginSelectedOption =
                                            selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    _model.passwordloginController =
                                        textEditingController;
                                    return TextFormField(
                                      key: _model.passwordloginKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.passwordloginController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      onFieldSubmitted: (_) async {
                                        logFirebaseEvent(
                                            'LOGIN_passwordlogin_ON_TEXTFIELD_SUBMIT');
                                        logFirebaseEvent('passwordlogin_auth');
                                        GoRouter.of(context).prepareAuthEvent();

                                        final user = await signInWithEmail(
                                          context,
                                          _model.nombreController.text,
                                          _model.passwordloginController.text,
                                        );
                                        if (user == null) {
                                          return;
                                        }

                                        context.goNamedAuth('MY_Card', mounted);
                                      },
                                      autofocus: true,
                                      autofillHints: [AutofillHints.password],
                                      obscureText:
                                          !_model.passwordloginVisibility,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'gi4qqqw5' /*  */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textColor,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FFAppState().passwordState
                                                ? Color(0xDAFF0F13)
                                                : Colors.white,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFF1D1D1D),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => _model
                                                    .passwordloginVisibility =
                                                !_model.passwordloginVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordloginVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            color: Colors.white,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                      textAlign: TextAlign.center,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: _model
                                          .passwordloginControllerValidator
                                          .asValidator(context),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.05, -2.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  validateForm();
                                },
                                text: FFLocalizations.of(context).getText(
                                  'phf58iv3' /* login */,
                                ),
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).black600,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .subtitle2Family,
                                        color: Colors.white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family),
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xDAFF0F13),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'LOGIN_PAGE_Text_x5l55ulg_ON_TAP');
                                    logFirebaseEvent('Text_navigate_to');

                                    context.pushNamed('changePassword');
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'flgq72qa' /* Forgot Password */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: FlutterFlowTheme.of(context)
                                              .platinum,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, -10.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 10.0, 30.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF090F13),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            color: Color(0x3314181B),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Visibility(
                                        visible: responsiveVisibility(
                                          context: context,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'LOGIN_PAGE_Icon_b54mmp0p_ON_TAP');
                                            logFirebaseEvent('Icon_auth');
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            final user =
                                                await signInWithGoogle(context);
                                            if (user == null) {
                                              return;
                                            }

                                            context.goNamedAuth(
                                                'MY_Card', mounted);
                                          },
                                          child: FaIcon(
                                            FontAwesomeIcons.google,
                                            color: Color(0xFFF7B529),
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF090F13),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            color: Color(0x3314181B),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'LOGIN_PAGE_Icon_o12issbp_ON_TAP');
                                          logFirebaseEvent('Icon_auth');
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          final user =
                                              await signInWithApple(context);
                                          if (user == null) {
                                            return;
                                          }

                                          context.goNamedAuth(
                                              'MY_Card', mounted);
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.apple,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF090F13),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            color: Color(0x3314181B),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'LOGIN_PAGE_Icon_unz9qien_ON_TAP');
                                          logFirebaseEvent('Icon_auth');
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          final user =
                                              await signInWithFacebook(context);
                                          if (user == null) {
                                            return;
                                          }

                                          context.goNamedAuth(
                                              'MY_Card', mounted);
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.facebookF,
                                          color: Color(0xFF5600FF),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '17di344m' /*  */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: Color(0xDA5DFF0F),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                            ),
                          ),
                        /* Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -7.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: GradientText(
                                FFLocalizations.of(context).getText(
                                  'f2bt9z1q' /*  */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                      fontSize: 20.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                                colors: [
                                  FlutterFlowTheme.of(context).secondaryColor
                                ],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
                              ),
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
