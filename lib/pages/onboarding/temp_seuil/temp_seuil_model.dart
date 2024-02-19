import '/flutter_flow/flutter_flow_util.dart';
import 'temp_seuil_widget.dart' show TempSeuilWidget;
import 'package:flutter/material.dart';

class TempSeuilModel extends FlutterFlowModel<TempSeuilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Slider widget.
  double? sliderValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
