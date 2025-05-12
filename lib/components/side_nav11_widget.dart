import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'side_nav11_model.dart';
export 'side_nav11_model.dart';

class SideNav11Widget extends StatefulWidget {
  const SideNav11Widget({super.key});

  @override
  State<SideNav11Widget> createState() => _SideNav11WidgetState();
}

class _SideNav11WidgetState extends State<SideNav11Widget> {
  late SideNav11Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNav11Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Make this side nav a component. You can then set the colors of the icons to be selected base on an integer.
        Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          width: 72.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF6F61EF),
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: Color(0xFFE5E7EB),
                offset: Offset(
                  1.0,
                  0.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Color(0x9AFFFFFF),
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo should go here.
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Icon(
                    Icons.add_task_rounded,
                    color: Colors.white,
                    size: 32.0,
                  ),
                ),
                Divider(
                  height: 12.0,
                  thickness: 2.0,
                  color: Color(0x4D9489F5),
                ),
                Container(
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF6F61EF),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.ssid_chart_rounded,
                      color: Color(0x9AFFFFFF),
                      size: 24.0,
                    ),
                  ),
                ),
                Container(
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: Color(0x4D9489F5),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0x4D9489F5),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.forum_rounded,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
                Container(
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF6F61EF),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.groups_sharp,
                      color: Color(0x9AFFFFFF),
                      size: 24.0,
                    ),
                  ),
                ),
                Container(
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF6F61EF),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.table_chart_outlined,
                      color: Color(0x9AFFFFFF),
                      size: 24.0,
                    ),
                  ),
                ),
                Container(
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF6F61EF),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.settings_rounded,
                      color: Color(0x9AFFFFFF),
                      size: 24.0,
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
