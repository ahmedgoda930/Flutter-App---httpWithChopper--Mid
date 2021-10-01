import 'package:flutter/material.dart';
import 'package:network_operation/core/model/language.dart';
import 'package:network_operation/core/model/static_definition.dart';

import 'app_localization.dart';
import 'fiexedservice.dart';

class GlobalService {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String getLabel(Label label) {
    return FixedService.transLabel.firstWhere((e) => e.id == label).name;
  }

  static MaterialStateProperty getMaterialColor(Color d) {
    return MaterialStateProperty.all(d);
  }

  static snackMessage(
      BuildContext context, ResponseEnum responseEnum, int microseconds) {
    Color? cl = Colors.amber;
    if (responseEnum == ResponseEnum.Success)
      cl = Colors.green;
    else if (responseEnum == ResponseEnum.Faild) cl = Colors.red;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Success'),
      backgroundColor: cl,
      duration: Duration(microseconds: microseconds),
    ));
  }

  static String getTranslationString(BuildContext context, Label label) {
    return AppLocalization.of(context)
        .translate(
          getLabel(label),
        )
        .toString();
  }
}
