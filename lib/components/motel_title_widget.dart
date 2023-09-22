import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'motel_title_model.dart';
export 'motel_title_model.dart';

class MotelTitleWidget extends StatefulWidget {
  const MotelTitleWidget({Key? key}) : super(key: key);

  @override
  _MotelTitleWidgetState createState() => _MotelTitleWidgetState();
}

class _MotelTitleWidgetState extends State<MotelTitleWidget> {
  late MotelTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MotelTitleModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.hotel = await queryHotelsRecordOnce(
        queryBuilder: (hotelsRecord) =>
            hotelsRecord.where('user_id', isEqualTo: currentUserUid),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                valueOrDefault<String>(
                  _model.hotel?.name,
                  'No Motel Name',
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Urbanist',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    _model.hotel?.address,
                    'No Address',
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Manrope',
                        fontSize: 16.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
