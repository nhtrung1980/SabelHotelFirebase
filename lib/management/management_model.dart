import '/components/motel_title_widget.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManagementModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  // Model for MotelTitle component.
  late MotelTitleModel motelTitleModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
    motelTitleModel = createModel(context, () => MotelTitleModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
    motelTitleModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
