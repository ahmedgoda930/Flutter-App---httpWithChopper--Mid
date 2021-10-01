import 'package:flutter/material.dart';
import 'package:network_operation/core/model/language.dart';
import 'package:network_operation/core/service/app_localization.dart';
import 'package:network_operation/core/service/fiexedservice.dart';
import 'package:network_operation/core/service/global_service.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final Label title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        AppLocalization.of(context)
            .translate(GlobalService.getLabel(title))
            .toString(),
        style: TextStyle(
          color: Colors.white,
          fontFamily: FixedService.fontbold.fontFamily,
        ),
      ),
    );
  }
}
