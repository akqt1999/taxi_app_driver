import 'package:flutter/material.dart';
import 'package:taxi_app_flutter/helpers/style.dart';
import 'package:taxi_app_flutter/widgets/loading.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/lg.png"),
            Loading(),
          ],
        )
    );
  }
}