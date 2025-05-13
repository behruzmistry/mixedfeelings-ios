import '/components/mixedfeelingsheader_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth2_login_widget.dart' show Auth2LoginWidget;
import 'package:flutter/material.dart';

class Auth2LoginModel extends FlutterFlowModel<Auth2LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for mixedfeelingsheader component.
  late MixedfeelingsheaderModel mixedfeelingsheaderModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    mixedfeelingsheaderModel =
        createModel(context, () => MixedfeelingsheaderModel());
    passwordVisibility = false;
  }

  @override
  void dispose() {
    mixedfeelingsheaderModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
