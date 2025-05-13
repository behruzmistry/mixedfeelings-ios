import '/components/mixedfeelingsheader_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth2_forgot_password_widget.dart' show Auth2ForgotPasswordWidget;
import 'package:flutter/material.dart';

class Auth2ForgotPasswordModel
    extends FlutterFlowModel<Auth2ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for mixedfeelingsheader component.
  late MixedfeelingsheaderModel mixedfeelingsheaderModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {
    mixedfeelingsheaderModel =
        createModel(context, () => MixedfeelingsheaderModel());
  }

  @override
  void dispose() {
    mixedfeelingsheaderModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
