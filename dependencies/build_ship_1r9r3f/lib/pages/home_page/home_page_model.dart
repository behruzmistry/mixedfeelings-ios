import '/components/trigger_with_input_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? authOptionString;

  ///  State fields for stateful widgets in this page.

  // Model for TriggerWithInput component.
  late TriggerWithInputModel triggerWithInputModel;

  @override
  void initState(BuildContext context) {
    triggerWithInputModel = createModel(context, () => TriggerWithInputModel());
  }

  @override
  void dispose() {
    triggerWithInputModel.dispose();
  }
}
