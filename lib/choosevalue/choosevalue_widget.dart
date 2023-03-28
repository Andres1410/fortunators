import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choosevalue_model.dart';
export 'choosevalue_model.dart';

class ChoosevalueWidget extends StatefulWidget {
  const ChoosevalueWidget({
    Key? key,
    this.users,
  }) : super(key: key);

  final String? users;

  @override
  _ChoosevalueWidgetState createState() => _ChoosevalueWidgetState();
}

class _ChoosevalueWidgetState extends State<ChoosevalueWidget> {
  late ChoosevalueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoosevalueModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'choosevalue'});
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF14181B),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Visibility(
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
                  'assets/images/black-painted-wall-textured-background_4_(1).png',
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
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 20.0, 20.0),
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
                              child: Image.asset(
                                'assets/images/Vector_(15).png',
                                width: 748.3,
                                height: 321.7,
                                fit: BoxFit.cover,
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
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(0.0, -0.5),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    250.0, 140.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      'https://picsum.photos/seed/335/600',
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      'https://picsum.photos/seed/605/600',
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      'https://picsum.photos/seed/156/600',
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.4),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  320.0, 0.0, 0.0, 150.0),
                              child: Image.asset(
                                'assets/images/Elige_el_valor.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.03, 0.67),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  325.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
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
