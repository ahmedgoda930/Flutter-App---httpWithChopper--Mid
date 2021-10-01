import 'package:flutter/material.dart';
import 'package:network_operation/core/service/fiexedservice.dart';
import 'package:network_operation/core/service/global_service.dart';

import '../../home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _nativgateHome() async {
    await Future.delayed(Duration(microseconds: 30000), () async {
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  void initState() {
    super.initState();
    _nativgateHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Network App',
      //     style: Theme.of(context).textTheme.headline1!.copyWith(
      //           fontStyle: FontStyle.italic,
      //         ),
      //   ),
      // ),
      backgroundColor: FixedService.primColor,
      body: Center(
        child: Container(
          height: GlobalService.height(context) / 3,
          width: GlobalService.width(context) / 3,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/imgs/logo.gif'),
          ),
        ),
      ),
    );
  }
}
