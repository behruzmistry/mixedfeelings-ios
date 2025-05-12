import "package:build_ship_1r9r3f/backend/schema/enums/enums.dart"
    as build_ship_1r9r3f_enums;
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (build_ship_1r9r3f_enums.AuthOption):
      return build_ship_1r9r3f_enums.AuthOption.values.deserialize(value) as T?;
    default:
      return null;
  }
}
