import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mixedfeelingsheader_model.dart';
export 'mixedfeelingsheader_model.dart';

class MixedfeelingsheaderWidget extends StatefulWidget {
  const MixedfeelingsheaderWidget({super.key});

  @override
  State<MixedfeelingsheaderWidget> createState() =>
      _MixedfeelingsheaderWidgetState();
}

class _MixedfeelingsheaderWidgetState extends State<MixedfeelingsheaderWidget> {
  late MixedfeelingsheaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MixedfeelingsheaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'assets/images/Mixed_Feelings_Logo_(White_Text,_Transparent_BG).png',
        width: 200.0,
        height: 172.2,
        fit: BoxFit.contain,
      ),
    );
  }
}
