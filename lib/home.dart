import 'package:flutter/material.dart';
import 'package:network_operation/core/model/language.dart';
import 'package:network_operation/core/service/app_localization.dart';
import 'package:network_operation/core/service/fiexedservice.dart';
import 'package:network_operation/core/service/global_service.dart';
import 'package:network_operation/core/widget/app_drawer.dart';
import 'package:network_operation/main.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, Label.title),
      drawer: AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: GlobalService.width(context) * .9,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(FixedService.tabsscreen);
              },
              child: Text('GoTo Main Operations'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(FixedService.primColor),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static AppBar buildAppBar(BuildContext context, Label title) {
    return AppBar(
      title: Text(AppLocalization.of(context)
          .translate(GlobalService.getLabel(title))
          .toString()),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            onChanged: (Language? value) {
              if (value != null) {
                _changeLanguage(context, value);
              }
            },
            underline: SizedBox(),
            icon: Icon(
              Icons.language,
              color: Colors.white,
            ),
            items: FixedService.lang.map<DropdownMenuItem<Language>>(
              (e) {
                return DropdownMenuItem(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.icon.toString()),
                      Text(e.name.toString()),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  static void _changeLanguage(BuildContext context, Language lang) {
    Locale? _temp;
    switch (lang.langCode) {
      case 'en':
        _temp = Locale(lang.langCode.toString(), 'US');
        break;
      case 'ar':
        _temp = Locale(lang.langCode.toString(), 'EG');
        break;
      case 'tr':
        _temp = Locale(lang.langCode.toString(), 'TR');
        break;
      default:
        _temp = Locale('en', 'US');
        break;
    }
    MyApp.setLocals(context, _temp);
  }
}
